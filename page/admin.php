<?php

class page_admin extends Page {
	function init(){
		parent::init();
		if($this->api->auth->model->id != 1) $this->api->redirect('index');
	}
}