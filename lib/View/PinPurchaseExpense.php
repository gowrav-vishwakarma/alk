<?php

class View_PinPurchaseExpense extends View {
	function init(){
		parent::init();

		$this->js('reload_me')->reload();
	}

	function setModel($model){
		$this->add('Button',null,'btn')->set('Action')->addClass('span12')->js('click')->univ()->frameURL('Pay for your Pins',$this->api->url('user_pinpurchasepayment',array('request_id'=>$model->id,'view_id'=>$this->name)));
		if($model['bank_slip_id']) {
			$this->template->trySet('slip_img',$model['bank_slip']);
			$this->js('click')->_selector('#'.$this->name . " img")->univ()->dialogURL('Slip Preview',$this->api->url('imageview',array('image_url'=>$model['bank_slip'])));
			// $this->js('mouseover')->_selector('#'.$this->name . " img")->attr('border','2px solid black');
			// $this->js('mouseout')->_selector('#'.$this->name . " img")->attr('border','none');
		}
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/pinpurchaseexpense');
	}
}