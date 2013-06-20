<?php

class page_user_pinpurchaserequest extends Page{
	function init(){
		parent::init();

		$form = $this->add('Form');
		$form->addField('password','your_password');
		$form->addField('number','points_required');
		$form->addSubmit("Post Request");

		if($form->isSubmitted()){
			$m=$this->add('Model_Member')->load($this->api->auth->model->id);
			if($form->get('your_password') != $m['password']) $form->displayError('your_password','Password is not correct');

			if($form->get('points_required') > 5) $form->displayError('points_required','You cannot request for more then 5 points at a time');

			
		}
	}
}