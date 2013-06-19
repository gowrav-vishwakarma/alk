<?php


class page_user_dashboard extends page_user {

	function init(){
		parent::init();

		$columns=$this->add('Columns');
		$left_col=$columns->addColumn(8);
		$right_col=$columns->addColumn(4);


		$left_col->add('View_GiftIncomeList')->setModel($this->api->auth->model);
		$right_col->add('View_GiftExpenseList')->setModel($this->api->auth->model);

		// $this->add('View_Error');
	}
}