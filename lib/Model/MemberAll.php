<?php
class Model_MemberAll extends Model_Table{
	var $table="member";
	function init(){
		parent::init();

		$this->hasOne('MemberAll','sponsor_id');
		$this->addField('name');
		$this->addField('username');
		$this->addField('password')->type('password');
		$this->addField('mobile_number');
		$this->addField('email_id');
		$this->addField('is_active')->type('boolean');
		$this->addField('bank_name')->type('boolean');
		$this->addField('account_number')->type('boolean');
		$this->addField('IFSC')->type('boolean');
		$this->addField('bank_location')->type('boolean');
		$this->addField('points_available');
		
		$this->hasMany('MemberAll','sponsor_id');
		$this->hasMany('Topups','member_id');
		

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
			$this->ref('Topups')->save();
		}
	}
}