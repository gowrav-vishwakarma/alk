<?php

class page_forgotpassword extends Page {
	
	function init(){
		parent::init();




		$form = $this->add('Form');

		if($_GET['success']){
			$form->add('View_Info')->set('Password sent succesfully on your email');
		}

		$form->addField('line','login_email_id');
		$form->addSubmit('Send My Password')->js('click')->hide();

		if($form->isSubmitted()){

			$p = $this->add('Model_MemberAll');
			$p->addCondition('email_id',$form->get('login_email_id'));
			$p->tryLoadAny();

			if(!$p->loaded()) $form->displayError('login_email_id',"This Username not found");

			$tm=$this->add( 'TMail_Transport_PHPMailer' );
			$msg=$this->add( 'SMLite' );
			$msg->loadTemplate( 'mail/forgotpasswordemail' );
			$msg->trySet( 'password', $p['password'] );
			// $msg->trySet( 'custom_message', $form->get( 'custom_message' ) );
			// $msg->trySet( 'sponsor', $this->api->auth->model['username'] );
			// $msg->trySet( 'leg', 'A' );

			$email_body=$msg->render();
			$email_id = $form->get('login_email_id');

			$subject ="Password recovery email";
			try{
				$tm->send( $email_id, "help3gift@gmail.com", $subject, $email_body ,null);
			}catch( phpmailerException $e ) {
				throw $this->exception( $e->errorMessage() );
			}catch( Exception $e ) {
				throw $e;
			}

			$form->js()->reload(array('success'=>1))->execute();
		}


	}
}