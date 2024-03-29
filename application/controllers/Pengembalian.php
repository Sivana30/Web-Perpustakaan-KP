<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pengembalian extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('Pengembalian_model');
		$this->load->model('Denda_model');
		if($this->session->userdata('logged_in') == false){
			redirect('login');
		}
	}

	public function index(){
		$data = array(
			'title'			=> 'Pengembalian',
			'primary_view'	=> 'transaksi/pengembalian_view',
			'total'			=> $this->Pengembalian_model->getCount(),
			'datas'			=> $this->Pengembalian_model->getList()
		);
		$this->load->view('template_view', $data);
	}

	public function denda(){
		$kondisi = $this->input->post('kondisi');
		$deadline = $this->input->post('deadline');
		$bk = $this->input->post('status');
		$keterlambatan = $this->Denda_model->denda('keterlambatan')->BIAYA;
		$kerusakan = $this->Denda_model->denda('kerusakan')->BIAYA;
		$kehilangan = $this->Denda_model->denda('kehilangan')->BIAYA;
		$dl = strtotime($deadline);
        $now = time();
		$pesan = [];
		$denda = 0;
        if($bk== 'Sudah Kembali'){
             $pesan['data'] = 'Sudah kembali';
        }else{
            if(strtotime(date("Y-m-d")) > $dl){
                $diff = $now - $dl;
				$denda = floor($diff / 86400)*$keterlambatan;
				if ($kondisi == 'Rusak') {
					$denda +=$kerusakan;
				}else if($kondisi == 'Hilang'){
					$denda += $kehilangan;
				}
                $pesan['data'] = 'Denda Rp.'.$denda;
            }else if(strtotime(date("Y-m-d")) < $dl){
                $diff = $dl - $now;
                $pesan['data'] = (floor($diff/86400)+1).' Hari lagi';
            }else{
                $pesan['data'] = 'Hari terakhir';
            }
         }
		 $this->load->view('row',$pesan);
	}

	public function det(){
		$id = $this->input->post('id');
		$data['detail'] = $this->Pengembalian_model->getDetail($id);
		$data['buku'] = $this->Pengembalian_model->getBook($id);
		$data['count'] = $this->Pengembalian_model->getPnjCnt($id);
		$data['status'] = $this->Pengembalian_model->getPnjStt($id);
		$data['keterlambatan'] = $this->Denda_model->denda('keterlambatan')->BIAYA;
		$data['kerusakan'] = $this->Denda_model->denda('kerusakan')->BIAYA;
		$data['kehilangan'] = $this->Denda_model->denda('kehilangan')->BIAYA;
		$this->load->view('transaksi/kembali_detail_view', $data);
	}

	public function kembali(){
		$id_det = $this->input->get('id');
		$denda = $this->input->get('denda');
		$id_pnj = $this->input->get('pnj');
		$status = (int) $this->input->get('status') + 1;
		$count = $this->input->get('count');
		$id_buku = $this->input->get('book');

		$complete = false;
		$status == $count ? $complete = true : $complete = false;

		if($this->Pengembalian_model->kembali($id_det, $id_pnj,$denda, $complete, $id_buku) == true){
			$this->session->set_flashdata('announce', 'Berhasil menyimpan data');
			redirect('pengembalian');
		}else{}
	}
}

/* End of file Pengembalian.php */
/* Location: ./application/controllers/Pengembalian.php */