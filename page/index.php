<?php
class page_index extends Page {
    function init(){
        parent::init();
        $this->api->redirect('user_dashboard');
    }
}
