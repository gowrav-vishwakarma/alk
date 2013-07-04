<?php
class page_user extends Page {

	protected $user_menu;
	
	function init(){
		parent::init();

		$this->add('H3')->set('Welcome '. $this->api->auth->model['email_id']);

		$this->user_menu = $this->add('Menu');
		$this->user_menu->addMenuItem('user_dashboard','Dashboard');
		$this->user_menu->addMenuItem('user_newregistration','New Registration');
		$this->user_menu->addMenuItem('user_profile','Change Password');
		$this->user_menu->addMenuItem('user_downline','Downline Information');
		$this->user_menu->addMenuItem('user_income','My Income');
		$this->user_menu->addMenuItem('logout','Logout');

		// $this->api->add('View_Wallet',null,'wallet');
		$this->api->add('View_Wallet',null,'wallet');
		$this->add('HtmlElement')->setElement('br');
	}
}