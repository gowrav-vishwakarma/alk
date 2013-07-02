<?php

class Grid extends Grid_Advanced {
	var $commulative=array();

	function format_picture( $field ) {
		$this->current_row_html[$field] = '<img id="pinslip_'.$this->current_row['id'] .'" src="'.$this->current_row[$field].'" width="50%" height="50%"/>';
	}

	function format_commulative($field){
		$in=array(0,1000,500,500,1000);
		$this->commulative[$field] = $this->commulative[$field] + $in[$this->current_row['requested_level']] ;
		$this->current_row[$field] = $this->commulative[$field] ;// $in[$this->current_row['requested_level']] ;
	}

	function format_levelincome($field){
		$in=array(0,1000,500,500,1000);
		$this->current_row[$field] = $in[$this->current_row['requested_level']] ;
	}
}
