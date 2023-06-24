<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denda_model extends CI_Model {

	public function insert($id_petugas){
		$data = array(
			'ID_DENDA'		=> $this->generateID(),
			'ID_ADMIN'		=> $id_petugas,
			'JENIS'			=> $this->input->post('jenis'),
			'KETERANGAN'	=> $this->input->post('keterangan'),
			'BIAYA'		    => $this->input->post('biaya')
			 );

		$this->db->insert('denda', $data);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	public function update($id,$id_petugas){
		$data = array(
			'ID_ADMIN'		=> $id_petugas,
			'KETERANGAN'	=> $this->input->post('keterangan'),
			'BIAYA'		    => $this->input->post('biaya')
			 );

		$this->db->where('ID_DENDA', $id)->update('denda', $data);
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	public function getCount(){
		return $this->db->count_all('denda');
	}

	public function getList(){
		return $query = $this->db->order_by('ID_DENDA','ASC')->get('denda')->result();
	}

	public function generateID(){
		$query = $this->db->order_by('ID_DENDA', 'DESC')->limit(1)->get('denda')->row('ID_DENDA');
		if ($query != null) {
			$lastNo = substr($query, 3);
			$next = $lastNo + 1;
			$kd = 'DND';
			return $kd.sprintf('%03s', $next);
		}else{
			return "DND001";
		}
	}

	public function getDetail($id){
		return $this->db->where('ID_DENDA', $id)->get('denda')->row();
	}

	public function delete($id){
		$this->db->where('ID_DENDA', $id)->delete('denda');
		if($this->db->affected_rows() > 0){
			return true;
		}else{
			return false;
		}
	}

	public function checkAvailability($id){
		$query = $this->db->where('ID_DENDA', $id)->get('denda');
		if($query->num_rows() > 0){
			return true;
		}else{
			return false;
		}
	}
	public function denda($jenis){
		return $query = $this->db->where('JENIS', $jenis)->get('denda')->row();
	}


}

/* End of file Buku_model.php */
/* Location: ./application/models/Buku_model.php */