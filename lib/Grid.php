<?php

class Grid extends Grid_Advanced {
	function format_picture( $field ) {
		$this->current_row_html[$field] = '<img id="pinslip_'.$this->current_row['id'] .'" src="'.$this->current_row[$field].'" width="50%" height="50%"/>';
	}
}
