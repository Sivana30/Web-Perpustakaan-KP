<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Denda extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Denda_model');
		$this->load->model('Petugas_model');
		if($this->session->userdata('logged_in') == false){
			redirect('welcome');
		}
	}

	public function index(){
		$data['title'] = 'Denda';
		$data['primary_view'] = 'denda/denda_view';
		$data['total'] = $this->Denda_model->getCount();
		$data['list'] = $this->Denda_model->getList();
		$this->load->view('template_view', $data);
	}

	public function add(){
		$data['title'] = 'Tambah Denda';
		$data['primary_view'] = 'denda/add_denda_view';
		$this->load->view('template_view', $data);
	}

	public function submit(){
		if($this->input->post('submit')){
			$this->form_validation->set_rules('jenis', 'jenis', 'trim|required');
			$this->form_validation->set_rules('keterangan', 'keterangan', 'trim|required');
			$this->form_validation->set_rules('biaya', 'biaya', 'trim|required|numeric');

			if ($this->form_validation->run() == true) {
				//GET : Petugas ID
				$username = $this->session->userdata('username');
				$id_petugas = $this->Petugas_model->getID($username);
				
				if($this->Denda_model->insert($id_petugas) == true){
					$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
					redirect('denda/add');
				}else{
					$this->session->set_flashdata('announce', 'Gagal menyimpan data');
					redirect('denda/add');
				}
			} else {
				$this->session->set_flashdata('announce', validation_errors());
				redirect('denda/add');
			}
		}
	}
	
	public function submits(){
		if($this->input->post('submit')){
			$this->form_validation->set_rules('keterangan', 'keterangan', 'trim|required');
			$this->form_validation->set_rules('biaya', 'biaya', 'trim|required|numeric');
			
			$username = $this->session->userdata('username');
			$id_petugas = $this->Petugas_model->getID($username);
			
			if ($this->form_validation->run() == true) {
				if($this->Denda_model->update($this->input->post('id'),$id_petugas) == true){
					$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
					redirect('denda/edit?idtf='.$this->input->post('id'));
				}else{
					$this->session->set_flashdata('announce', 'Gagal menyimpan data');
					redirect('denda/edit?idtf='.$this->input->post('id'));
				}
			} else {
				$this->session->set_flashdata('announce', validation_errors());
				redirect('denda/edit?idtf='.$this->input->post('id'));
			}
		}
	}

	public function edit(){
		$id = $this->input->get('idtf');
		//CHECK : Data Availability
		if($this->Denda_model->checkAvailability($id) == true){
			$data['primary_view'] = 'denda/edit_denda_view';
		}else{
			$data['primary_view'] = '404_view';
		}
		$data['title'] = 'Edit denda';
		$data['detail'] = $this->Denda_model->getDetail($id);
		$this->load->view('template_view', $data);
	}

	public function delete(){
		$id = $this->input->get('rcgn');
		if($this->Denda_model->delete($id) == true){
			$this->session->set_flashdata('announce', 'Berhasil menghapus data');
			redirect('denda');
		}else{
			$this->session->set_flashdata('announce', 'Gagal menghapus data');
			redirect('denda');
		}
	}

}

/* End of file Buku.php */
/* Location: ./application/controllers/Buku.php */