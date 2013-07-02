<?php

class page_user_profile extends page_user {
	function init(){
		parent::init();

		$form= $this->add('Form');
		$form->setModel($this->api->auth->model,array('password'));
		$form->addField('password','re_password')->validateNotNull();
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			if($form->get('password') != $form->get('re_password')) $form->displayError('re_password',"Password must match");
			$form->update();
			$this->api->auth->model->reload();
			$form->js()->reload()->execute();
		}

	}
}