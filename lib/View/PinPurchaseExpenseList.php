<?php

class View_PinPurchaseExpenseList extends View {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');

		$my_pins= $this->add('Model_PinPurchaseRequest');
		$my_pins->addCondition('request_from_id',$model->id);
		$my_pins->setOrder('id desc');

		foreach ($my_pins as $junk) {
			$pe=$this->add('View_PinPurchaseExpense')->setStyle("border","1px solid red")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","#ffaaaa");
			$pe->setModel($my_pins);
		}

		if($my_pins->count()->getOne()==0) $this->add('View_Warning')->set('Pin Request');

		parent::setModel($model);
	}
}