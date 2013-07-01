<?php

class View_GiftIncomeList extends View {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');

		$my_gifts = $this->add('Model_Gift');
		// $topups=$my_gifts->join('topups.id','gift_to_id');
		// $topups->addField('member_id');

		$my_gifts->addCondition('gift_to_id',$model->id);

		foreach($my_gifts as $gift_array){
			$this->add('View_GiftIncome')->setModel($my_gifts);
		}

		parent::setModel($model);
	}
}