<?php
class Model_PinPurchaseRequest extends Model_Table{
	var $table="pin_purchase_request";
	function init(){
		parent::init();

		$this->hasOne('Topups','request_from_id');
		$this->hasOne('Topups','currently_requested_to_id');
		$this->addField('request_at')->type('date');
		$this->addfield('status')->enum(array('Open','Accepted','forwarded','rejected'));
	}
}