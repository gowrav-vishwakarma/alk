<?php

class View_PinPurchaseIncomeList extends View {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');
		
		$my_pins= $this->add('Model_PinPurchaseRequest');
		$my_pins->addCondition('currently_requested_to_id',$model->id);

		foreach ($my_pins as $junk) {
			$this->add('View_PinPurchaseIncome')->setModel($my_pins);
		}

		if($my_pins->count()->getOne()==0) $this->add('View_Warning')->set('Pin Request');
		parent::setModel($model);
	}
}