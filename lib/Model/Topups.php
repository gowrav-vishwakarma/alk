<?php
class Model_Topups extends Model_Table {
	var $table= "topups";
	function init(){
		parent::init();

		$this->hasOne('MemberAll','member_id');
		$this->addField('created_at')->type('date')->defaultValue(date('Y-m-d'));
		$this->addField('withdrawal_requested_on')->type('date')->defaultValue(null);
		$this->addField('pin_sold')->defaultValue(0);
		$this->addField('is_withdrawable')->type('boolean')->defaultValue(false);

		$this->hasMany('GiftReceived','gift_to_id');
		$this->hasMany('GiftSent','gift_from_id');
		$this->hasMany('Pins','created_by_id');
		$this->hasMany('Pins','current_owner_id');
		$this->hasMany('PinPurchaseRequest','request_from_id');
		$this->hasMany('PinPurchaseRequest','currently_requested_to_id');

		$this->addHook('beforeSave',$this);
		$this->addHook('afterSave',$this);

	}

	function beforesave(){

		if(!$this->loaded()){
			$this->memorize('new_topup',true);
		}
	}

	function afterSave(){
		
		if($this->recall('new_topup',false)){
			$member=$this->ref('member_id');

			for($i=1;$i<=4;$i++){
				if($member->get('sponsor_id') == 0) break;
				$receive_gift_request=$this->add('Model_Request');
				$sponsor = $member->ref('sponsor_id');

				$receive_gift_request['request_from_id'] = $sponsor->ref('Topups')->tryLoadAny()->get('id');
				$receive_gift_request['request_to_id'] = $this->id;
				$receive_gift_request['requested_level'] = $i;
				$receive_gift_request->save();

				$member=$sponsor;

			}
			
		}



	}
}