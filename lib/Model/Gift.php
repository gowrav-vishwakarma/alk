<?php
class Model_Gift extends Model_Table {
	var $table= "gift";
	function init(){
		parent::init();

		$this->hasOne('MemberAll','gift_from_id')->caption('Help from');
		$this->hasOne('MemberAll','gift_to_id');
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
		if($this->api->auth->model->id == 1)
			$this['status'] = 'Approved By Admin';
		else
			$this['status'] = 'Approved';

		$this['approved_rejected_date'] = date('Y-m-d H:i:s');

		$this->save();
		$approved_gifts_count= $this->ref('gift_from_id')->ref('GiftSent')->addCondition('status',"like",'%Approved%')->count()->getOne();
		if(($approved_gifts_count % 4 == 0)){
			$sender = $this->ref('gift_from_id');
			$sender['points_available'] = $sender['points_available'] + 6000;
			$sender->save();
		}

		// Nutralize any complins for this gift IF ANY

		$com=$this->add('Model_Complain');
		$com->addCondition('gift_id',$this->id);
		$com->addCondition('status','Send');
		
		foreach($com as $c){
			if($this->api->auth->model->id == 1)
				$com['status']='Aprroved By Admin';
			else
				$com['status']='Aprroved By Receiver';
			$com->saveAndUnload();
		}



		// throw $this->exception('approved');
	}

	function reject(){
		if(!$this->loaded()) throw $this->exception('Request not loaded, something wrong happened');
		if($this->api->auth->model->id == 1)
			$this['status'] = 'Rejected By Admin';
		else
			$this['status'] = 'Rejected';

		$this['approved_rejected_date'] = date('Y-m-d H:i:s');

		$this->save();
		// if($this->ref('gift_from_id')->ref('GiftSent')->addCondition('status','Approved')->count()->getOne() == 4){
		// 	$sender = $this->ref('gift_from_id');
		// 	$sender['is_withdrawable']=true;
		// 	$sender->save();
		// }
	}

	function sendComplaint($from_id,$against_id,$msg){
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