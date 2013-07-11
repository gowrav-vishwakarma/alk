<?php
class page_system extends Page{
	function init(){
		parent::init();



		$col=$this->add('Columns');
		$col1=$col->addColumn(6);
		$col2=$col->addColumn(6);
		
		$col1->add('View_Info')->set("Builtup4 is an innovative way towards today's systems. 
									This gives you a new ways to help others and get help 
									from others. Builtup4 is just an system developed for the people by the people. Its Simple, 
									Its fast and Its Secure.No one is the authority to clear your payments here. 
									You are really your own owner. You will get help upto four levels as follows, 
									in return you first have to help others...")->setStyle("background","lightgreen");
		
		$col1->add('H4')->set("How To Get Benifit")->setStyle('font-size','15px')
									->setStyle('text-weight','bold');
		$col1->add('View_Info')->set("This is a very uniqe system, In which commitment Amount. - 6000/- Rs.  
									50% in start as pin amount and 50% on afterwords. You can even earn more 
									by selling/transferring your points.");

		// $col1->add('View_Info')->set("Once a person gets an address for transferring money, he/she should deposit the money to the account of specified participant within 48 to 72 working hours from request generation. Failing to do so would lead to blocking of the ID. ")
									// ->setStyle("background","#99ffff");

		// $col1->add('View_Info')->set("You can double after complete your commitment Amount. ")
									// ->setStyle("background","#ffff66");


		$v=$col2->add('View',null,null,array('view/system'));

	}
}