<?php

class View_Wallet extends View {
	function init(){
		parent::init();
		
		$this->addClass('wallet');
		$this->js('reload_me')->reload();

		$member = $this->add('Model_Member')->load($this->api->auth->model->id);
		$points=$member['points_available'] / 3000;


		$this->add('View_Info')->set("You Have $points Points in your Wallet");

		$this->add('Button')->set('Purchase Points')->addClass('span12')->js('click')->univ()->frameURL('Purchase Request',$this->api->url('user_pinpurchaserequest'));
	}
}