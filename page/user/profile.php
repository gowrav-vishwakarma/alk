<?php

class page_user_profile extends page_user {
	function init(){
		parent::init();

		$form= $this->add('Form');
		$form->setModel($this->api->auth->model);
		$form->addSubmit('Update');

		if($form->isSubmitted()){
			$form->update();
			$this->api->auth->model->reload();
			$form->js()->reload()->execute();
		}

	}
}