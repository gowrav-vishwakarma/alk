<?php

class page_admin_complaints extends Page {
	function page_index(){

		$complaints = $this->add('Model_Complain');
		$complaints->addCondition('status','Send');

		$grid=$this->add('Grid');
		$grid->setModel($complaints);
		$grid->addClass('myclass');
		$grid->js('reload_me')->reload();

		$grid->addColumn('Expander','Action');
	}

	function page_Action(){
		$this->api->stickyGET('complains_id');
		$complaints = $this->add('Model_Complain')->load($_GET['complains_id']);

		if($complaints['gift_id']!=0)
			$object=$this->add('Model_Gift')->addCondition('id',$complaints['gift_id'])->tryLoadAny();
		else
			$object=$this->add('Model_PinPurchaseRequest')->addCondition('id',$complaints['pin_request_id'])->tryLoadAny();

		$cols=$this->add('Columns');
		$left = $cols->addColumn(6);
		$right = $cols->addColumn(6);
		$this->add('HtmlElement')->setElement('br');

		$this->add('HtmlElement')->setElement('img')->setAttr('src',$object['bank_slip']);



		$form_approve=$left->add('Form');
		$form_approve->addSubmit("Approve");

		$form_reject = $right->add('Form');
		$form_reject->addSubmit('Reject');

		if($form_approve->isSubmitted()){
			$complaints->approveByAdmin();
			$form_approve->js(null,$form_approve->js()->_selector('.myclass')->trigger('reload_me'))->univ()->closeDialog()->execute();
		}

		if($form_reject->isSubmitted()){
			$complaints->rejectByAdmin();
			$form_reject->js(null,$form_reject->js()->_selector('.myclass')->trigger('reload_me'))->univ()->closeDialog()->execute();

		}

	}
}