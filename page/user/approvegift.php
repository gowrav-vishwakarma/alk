<?php

class page_user_approvegift extends Page{
	function init(){
		parent::init();

		$this->api->stickyGET('request_id');

		$r=$this->add('Model_Gift');
		$r->load($_GET['request_id']);

		if($r['status'] != 'Pending' AND $r['status'] != 'Complained') {
			$this->add('View_Error')->set('This Gift is already ' . $r['status']);
			// return;
		}		
		$this->add('H2')->set('Are you sure, you want to approve Gift from '.$r->ref('gift_from_id')->get('name').' and mark as Received ... ?');

		$form=$this->add('Form');
		$form->addField('hidden','request_id')->set($_GET['request_id']);
		$form->addSubmit('Approve');

		if($form->isSubmitted()){
			$r=$this->add('Model_Gift');
			$r->load($form->get('request_id'));
			$r->approve();
			$form->js(null,$form->js()->_selector('.gift_income_'.$form->get('request_id'))->trigger('reload_me'))->univ()->closeDialog()->execute();
		}
		
	}
}