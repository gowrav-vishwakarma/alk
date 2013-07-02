<?php

class page_admin_pinrequestmanagement extends Page {

	function page_index(){
		$pinrequests = $this->add('Model_PinPurchaseRequest');
		$pinrequests->addCondition('currently_requested_to_id',$this->api->auth->model->id);

		$grid=$this->add('Grid');
		$grid->setModel($pinrequests);
		$grid->addColumn('Button','Transfer');
		$grid->addClass('mygrid');
		$grid->js('reload_me')->reload();

		if($_GET['Transfer']){
			$this->js()->univ()->frameURL("Transfer this request to",$this->api->url('./transfer',array('request_id'=>$_GET['Transfer'])))->execute();
		}
	}

	function page_transfer(){
		$this->api->stickyGET('request_id');
		$request=$this->add('Model_PinPurchaseRequest')->load($_GET['request_id']);

		$point_holders=$this->add('Model_MemberAll')->addCondition('points_available','>=', ($request['points_required'] * 3000) );

		$form=$this->add('Form');
		$form->addField('autocomplete/basic','transfer_to')->validateNotNull()->mustMatch()->setModel($point_holders);
		$form->addField('hidden','msg');
		$form->addSubmit('Transfer');

		if($form->isSubmitted()){
			if(! $form->get('transfer_to')) $form->displayError('transfer_to_2',"Must specify the person");
			$request['currently_requested_to_id'] = $form->get('transfer_to');
			$request['transfer_time'] = $request['transfer_time'] + 1;
			$request->save();
			$form->js(null,$form->js()->_selector('.mygrid')->trigger('reload_me'))->univ()->closeDialog()->execute();
		}
	}
}