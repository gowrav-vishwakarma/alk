<?php

class View_PinPurchaseExpenseList extends View {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');

		$my_pins= $this->add('Model_PinPurchaseRequest');
		$top_ups = $my_pins->join('topups.id','request_from_id');
		$top_ups->addField('member_id');

		$my_pins->addCondition('member_id',$model->id);

		foreach ($my_pins as $junk) {
			$this->add('View_PinPurchaseExpense')->setModel($my_pins);
		}

		parent::setModel($model);
	}
}