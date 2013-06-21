<?php

class View_PinPurchaseIncome extends View{


	function setModel($model){

		$this->add('Button',null,'btn')->set('Send')->addClass('span12');
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/pinpurchaseincome');
	}
}