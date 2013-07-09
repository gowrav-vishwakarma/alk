<?php

class View_PinPurchaseExpense extends View {
	function init(){
		parent::init();

		$this->js('reload_me')->reload();
	}

	function setModel($model){
		$this->add('Button',null,'btn')->set('Action')->addClass('span12')->js('click')->univ()->frameURL('Pay for your Pins',$this->api->url('user_pinpurchasepayment',array('request_id'=>$model->id,'view_id'=>$this->name)));
		if($model['bank_slip_id']) {
			// $this->template->trySet('slip_img',$model['bank_slip']);
			// $this->template->trySet('slip_img','http://placehold.it/50x50');
			$img =$this->add('Button',null,'slip_img')->set('Slip');
			$img->js('click')->univ()->dialogURL('Slip Preview',$this->api->url('imageview',array('image_url'=>$model['bank_slip'])));
			// $this->js('mouseover')->_selector('#'.$this->name . " img")->attr('border','2px solid black');
			// $this->js('mouseout')->_selector('#'.$this->name . " img")->attr('border','none');
		}

		$this->template->trySet('request_at',date("d-M-Y",strtotime($model['request_at'])));
		$this->template->trySet('points_required',$model['points_required']);
		$this->template->trySet('status',$model['status']);

		// $this->add('HR',null,'details');
		// $cols=$this->add('Columns',null,'details');
		// $cols->addColumn(6)->add('H3')->set($model->ref('currently_requested_to_id')->get('bank_name'))->sub('Bank Name');
		// $cols->addColumn(6)->add('H3')->set($model->ref('currently_requested_to_id')->get('IFSC'))->sub('IFSC');

		if($model['currently_requested_to_id']==1)
			$this->template->trySet('request_to',"REQUEST SENT");
		else
			$this->template->trySet('request_to',$model->ref('currently_requested_to_id')->get('name'));

		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/pinpurchaseexpense');
	}
}