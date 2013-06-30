<?php


class page_user_dashboard extends page_user {

	function init(){
		parent::init();

		
		
		$columns=$this->add('Columns');
		$l_small=$columns->addColumn(1);
		$left_col=$columns->addColumn(6);
		$right_col=$columns->addColumn(4);
		$r_small=$columns->addColumn(1);

		$l_small->add('View_PinPurchaseIncomeList')->setModel($this->api->auth->model);
		$r_small->add('View_PinPurchaseExpenseList')->setModel($this->api->auth->model);
		
		$left_col->add('H3')->set('Your Income Part');
		$right_col->add('H3')->set('Your Invest Part');

		$left_col->add('View_GiftIncomeList')->setModel($this->api->auth->model);
		$right_col->add('View_GiftExpenseList')->setModel($this->api->auth->model);

		$r_small->js('reload_me')->reload();
		$r_small->addClass('pinrequestexpense');
		// $this->add('View_Error');
	}
}