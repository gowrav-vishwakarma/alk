<?php
class Model_Gift extends Model_Table {
	var $table= "gift";
	function init(){
		parent::init();

		$this->hasOne('Topups','gift_from_id');
		$this->hasOne('Topups','gift_to_id');
		$this->addField('requested_level')->enum(array(1,2,3,4))->system(true);
		$this->addField('gift_send_date')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('status')->enum(array("Pending","Approved","Rejected","Admin Approved"))->defaultValue('Pending');
		$this->addField("approved_rejected_date")->type('date')->defaultValue(null);
		$this->add("filestore/Field_Image","bank_slip_id")->type('image');
		// $this->addField('bank_slip_id');
		$this->addField('last_update_date')->system(true)->defaultValue(date('Y-m-d H:i:s'));

		$this->addHook('beforeSave',$this);
	}

	function beforeSave(){
		$this['last_update_date'] = date('Y-m-d H:i:s');
	}

	function approve(){
		if(!$this->loaded()) throw $this->exception('Request not loaded, something wrong happened');
		$this['status'] = 'Approved';
		$this->save();
		if($this->ref('gift_from_id')->ref('GiftSent')->addCondition('status','Approved')->count()->getOne() == 4){
			$sender = $this->ref('gift_from_id');
			if($sender['is_withdrawable'] == false){
				$sender['is_withdrawable']=true;
				$sender->save();

				$member= $sender->ref('member_id');
				$member['points_available'] = $member['points_available'] + 6000;
				$member->save();
			}
		}

		// Nutralize any complins for this gift IF ANY

		$com=$this->add('Model_Complain');
		$com->addCondition('gift_id',$this->id);
		$com->addCondition('status','Send');
		
		foreach($com as $c){
			$com['status']='Aprroved By Receiver';
			$com->saveAndUnload();
		}



		// throw $this->exception('approved');
	}

	function reject(){
		if(!$this->loaded()) throw $this->exception('Request not loaded, something wrong happened');
		$this['status'] = 'Rejected';
		$this->save();
		// if($this->ref('gift_from_id')->ref('GiftSent')->addCondition('status','Approved')->count()->getOne() == 4){
		// 	$sender = $this->ref('gift_from_id');
		// 	$sender['is_withdrawable']=true;
		// 	$sender->save();
		// }
	}

	function sendComplaint($from_id,$against_id,$gift_id=null,$pin_request_id=null,$msg){
		if(!$this->loaded()) throw $this->exception('Request not loaded, something wrong happened');
		$this['status']='Complained';
		$this->save();
		
		$com=$this->add('Model_Complain');
		$com['from_id']=$from_id;
		$com['against_id']=$against_id;
		$com['message']=$msg;
		
		$com['gift_id'] = $this->id;

		$com->save();

	}
}