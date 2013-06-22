<?php
class View_GiftExpense extends View{
	function init(){
		parent::init();
		$this->js('reload_me')->reload();
	}

	function setModel($model){
		if(!($model instanceof Model_Gift)) throw $this->exception('Use Model_Gift type of model here');

		$this->addClass('gift_income_'.$model->id);

		$this->add('Button',null,'form')->set('manage bank slip')->addClass('span12')->js('click')->univ()->frameURL('Manage Your Gift Payment',$this->api->url('user_giftpayementmanage',array('view_id'=>$this->name,'gift_id'=>$model->id)));

		$this->template->trySet('status',$model['status']);
		
		if($model['bank_slip_id']){
			$img =$this->add('HtmlElement',null,'slip_preview')->setElement('img')->setAttr('src',$model['bank_slip'])->setAttr('width','80')->setAttr('height','80');
			$img->js('click')->univ()->dialogURL('Image Preivew',$this->api->url('imageview',array('image_url'=>$model['bank_slip'])));
		}

		switch($model['status']){
			case "Approved":
				$this->template->trySet('icon','ui-icon ui-icon-check');
				break;
			case "Rejected":
				$this->template->trySet('icon','ui-icon ui-icon-close');
				break;
			default:
				$this->template->trySet('icon','ui-icon ui-icon-minus');
		}
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/giftexpense');

	}
}