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
		$this->addField('bank_name')->type('boolean')->mandatory("This Field is must");
		$this->addField('account_number')->type('boolean')->mandatory("This Field is must");
		$this->addField('IFSC')->type('boolean')->mandatory("This Field is must");
		$this->addField('bank_location')->type('boolean')->mandatory("This Field is must");
		$this->addField('points_available')->system(true);
		
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