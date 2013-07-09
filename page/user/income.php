<?php

class page_user_income extends page_user{
	function init(){
		parent::init();

		
		$tabs=$this->add('Tabs');

		$tab_level_1=  $tabs->addTab("Level 1");
		$tab_level_2=  $tabs->addTab("Level 2");
		$tab_level_3=  $tabs->addTab("Level 3");
		$tab_level_4=  $tabs->addTab("Level 4");

		$m1=$this->add('Model_MemberAll');
		$m1->load($this->api->auth->model->id);
		$l1=$m1->ref('GiftReceived')->addCondition('status','like','%Approve%')->addCondition('requested_level',1);

		$grid1 = $tab_level_1->add('Grid');
		$grid1->setModel($l1,array('gift_from','approved_rejected_date'));
		$grid1->addColumn('text','income');
		$grid1->setFormatter('income','levelincome');

		$grid1->addColumn('text','commulative_income');
		$grid1->setFormatter('commulative_income','commulative');
		// $grid1->addTotals(array('income'));

		$m2=$this->add('Model_MemberAll');
		$m2->load($this->api->auth->model->id);
		$l2=$m2->ref('GiftReceived')->addCondition('status','like','%Approve%')->addCondition('requested_level',2);

		$grid2 = $tab_level_2->add('Grid');
		$grid2->setModel($l2,array('gift_from','approved_rejected_date'));

		$grid2->addColumn('text','income');
		$grid2->setFormatter('income','levelincome');

		$grid2->addColumn('text','commulative_income');
		$grid2->setFormatter('commulative_income','commulative');

		$m3=$this->add('Model_MemberAll');
		$m3->load($this->api->auth->model->id);
		$l3=$m3->ref('GiftReceived')->addCondition('status','like','%Approve%')->addCondition('requested_level',3);

		$grid3 = $tab_level_3->add('Grid');
		$grid3->setModel($l3,array('gift_from','approved_rejected_date'));
		$grid3->addColumn('text','income');
		$grid3->setFormatter('income','levelincome');

		$grid3->addColumn('text','commulative_income');
		$grid3->setFormatter('commulative_income','commulative');

		$m4=$this->add('Model_MemberAll');
		$m4->load($this->api->auth->model->id);
		$l4=$m4->ref('GiftReceived')->addCondition('status','like','%Approve%')->addCondition('requested_level',4);

		$grid4 = $tab_level_4->add('Grid');
		$grid4->setModel($l4,array('gift_from','approved_rejected_date'));
		$grid4->addColumn('text','income');
		$grid4->setFormatter('income','levelincome');

		$grid4->addColumn('text','commulative_income');
		$grid4->setFormatter('commulative_income','commulative');


	}
}