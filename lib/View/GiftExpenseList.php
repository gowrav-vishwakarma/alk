<?php

class View_GiftExpenseList extends View {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');

		$my_gifts = $this->add('Model_Gift');
		// $topups=$my_gifts->join('topups.id','gift_from_id');
		// $topups->addField('member_id');

		$my_gifts->addCondition('gift_from_id',$model->id);

		foreach($my_gifts as $gift_array){
			$ge=$this->add('View_GiftExpense')->setStyle("border","1px solid blue")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","#aaaaff");
			$ge->setModel($my_gifts);
		}

		parent::setModel($model);
	}
}