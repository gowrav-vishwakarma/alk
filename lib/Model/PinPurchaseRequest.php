<?php
class Model_PinPurchaseRequest extends Model_Table{
	var $table="pin_purchase_request";
	function init(){
		parent::init();

		$this->hasOne('Topups','request_from_id');
		$this->hasOne('Topups','currently_requested_to_id');
		$this->addField('request_at')->type('date');
		$this->addfield('status')->enum(array('Pending','Accepted',"Complained",'forwarded','Rejected'));
		$this->add("filestore/Field_Image","bank_slip_id")->type('image');//->display(array("grid"=>'picture'));

		$this->addExpression('pin_purchase_request_from')->set(function ($m,$q){
			$m1=$m->add('Model_PinPurchaseRequest');
			$m1->table_alias='temp11';

			$mem=$m1->join('topups.id','request_from_id')->join('member.id','member_id');
			$mem->addField('ffffffname','name');

			$m1->addCondition('id',$q->getField('id'));
			return $m1->fieldQuery('ffffffname');
		});

		$this->addExpression('pin_purchase_request_to')->set(function ($m,$q){
			$m1=$m->add('Model_PinPurchaseRequest');
			$m1->table_alias='temp11';

			$mem=$m1->join('topups.id','currently_requested_to_id')->join('member.id','member_id');
			$mem->addField('ffffffname','name');

			$m1->addCondition('id',$q->getField('id'));
			return $m1->fieldQuery('ffffffname');
		});

	}

	function generateRequest($points){
		// search best person to send request
		// then add an entry with from this->api->auth->modelid to searched persons
	}

	function sendToAdmin(){

	}

	function approve(){
		// First check if you have such points available
		// Send point to the requester and less from your self ... 
	}

	function reject(){
		//reject the request 
		//forward the request to another available person
	}


}