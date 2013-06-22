<?php
class View_GiftIncome extends View{
	function init(){
		parent::init();
		$this->js('reload_me')->reload();
	}

	function setModel($model){
		if(!($model instanceof Model_Gift)) throw $this->exception('Use Model_Gift type of model here');

		$this->addClass('gift_income_'.$model->id);
		
		// $this->add('Button',null,'message_button')->set('Message')->js('click')->univ()->frameURL('New Window',$this->api->url());
		$this->template->trySet('requested_date',date('d-M-Y',strtotime($model['gift_send_date'])));
		$this->template->trySet('gift_from',$model->ref('gift_from_id')->ref('member_id')->get('name'));
		$this->template->trySet('at_level',$model['requested_level']);
		$this->template->trySet('status',$model['status']);

		if($model['bank_slip_id']){
			$img =$this->add('HtmlElement',null,'slip_preview')->setElement('img')->setAttr('src',$model['bank_slip'])->setAttr('width','80')->setAttr('height','80');
			$img->js('click')->univ()->dialogURL('Image Preivew',$this->api->url('imageview',array('image_url'=>$model['bank_slip'])));
		}

		if($model['status']=='Pending'){
			$this->add('P',null,'reject_button')->set('Reject')->js('click')->univ()->frameURL('Approve Gift',$this->api->url('user_rejectgift',array('request_id'=>$model->id)));
		}

		if($model['status']=='Pending' OR $model['status']=='Rejected' OR $model['status']=='Complained'){
			$this->add('P',null,'approve_button')->set('Approve')->js('click')->univ()->frameURL('Approve Gift',$this->api->url('user_approvegift',array('request_id'=>$model->id)));
		}
		
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/giftincome');
	}
}