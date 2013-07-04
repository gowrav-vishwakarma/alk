<?php

class page_user_newregistration extends page_user {
	function init(){
		parent::init();

		$member= $this->add('Model_Member')->load($this->api->auth->model->id);

		if($member['points_available'] < 3000) $this->add('View_Error')->set('You do not have sufficient points available');

		$form=$this->add('Form');
		$form->setModel('Member',array("sponsor_id",'name','email_id','password','mobile_number','city','state','bank_name','account_number','IFSC','bank_location'));

		$form->getElement('sponsor_id')->model->_dsql()->where('points_available','>=',3000);

		$form->addField('password','re_password');
		$form->add('Order')->move('re_password','after','password')->now();

		$form->addSubmit();

		if($form->isSubmitted()){
			if($form->get('password') != $form->get('re_password'))
				$form->displayError('re_password','Password must match');

			$m=$this->add('Model_MemberAll')->addCondition('email_id',$form->get('email_id'))->tryLoadAny();
			if($m->loaded()) $form->displayError('email_id','This Email ID is already registered, Kindly use another.');

			if(!$form->get('sponsor_id')) $form->displayError('sponsor',"Sponsor id is must");
			
			if($member['points_available'] < 3000) 
				$form->js()->univ()->errorMessage("You do not have suficient points, Purchse pin points please")->execute();
			
			$member['points_available'] = $member['points_available'] - 3000;
			$member->save();

			$form->update();
			$form->js(null,$form->js()->_selector('.wallet')->trigger('reload_me'))->reload()->execute();
		}

	}
}