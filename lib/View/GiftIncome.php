<?php
class View_GiftIncome extends View{
	function init(){
		parent::init();
		$this->js('reload_me')->reload();
	}

	function setModel($model){
		if(!($model instanceof Model_Gift)) throw $this->exception('Use Model_Gift type of model here');

		$this->addClass('gift_income_'.$model->id);
		
		$this->add('Button',null,'message_button')->set('Message')->js('click')->univ()->frameURL('New Window',$this->api->url());
		$this->template->trySet('requested_date',date('d-M-Y',strtotime($model['gift_send_date'])));
		$this->template->trySet('gift_from',$model->ref('gift_from_id')->ref('member_id')->get('name'));
		$this->template->trySet('at_level',$model['requested_level']);

		if($model['status']=='Pending'){
			$this->add('P',null,'approve_button')->set('Approve')->js('click')->univ()->frameURL('Approve Gift',$this->api->url('user_approvegift',array('request_id'=>$model->id)));
			$this->add('P',null,'reject_button')->set('Reject')->js('click')->univ()->frameURL('Approve Gift',$this->api->url('user_rejectgift',array('request_id'=>$model->id)));
		}
		
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/giftincome');
	}
}