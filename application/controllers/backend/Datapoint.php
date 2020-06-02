<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Datapoint extends CI_Controller {


	public function __construct()
	{
		parent::__construct();
		// PROTEKSI SESSION
		$this->simple_login->cek_login();
		// AMBIL DATA di tabel datapoint
		$this->load->model('datapoint_model');

	}

	
	//Halaman utama admin Dasbor
	public function index()
	{	
		$konfigurasi = $this->konfigurasi_model->detail();


		$data = array (	'title'	=> 'Laundry Bekasi',
						'content' 	=> 'backend/datapoint/list');
 		$this->load->view('backend/layout/wrapper', $data, FALSE);
	}

	public function tampil_json()
	{	
		$data = $this->db->get('datapoint')->result();
		echo json_encode($data);
		
	}

	// INPUT
	public function tambah()
    {
       if (($this->session->userdata('akses_level') == 'admin') || ($this->session->userdata('akses_level') == 'operator')){
        $this->form_validation->set_rules('nama_laundry', 'Nama Laundry', 'required');
        

        if ($this->form_validation->run() == FALSE) {
            $data = array(
                'title' => 'Input Data',
                'content' 	=> 'backend/datapoint/tambah'
            );
    
            $this->load->view('backend/layout/wrapper', $data, FALSE);
            
        } else {

            $data = array(
                'nama_laundry' =>  $this->input->post('nama_laundry'),
                'keterangan' =>  $this->input->post('keterangan'),
                'latitude' =>  $this->input->post('latitude'),
                'longitude' =>  $this->input->post('longitude'),
                'username' =>  $this->session->userdata('username'),

            );

            $this->datapoint_model->tambah($data);
            
            $this->session->set_flashdata('pesan', 'Data Berhasil Disimpan :)');
            
            redirect('backend/datapoint/tambah');          
        }

    }else{

            redirect(base_url('backend/login'), 'refresh');
        }  
	}
	
	public function tabel()
    {
		$datalisting = $this->datapoint_model->listing();

        $data = array(
            'title' => 'Data',
            'datalisting' => $datalisting,
			'content' 	=> 'backend/datapoint/tabel'
        );

        $this->load->view('backend/layout/wrapper', $data, FALSE);
	}
	
	public function update($id)
    {
        if (($this->session->userdata('akses_level') == 'admin') || ($this->session->userdata('akses_level') == 'operator')){
		$detail = $this->datapoint_model->detail($id);

        $this->form_validation->set_rules('nama_laundry', 'Nama Laundry', 'required');
        

        if ($this->form_validation->run() == FALSE) {
            $data = array(
				'title' => 'Data',
				'detail' => $detail,
				'content' 	=> 'backend/datapoint/edit'
			);
    
            $this->load->view('backend/layout/wrapper', $data, FALSE);
            
        } else {

            $data = array(
                'id' => $id,
                'nama_laundry' =>  $this->input->post('nama_laundry'),
                'keterangan' =>  $this->input->post('keterangan'),
                'latitude' =>  $this->input->post('latitude'),
                'longitude' =>  $this->input->post('longitude'),
                'username' =>  $this->session->userdata('username'),

            );

            $this->datapoint_model->update($data);
            
            $this->session->set_flashdata('pesan', 'Data Berhasil Diedit :)');
            
            redirect('backend/datapoint/tabel');
        }
    }else{

        redirect(base_url('backend/login'), 'refresh');
    }    
        
	}

	public function delete($id)
    {
        if (($this->session->userdata('akses_level') == 'admin') || ($this->session->userdata('akses_level') == 'operator')){
        $this->datapoint_model->delete($id);
            
        $this->session->set_flashdata('pesan', 'Data Berhasil Dihapus.');
        
        redirect('backend/datapoint/tabel');
    }else{

        redirect(base_url('backend/login'), 'refresh');
    }   

    }
    

}
