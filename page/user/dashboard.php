<?php


class page_user_dashboard extends page_user {

	function init(){
		parent::init();

		
		$columns=$this->add('Columns');
		$left_col=$columns->addColumn(8);
		$right_col=$columns->addColumn(4);


		$right_col->add('View_Wallet');
		$right_col->add('HR');
		
		$left_col->add('H3')->set('Your Income Part');
		$right_col->add('H3')->set('Your Invest Part');

		$left_col->add('View_GiftIncomeList')->setModel($this->api->auth->model);
		$right_col->add('View_GiftExpenseList')->setModel($this->api->auth->model);

		// $this->add('View_Error');
	}
}