<?php

class page_user_newregistration extends page_user {
	function init(){
		parent::init();

		$member= $this->add('Model_Member')->load($this->api->auth->model->id);

		if($member['points_available'] < 3000) $this->add('View_Error')->set('You do not have sufficient points available');

		$form=$this->add('Form');
		$form->setModel('Member');

		$form->addField('password','re_password');
		$form->add('Order')->move('re_password','after','password')->now();

		$form->addSubmit();

		if($form->isSubmitted()){
			if($form->get('password') != $form->get('re_password'))
				$form->displayError('re_password','Password must match');
			
			if($member['points_available'] < 3000) 
				$form->js()->univ()->errorMessage("You do not have suficient points, Purchse pin points please")->execute();
			$form->update();
			$form->js()->reload()->execute();
		}

	}
}