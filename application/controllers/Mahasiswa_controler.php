<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mahasiswa_controler extends CI_Controller {

    public function index(){
        $data['view'] = $this->model->tampil();
        $this->load->view('log',$data);
    }

    public function tambah(){
        $this->load->view('tambahdata');
    }

    public function tambahdata(){
        $this->model->tambah_data();
        redirect('Mahasiswa_controler');
    }

    public function tampiledit($id_mahasiswa){
        $data['view'] = $this->model->tampilubah($id_mahasiswa);
        $this->load->view('update',$data);
    }

    public function editdata(){
        $this->model->edit_data();
        redirect('Mahasiswa_controler');
    }
        
    public function hapus($id_mahasiswa){
        $this->model->hapus($id_mahasiswa);
        redirect('Mahasiswa_controler');  
    }

}