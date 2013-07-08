<?php

class page_user_dashboard extends page_user {

	function init(){
		parent::init();

		$member=$this->add('Model_MemberAll');
		$member->addExpression('approved_gift_sent_count')->set(function($m,$q){
			return $m->refSQL('GiftSent')->addCondition('status','Approved')->count();
		});

		$member->load($this->api->auth->model->id);

		$columns=$this->add('Columns');
		$l_small=$columns->addColumn(3);
		$left_col=$columns->addColumn(3);
		$right_col=$columns->addColumn(3);
		$r_small=$columns->addColumn(3);

		$l_small->add('H4')->set("Some One Wants Points From You")->setStyle("border","1px solid lightgreen")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","lightgreen");
		$l_small->add('View_PinPurchaseIncomeList')->setModel($this->api->auth->model);
		$r_small->add('H4')->set("You Requested For Points Purchase")->setStyle("border","1px solid red")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","#ffaaaa");
		$r_small->add('View_PinPurchaseExpenseList')->setModel($this->api->auth->model);
		
		$left_col->add('H4')->set('Your Income Part')->setStyle("border","1px solid lightblue")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","lightblue");
		$right_col->add('H4')->set('Your Invest Part ['.$member['approved_gift_sent_count'].']')->setStyle("border","1px solid blue")->setStyle('padding','3px')->addClass('atk-notification ui-state-highlight ui-corner-all giftincome  gift_income_1')->setStyle("background","#aaaaff");

		$left_col->add('View_GiftIncomeList')->setModel($this->api->auth->model);
		$right_col->add('View_GiftExpenseList')->setModel($this->api->auth->model);

		$r_small->js('reload_me')->reload();
		$r_small->addClass('pinrequestexpense');
		// $this->add('View_Error');
	}
}