<?php

class page_user_downline extends page_user {
	
	function init(){
		parent::init();

		$tabs=$this->add('Tabs');

		$tab_level_1=  $tabs->addTab("Level 1");
		$tab_level_2=  $tabs->addTab("Level 2");
		$tab_level_3=  $tabs->addTab("Level 3");
		$tab_level_4=  $tabs->addTab("Level 4");

		$l1m=$this->add('Model_MemberAll');
		$l1m->addCondition('sponsor_id',$this->api->auth->model->id);
		$grid1 = $tab_level_1->add('Grid');
		$grid1->setModel($l1m,array('name','city','state','email_id','Joining_Date'));
		$grid1->addPaginator(20);

		
		$l2m=$this->add('Model_MemberAll');
		$l2m->join('member.id','sponsor_id')->addField('me_as_sponsor','sponsor_id');
		$l2m->addCondition('me_as_sponsor',$this->api->auth->model->id);
		$grid2 = $tab_level_2->add('Grid');
		$grid2->setModel($l2m,array('name','city','state','email_id','Joining_Date'));
		$grid2->addPaginator(20);

		$l3m=$this->add('Model_MemberAll');
		$l3m->join('member.id','sponsor_id')->join('member.id','sponsor_id')->addField('me_as_sponsor','sponsor_id');
		$l3m->addCondition('me_as_sponsor',$this->api->auth->model->id);
		$grid3 = $tab_level_3->add('Grid');
		$grid3->setModel($l3m,array('name','city','state','email_id','Joining_Date'));
		$grid3->addPaginator(20);

		$l4m=$this->add('Model_MemberAll');
		$l4m->join('member.id','sponsor_id')->join('member.id','sponsor_id')->join('member.id','sponsor_id')->addField('me_as_sponsor','sponsor_id');
		$l4m->addCondition('me_as_sponsor',$this->api->auth->model->id);
		$grid4 = $tab_level_4->add('Grid');
		$grid4->setModel($l4m,array('name','city','state','email_id','Joining_Date'));
		$grid4->addPaginator(20);

	}
}