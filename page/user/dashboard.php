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
		$l_small=$columns->addColumn(1);
		$left_col=$columns->addColumn(6);
		$right_col=$columns->addColumn(4);
		$r_small=$columns->addColumn(1);

		$l_small->add('H4')->set("Pin Purchase Request");
		$l_small->add('View_PinPurchaseIncomeList')->setModel($this->api->auth->model);
		$r_small->add('View_PinPurchaseExpenseList')->setModel($this->api->auth->model);
		
		$left_col->add('H3')->set('Your Income Part');
		$right_col->add('H3')->set('Your Invest Part ['.$member['approved_gift_sent_count'].']');

		$left_col->add('View_GiftIncomeList')->setModel($this->api->auth->model);
		$right_col->add('View_GiftExpenseList')->setModel($this->api->auth->model);

		$r_small->js('reload_me')->reload();
		$r_small->addClass('pinrequestexpense');
		// $this->add('View_Error');
	}
}