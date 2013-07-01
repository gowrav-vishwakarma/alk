<?php

class page_admin_complaints extends Page {
	function page_index(){

		$complaints = $this->add('Model_Complain');
		$complaints->addCondition('status','Send');

		$grid=$this->add('Grid');
		$grid->setModel($complaints);

		$grid->addColumn('Expander','Action');
	}

	function page_Action(){
		$this->api->stickyGET('complains_id');
		$complaints = $this->add('Model_Complain')->load($_GET['complains_id']);

		if($complaints['gift_id']!=0)
			$object=$this->add('Model_Gift')->addCondition('id',$complaints['gift_id'])->tryLoadAny();
		else
			$object=$this->add('Model_PinPurchaseRequest')->addCondition('id',$complaints['pin_request_id'])->tryLoadAny();

		$this->add('HtmlElement')->setElement('img')->setAttr('src',$object['bank_slip']);

	}
}