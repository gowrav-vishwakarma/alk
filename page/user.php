<?php
class page_user extends Page {

	protected $user_menu;
	
	function init(){
		parent::init();

		$this->add('H3')->set('Welcome '. $this->api->auth->model['name']);

		$this->user_menu = $this->add('Menu');
		$this->user_menu->addMenuItem('user_dashboard','Dashboard');
		$this->user_menu->addMenuItem('user_newregistration','New Registration');
		$this->user_menu->addMenuItem('user_profile','Profile');
		$this->user_menu->addMenuItem('logout','Logout');
	}
}