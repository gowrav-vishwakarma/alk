<?php

class View_Wallet extends View {
	function init(){
		parent::init();
		$member = $this->add('Model_Member')->load($this->api->auth->model->id);
		$points=$member['points_available'];


		$this->add('View_Info')->set("You Have $points Points in your Wallet");

		$this->add('Button')->set('Purchase Points')->addClass('span12')->js('click')->univ()->frameURL('Purchase Request',$this->api->url('user_pinpurchaserequest'));
	}
}