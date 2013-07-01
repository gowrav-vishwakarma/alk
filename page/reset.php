<?php
class page_reset extends Page{
	function init(){
		parent::init();


		$this->api->db->dsql()->table("member")->truncate();
		$this->api->db->dsql()->table("gift")->truncate();
		$this->api->db->dsql()->table("pin_purchase_request")->truncate();
		// $this->api->db->dsql()->table("topups")->truncate();
		// $this->api->db->dsql()->table("pins")->truncate();
		// $dsql->table("pins")->truncate();
		// $dsql->table("requests")->truncate();


		$sponsor_id=0;
		for($i=1;$i<=5;$i++){

			$member=$this->add('Model_Member');
			$member['name']="root ".$i;
			$member['sponsor_id']= $sponsor_id;
			$member['username']="root ".$i;
			$member['password']="12344";
			$member['mobile_number']="0123456";
			$member['email_id']="root@a.com";
			$member['bank_name']="Bank Name $i";
			$member['account_number']="account Number $i";
			$member['IFSC']="IFSC $i";
			$member['bank_location']="bank location $i";
			$member->save();

			$sponsor_id = $member->id;

		}
	}
}