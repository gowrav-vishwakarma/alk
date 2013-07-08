<?php

class page_user_pointstransfer extends page_user {
	function init(){
		parent::init();

		$form=$this->add('Form',null,null,array('form_horizontal'));
		if($_GET['success']) $form->add('View_Info')->set('Points Transfered');

		$form->addField('line','transfer_to')->validateNotNull();
		$form->addField('number','no_of_points')->validateNotNull();
		$form->addField('password','your_password');
		$form->addSubmit("Transfer");

		$tabs=$this->add('Tabs');
		$rt=$tabs->addTab('Received Points');
		$st=$tabs->addTab('Send Points');

		//Received Grid 
		$rec_m= $this->add('Model_PointsTransfer');
		$rec_m->addCondition('to_id',$this->api->auth->model->id);
		$rg=$rt->add('Grid');
		$rg->setModel($rec_m);

		//Send Grid 
		$send_m= $this->add('Model_PointsTransfer');
		$send_m->addCondition('from_id',$this->api->auth->model->id);
		$sg=$st->add('Grid');
		$sg->setModel($send_m);


		if($form->isSubmitted()){
			// Validate Password
			$u=$this->add('Model_MemberAll');
			$u->load($this->api->auth->model->id);
			if($u['password'] != $form->get('your_password')) $form->displayError('your_password','Your Password is not correct');

			// Validate Transfer To
			$m=$this->add('Model_MemberAll');
			$m->addCondition('email_id',$form->get('transfer_to'));
			$m->tryLoadAny();

			if($m->id == $u->id) $form->displayError('transfer_to','You cannot transfer pins to your self');

			if(!$m->loaded()) $form->displayError('transfer_to',"No Member found with this email id");

			// Check if points vailable to transfer
			if($u['points_available'] < ($form->get('no_of_points') * 3000)) $form->displayError('no_of_points',"You do not have sufficient points");

			// Transfer points 
			$t=$this->add('Model_PointsTransfer');
			$t['from_id']=$u->id;
			$t['to_id']=$m->id;
			$t['no_of_points'] = $form->get('no_of_points');
			$t->save();

			$form->js()->reload(array('success'=>1))->execute();
		}
	}
}