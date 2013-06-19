<?php
class View_GiftExpense extends View{
	function init(){
		parent::init();
	}

	function setModel($model){
		if(!($model instanceof Model_Gift)) throw $this->exception('Use Model_Gift type of model here');

		$this->template->trySet('status',$model['status']);
		switch($model['status']){
			case "Approved":
				$this->template->trySet('icon','ui-icon ui-icon-check');
				break;
			case "Rejected":
				$this->template->trySet('icon','ui-icon ui-icon-close');
				break;
			default:
		}
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/giftexpense');

	}
}