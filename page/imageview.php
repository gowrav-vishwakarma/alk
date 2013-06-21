<?php

class page_imageview extends Page {
	function init(){
		parent::init();

		$this->add('HtmlElement')->setElement('img')->setAttr('src',$_GET['image_url']);

	}
}