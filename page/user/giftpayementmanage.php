<?php


class page_user_giftpayementmanage extends Page {
	function init(){
		parent::init();

		$this->api->stickyGET('view_id');
		$this->api->stickyGET('gift_id');

		$gift=$this->add('Model_Gift')->addCondition('id',$_GET['gift_id'])->load($_GET['gift_id']);

		$gift_to_member=$this->add('Model_Member');
		$gift_to_member->join('topups.member_id')->join('gift.gift_to_id')->addField("gift_pk",'id');
		$gift_to_member->addCondition('gift_pk',$_GET['gift_id']);



		$this->add('H3')->set('Send Gift To');
		$gift_details = $this->add('Grid');
		$gift_details->setModel($gift_to_member,array('name','mobile_number','email_id','bank_name','account_number','IFSC','bank_location'));


		$cols=$this->add('Columns');
		$left = $cols->addColumn(6);
		$right = $cols->addColumn(6);

		$right->add('HtmlElement')->setElement('img')->setAttr('src',$gift['bank_slip']);

		if($gift['status']=='Pending'){
			$left->add('H4')->set('Manage your bank slip');
			$image_form=$left->add('Form');
			$image_form->setModel($gift,array('bank_slip_id'));
			$image_form->addSubmit('Finally Submit');

			if($image_form->isSubmitted()){
				$image_form->update();
				$image_form->js(null,$image_form->js()->_selector('#'.$_GET['view_id'])->trigger('reload_me'))->univ()->closeDialog()->execute();
			}
		}

		if($gift['status']=='Complained'){
			$left->add('View_Error')->set('This Payment is marked as Compalained, You cannot change Bank Slip now');
		}

		if($gift['status']=='Rejected'){
			$complaint_form = $left->add('Form');
			$complaint_form->addField('line','message');
			$complaint_form->addSubmit('Send to Admin');

			if($complaint_form->isSubmitted()){
				$gift->complaint();
				$complaint_form->js()->univ()->closeDialog()->execute();
			}
		}


	}
}