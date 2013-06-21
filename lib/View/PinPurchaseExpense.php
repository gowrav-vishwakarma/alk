<?php

class View_PinPurchaseExpense extends View {
	function init(){
		parent::init();

	}

	function setModel($model){
		$this->add('Button',null,'btn')->set('Details'.rand(1,9))->addClass('span12');

		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/pinpurchaseexpense');
	}
}