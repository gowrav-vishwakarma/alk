<?php

class Model_Complain extends Model_Table {
	var $table='complains';
	function init(){
		parent::init();

		$this->hasOne('Gift','gift_id');
		$this->hasOne('PinPurchaseRequest','pin_request_id');
		$this->hasOne('Member','from_id');
		$this->hasOne('Member','against_id');

		$this->addField('message')->type('text');
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d H:i:s'));
		$this->addField('status')->enum(array("Send","Abcd"))->defaultValue('Send');
		$this->addField('action');

	}
}