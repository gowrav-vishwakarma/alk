<?php

class page_user_rejectgift extends Page{
	function init(){
		parent::init();

		echo "reject" .$_GET['request_id'];
	}
}