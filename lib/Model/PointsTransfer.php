<?php

class Model_PointsTransfer extends Model_Table {
	var $table= "points_transfer";
	function init(){
		parent::init();
		
		$this->hasOne('MemberAll','from_id')->mandatory();
		$this->hasOne('MemberAll','to_id')->mandatory();

		$this->addField('no_of_points');
		$this->addField('transfered_on')->type('date')->defaultValue(date('Y-m-d H:i:s'));

		$this->addHook('beforeSave',$this);

	}

	function beforeSave(){
		if(!$this->loaded()){
			$from=$this->add('Model_MemberAll');
			$from->load($this['from_id']);
			$from['points_available'] = $from['points_available'] - ($this['no_of_points'] * 3000 );
			$from->save();

			$to=$this->add('Model_MemberAll');
			$to->load($this['to_id']);
			$to['points_available'] = $to['points_available'] + ($this['no_of_points'] * 3000 );
			$to->save();

		}
	}

}