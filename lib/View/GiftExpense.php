<?php
class View_GiftExpense extends View{
	function init(){
		parent::init();
	}

	function setModel($model){
		if(!($model instanceof Model_Gift)) throw $this->exception('Use Model_Gift type of model here');

		// $this->template->trySet('requested_date','asdasd');
		parent::setModel($model);
	}

	function defaultTemplate(){
		return array('view/giftexpense');

	}
}