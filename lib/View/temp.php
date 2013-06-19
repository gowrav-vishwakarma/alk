<?php

class View_temp extends CompleteLister {
	function setModel($model){
		if(!($model instanceof Model_MemberAll)) throw $this->exception('Use Model_MemberAll type of model here');

		$my_gifts = $this->add('Model_Request');
		$topups=$my_gifts->join('topups.id','request_to_id');
		$topups->addField('member_id');

		$my_gifts->addCondition('member_id',$model->id);

		// foreach($my_gifts as $gift_array){
		// 	$this->add('View_GiftIncome')->setModel($my_gifts);
		// }
		$this->columns['message_button']=array('type'=> 'buttons');
		parent::setModel($my_gifts);
	}

	function formatRow(){
		$this->current_row['requested_date'] = $this->model['requested_date'];
		// $this->current_row['message_button'] = $this->add('Button',null,'message_button')->debug();

	}

	function defaultTemplate(){
		return array('view/temp');
	}
}