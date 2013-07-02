<?php
class Model_PinPurchaseRequest extends Model_Table{
	var $table="pin_purchase_request";
	function init(){
		parent::init();

		$this->hasOne('Member','request_from_id');
		$this->hasOne('Member','currently_requested_to_id');
		$this->addField('request_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->addfield('status')->enum(array('Pending','Accepted',"Complained",'forwarded','Rejected'))->defaultValue('Pending');
		$this->add("filestore/Field_Image","bank_slip_id")->type('image');//->display(array("grid"=>'picture'));
		$this->addField('transfer_time');
		$this->addField('points_required');
		$this->addField('last_update_date')->type('date');
		// $this->addExpression('pin_purchase_request_from')->set(function ($m,$q){
		// 	return $m->ref('request_from_id')->fieldQuery('name');
		// });

		// $this->addExpression('pin_purchase_request_to')->set(function ($m,$q){
		// 	return $m->ref('currently_requested_to_id')->fieldQuery('name');
		// });

		$this->addHook('beforeSave',$this);

	}

	function beforeSave(){
		$this['last_update_date'] = date('Y-m-d H:i:s');
	}


	function generateRequest($points){
		// search best person to send request
		// then add an entry with from this->api->auth->modelid to searched persons
		$this['request_from_id'] = $this->api->auth->model->id;
		$this['currently_requested_to_id'] = 1;
		$this['points_required'] = $points;
		$this->save();
	}

	function sendComplaint($from_id,$against_id,$msg){
		if(!$this->loaded()) throw $this->exception('Request not loaded, something wrong happened');
		$this['status']='Complained';
		$this->save();
		
		$com=$this->add('Model_Complain');
		$com['from_id']=$from_id;
		$com['against_id']=$against_id;
		$com['message']=$msg;
		
		$com['pin_request_id'] = $this->id;

		$com->save();

	}

	function approve(){
		// First check if you have such points available
		$points= $this->ref('currently_requested_to_id')->get('points_available');
		if($points < 3000)
			$this->api->js()->univ()->errorMessage("Not suficcient points available, [ $points ]")->execute();
		// Send point to the requester and less from your self ... 

		$purchaser= $this->add('Model_MemberAll')->addCondition("id",$this['request_from_id'])->tryLoadAny();
		$purchaser['points_available'] = $purchaser['points_available'] + 3000;
		$purchaser->save();

		$seller=$this->add('Model_MemberAll')->addCondition("id",$this['currently_requested_to_id'])->tryLoadAny();
		$seller['points_available'] = $seller['points_available'] - 3000;
		$seller->save();

		if($this->api->auth->model->id == 1)
			$this['status']='Approved By Admin';
		else
			$this['status']='Approved';

		$this->save();


	}

	function reject(){
		//reject the request 
		$this['currently_requested_to_id']=1;
		$this['status']='Pending';
		$this->save();
		//forward the request to another available person
	}


}