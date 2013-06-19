<?php
class Model_Gift extends Model_Table {
	var $table= "gift";
	function init(){
		parent::init();

		$this->hasOne('Topups','gift_from_id');
		$this->hasOne('Topups','gift_to_id');
		$this->addField('requested_level')->enum(array(1,2,3,4))->system(true);
		$this->addField('gift_send_date')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('status')->enum(array("Sent","Approved","Rejected","Admin Approved"))->defaultValue('Sent');
		$this->addField("approved_rejected_date")->type('date')->defaultValue(null);
		$this->addField('bank_slip_id');
	}

	function approve(){
		$this['status'] = 'Approved';
		$this->save();
		if($this->ref('gift_from_id')->ref('GiftSent')->addCondition('status','Approved')->count()->getOne() == 4){
			$sender = $this->ref('gift_from_id');
			$sender['is_withdrawable']=true;
			$sender->save();
		}
		// throw $this->exception('approved');
	}

	function reject(){
		
	}
}