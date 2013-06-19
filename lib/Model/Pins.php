<?php
class Model_Pins extends Model_Table {
	var $table= "pins";
	function init(){
		parent::init();

		$this->hasOne('Topups','created_by_id');
		$this->hasOne('Topups','current_owner_id');
		$this->addField('name');
		$this->addField('created_at')->type('date');
		$this->addField('is_used')->type('boolean');
		$this->addField('sold_on')->type('date');


	}
}