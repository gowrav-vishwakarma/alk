<?php
class Model_MemberAll extends Model_Table{
	var $table="member";
	function init(){
		parent::init();

		$this->hasOne('MemberAll','sponsor_id')->display(array('form'=>'autocomplete/basic'))->mandatory("Sponsor is must");
		$this->addField('name')->mandatory("This Field is must");
		$this->addField('username')->mandatory("This Field is must");
		$this->addField('password')->type('password')->mandatory("This Field is must");
		$this->addField('mobile_number');
		$this->addField('email_id')->mandatory("This Field is must");
		$this->addField('is_active')->type('boolean');
		$this->addField('bank_name')->mandatory("This Field is must");
		$this->addField('account_number')->mandatory("This Field is must");
		$this->addField('IFSC')->mandatory("This Field is must");
		$this->addField('bank_location')->mandatory("This Field is must");
		$this->addField('points_available')->system(true);
		
		$this->hasMany('MemberAll','sponsor_id');
		$this->hasMany('GiftReceived','gift_to_id');
		$this->hasMany('GiftSent','gift_from_id');


		$this->addHook('beforeSave',$this);
		$this->addHook('afterSave',$this);
	}

	function beforeSave(){
		if(!$this->loaded()){
			$this->memorize('new_registration',true);
		}
	}

	function afterSave(){
		if($this->recall('new_registration',false)){
			$member =& $this;

			for($i=1;$i<=4;$i++){
				if($member->get('sponsor_id') == 0) break;
				$receive_gift_request=$this->add('Model_Gift');
				$sponsor = $member->ref('sponsor_id');

				$receive_gift_request['gift_from_id'] = $this->id;
				$receive_gift_request['gift_to_id'] = $sponsor->get('id');
				$receive_gift_request['requested_level'] = $i;
				$receive_gift_request->save();

				$member=$sponsor;

			}
		}
	}
}