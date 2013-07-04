<?php

class page_admin_pointmanagement extends page_admin {
	
	function page_index(){

		$members=$this->add('Model_MemberAll');
		$members->addExpression('approved_gift_sent_count')->set(function($m,$q){
			return $m->refSQL('GiftSent')->addCondition('status',"like",'%Approved%')->count();
		});
		$members->addExpression('last_approve_date')->set(function($m,$q){
			return $m->refSQL('GiftSent')->_dsql()->fieldQuery('approved_rejected_date')->limit(1)->order('approved_rejected_date','desc');
		});

		$members->addExpression('total_referals')->set(function($m,$q){
			$m1=$m->add('Model_MemberAll');
			$m1->table_alias="sp_mem";
			$m1->addCondition('sponsor_id',$q->getField('id'));
			return $m1->count();
		});


		$crud=$this->add('CRUD',array('allow_del'=>false,'allow_add'=>false));
		

		$crud->setModel($members,array('name','username','password','mobile_number','email_id','is_active','bank_name','account_number','IFSC','bank_location','points_available'),array('name','username','password','mobile_number','email_id','is_active','bank_name','account_number','IFSC','bank_location','points_available','system_points','approved_gift_sent_count',"last_approve_date",'Joining_Date','total_referals'));

		if($_GET['give_system_points']){
			$m=$this->add('Model_MemberAll');
			$m->addExpression('approved_gift_sent_count')->set(function($m,$q){
				return $m->refSQL('GiftSent')->addCondition('status',"Like",'%Approved%')->count();
			});

			$m->load($_GET['give_system_points']);

			if($m['approved_gift_sent_count'] < 4) $crud->js()->univ()->errorMessage("Default Points not given, You cannot give system points")->execute();

			if($m['system_points']== true) $crud->js()->univ()->errorMessage("Already Given")->execute();

			$m['points_available'] = $m['points_available'] + 6000;
			$m['system_points'] = true;
			$m->save();
			$crud->grid->js()->reload()->execute();
		}
		
		if($crud->grid){
			$crud->grid->addColumn('Button','give_system_points');
		}

	}

}