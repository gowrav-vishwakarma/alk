<?php

class page_user_pinpurchaseincome extends Page{
	function init(){
		parent::init();

		$this->api->stickyGET('request_id');
		$this->api->stickyGET('view_id');

		$request_to_take=$this->add("Model_PinPurchaseRequest")->addCondition('id',$_GET['request_id'])->load($_GET['request_id']);

		$request_from_member = $this->add('Model_Member')->addCondition('id',$request_to_take['request_from_id'])->tryLoadAny();

		$this->add('H3')->set('Your got this request from the follwoing');
		$grid=$this->add('Grid');
		$grid->setModel($request_from_member,array("name",'mobile_number','email_id','bank_name','account_number','IFSC','bank_location'));

		$this->add('H3')->set('your Action');
		$cols=$this->add('Columns');
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);

		$img=$right->add('HtmlElement')->setElement('img')->setAttr('src',$request_to_take['bank_slip']);

		if($request_to_take['status']=='Pending' OR $request_to_take['status']=='Rejected'){
			$lc=$left->add('Columns');
			$lc_l=$lc->addColumn(6);
			$lc_r=$lc->addColumn(6);

			$approve_form=$lc_l->add('Form');
			$approve_form->addSubmit('Approve');

			$reject_form=$lc_r->add('Form');
			$reject_form->addSubmit('Reject');
			
			if($approve_form->isSubmitted()){

				if($request_to_take['bank_slip_id']==0) $approve_form->js()->univ()->errorMessage("No Bank Slip Found, Cannot Approve")->execute();;

				$request_to_take->approve();
				$approve_form->js(null,array(
										$approve_form->js()->_selector('#'.$_GET['view_id'])->trigger('reload_me'),
										$approve_form->js()->_selector('.wallet')->trigger('reload_me'),
										)
									)->univ()->closeDialog()->execute();
			}

			if($reject_form->isSubmitted()){
				$request_to_take->reject();
				$approve_form->js(null,$approve_form->js()->_selector('#'.$_GET['view_id'])->hide())->univ()->closeDialog()->execute();
			}
			
		}

		if($request_to_take['status']=="Complained"){
			$left->add('View_Error')->set('This Payement is complained to admin');
		}


	}
}