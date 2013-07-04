<?php

class page_user_pinpurchasepayment extends Page {
	function init(){
		parent::init();

		$this->api->stickyGET('request_id');
		$this->api->stickyGET('view_id');

		$request_to_pay=$this->add("Model_PinPurchaseRequest")->addCondition('id',$_GET['request_id'])->load($_GET['request_id']);
		
		$request_to_member = $this->add('Model_Member')->addCondition('id',$request_to_pay['currently_requested_to_id'])->tryLoadAny();
		// $request_to_member->join('topups.member_id')->join('pin_purchase_request.currently_requested_to_id')->addField('request_pk','id');
		// $request_to_member->addCondition('request_pk',$request_to_pay->id);
		if($request_to_member->id == 1) {
			$this->add('H3')->set('Your request is sent, Please wait while the request is transfered.');
			return;
		}else{
			$this->add('H3')->set('Your request is sent to the follwoing');
			$grid=$this->add('Grid');
			$grid->setModel($request_to_member,array("name",'mobile_number','email_id','bank_name','account_number','IFSC','bank_location'));
		}


		if($request_to_pay['status']=='Pending') $this->add('H3')->set('Manage Your BankSlip');
		$cols=$this->add('Columns');
		$left=$cols->addColumn(6);
		$right=$cols->addColumn(6);


		$img=$right->add('HtmlElement')->setElement('img')->setAttr('src',$request_to_pay['bank_slip']);
		// $grid->getColumn('bank_slip_id')->js('click')->_selector('#pinslip_'.$request_to_pay->id)->univ()->dialogURL('Image Preiview',$this->api->url('imageview',array('image_url'=>$request_to_pay['bank_slip'])));


		if($request_to_pay['status']=='Pending'){
			$form = $left->add('Form');
			$form->setModel($request_to_pay,array('bank_slip_id'));
			$form->addSubmit('Finally Submit');

			if($form->isSubmitted()){
				$form->update();
				$form->js(null, $form->js()->_selector('#'.$_GET['view_id'])->trigger('reload_me'))->univ()->closeDialog()->execute();
			}
			
		}

		if($request_to_pay['status']=='Rejected' OR $request_to_pay['status']=='Pending' OR $request_to_pay['status']=='Rejected By Admin'){
			$left->add('H3')->set('Your Payment is rejected/Not approved, you can send a complaine to admin')->setStyle('color','red');
			$complaint = $left->add('Form');
			$complaint->addField('line','msg','Message')->validateNotNull();
			$complaint->addSubmit("Send To Admin");

			if($complaint->isSubmitted()){

				$gift_to_member=$this->add('Model_Member');
				$gift_to_member->join('topups.member_id')->join('pin_purchase_request.currently_requested_to_id')->addField("request_pk",'id');
				$gift_to_member->addCondition('request_pk',$_GET['request_id']);
				$gift_to_member->tryLoadAny();

				$request_to_pay->sendComplaint($this->api->auth->model->id, $gift_to_member->id,$complaint->get('message'));
				$complaint->js(null, $complaint->js()->_selector('#'.$_GET['view_id'])->trigger('reload_me'))->univ()->closeDialog()->execute();
			}
		}

		if($request_to_pay['status']=="Complained"){
			$left->add('View_Error')->set('This Payement is complained to admin');
		}

	}
}