<?php
# @Author: Sahebul
# @Date:   2019-05-29T11:08:05+05:30
# @Last modified by:   Sahebul
# @Last modified time: 2019-05-29T11:23:29+05:30


if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Products extends Admin_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('products_model');
        $this->load->model('category/category_model');
        $this->load->model('brands/brands_model');
        $this->load->model('attributes/attributes_model');
        $this->load->library('form_validation');
        $this->load->library('breadcrumbs');
        $this->load->helper('fileUpload');
        $this->layout->add_js('custom/product.js');
        $this->config->load('config');
    }
    public function index()
    {
        $this->layout->set_title('products List');
        $this->load_datatables();
        $this->layout->add_js('../datatables/product_table.js');
        $this->breadcrumbs->admin_push('Dashboard', 'dashboard');
        $this->breadcrumbs->admin_push('products List', 'products');
        $this->layout->view_render('index');
    }
    public function get_products(){
     echo  $this->products_model->get_products();
    }
    public function get_product_inventory(){

      $result=$this->products_model->get_product_inventory($this->input->post('prod_id'));
      if($result){
        echo json_encode(array('message'=>'Inventory Data','type'=>'success',"data"=>$result));
      }else {
        echo json_encode(array('message'=>'Something went wrong','type'=>'warning'));
      }
    }
    public function add()
    {
        $this->layout->set_title('Add Product');
        $this->layout->add_js('../public/pekeupload/js/pekeUpload.js');
        $this->breadcrumbs->admin_push('Dashboard', 'dashboard');
        $this->breadcrumbs->admin_push('products List', 'products');
        $this->breadcrumbs->admin_push('Add products', 'products/add');
        $data = array(
            'button' => 'Add',
            'action' => admin_url('products/add_products'),
            'prod_id' => set_value(''),
            'image_path' => set_value(''),
            'name' => set_value('name'),
        );
        $data['sold_as']=$this->config->item('sold_as');
        $data['tax_rate']=$this->config->item('tax_rate');
        $data['category_list']=$this->category_model->get_all();
        $data['brand_list']=$this->brands_model->get_all();
        $data['attributes_list']=$this->attributes_model->get_all();
        $this->layout->view_render('add', $data);
    }
    public function add_products()
    {//var_dump($this->input->post());die;
        $this->_rules();
        if ($this->form_validation->run() == FALSE) {
            $this->add();
        } else {
          $name =
          $data = array(
               'name' => $this->input->post('name', TRUE),
               'category_id' => $this->input->post('product_category', TRUE),
               'brand_id' => $this->input->post('brand', TRUE),
               'description' => $this->input->post('description', TRUE)
           );
          if ($this->input->post("upload_image")) {
                  $image = moveFile(1, $this->input->post("upload_image"), "image");
                  $data['image_path'] = $image[0];
              }

          $result=$this->products_model->add($data);
          $attributes=!empty($this->input->post('attributes')) ? $this->input->post('attributes'):"";
          $attributes_value=!empty($this->input->post('attributes_value'))?$this->input->post('attributes_value'):"";
          $sold_as=!empty($this->input->post('sold_as'))?$this->input->post('sold_as'):"";
          $price=!empty($this->input->post('price'))?$this->input->post('price'):"";
          $inventory=!empty($this->input->post('inventory'))?$this->input->post('inventory'):"";
          $tax_rate=!empty($this->input->post('tax_rate'))?$this->input->post('tax_rate'):"";
          if($attributes){
            foreach ($attributes as $key => $value) {
              $attribute_data=array('attributes_id'=>$attributes[$key],
                                    'attributes_value'=>$attributes_value[$key],
                                    'prod_id'=>$result,
                                    'price' => $price[$key],
                                    'sold_as'=>$sold_as[$key],
                                    'inventory'=>$inventory[$key],
                                    'tax_rate'=>$tax_rate[$key]);
              $this->products_model->add_price($attribute_data);
            }
          }

          if($result){
            $this->activity_model->add(array('login_id'=>$this->login_id,'activity'=>ucfirst($this->username).' adde a product at '.date("M d, Y H:i")));
            $this->session->set_flashdata(array('message'=>'Product Added Successfully','type'=>'success'));
          }else {
            $this->session->set_flashdata(array('message'=>'Something went wrong. Try again','type'=>'warning'));
          }
          redirectToAdmin('products');

        }
    }
    public function edit($prod_id)
    {
          $this->layout->add_js('../public/pekeupload/js/pekeUpload.js');
          $this->breadcrumbs->admin_push('Dashboard', 'dashboard');
          $this->breadcrumbs->admin_push('products List', 'products');
          $this->breadcrumbs->admin_push('Edit products', 'products/edit/'.$prod_id);
          $row = $this->products_model->get_by_id($prod_id);
          if ($row) {
              $data = array(
                  'button' => 'Update',
                  'prod_id' => $prod_id,
                  'action' => admin_url('products/edit_products/'.$prod_id));

              $data['edit_data']=$row;
              $data['sold_as']=$this->config->item('sold_as');
              $data['tax_rate']=$this->config->item('tax_rate');
              $data['category_list']=$this->category_model->get_all();
              $data['brand_list']=$this->brands_model->get_all();
              $data['attributes_list']=$this->attributes_model->get_all();
              $this->layout->view_render('edit', $data);
          } else {
            $this->session->set_flashdata(array('message'=>'No Records Found','type'=>'warning'));
            redirectToAdmin('products');
          }

    }
    public function edit_products($prod_id){
      $this->_rules();
      if ($this->form_validation->run() == FALSE) {
          redirectToAdmin('products/edit/'.$prod_id);
      }

      $data_to_update=array(
        'name' => $this->input->post('name', TRUE),
        'category_id' => $this->input->post('product_category', TRUE),
        'brand_id' => $this->input->post('brand', TRUE),
        'description' => $this->input->post('description', TRUE),
        'updated_at'=>date("Y-m-d h:i:s")
      );
      if ($this->input->post("upload_image")) {
              $image = moveFile(0, $this->input->post("upload_image"), "image");
              $data_to_update['image_path'] = $image[0];
          }

     $result=$this->products_model->edit($prod_id,$data_to_update);

      $prod_price_ids=!empty($this->input->post('prod_price_ids')) ? $this->input->post('prod_price_ids'):"";
      $attributes=!empty($this->input->post('attributes')) ? $this->input->post('attributes'):"";
      $attributes_value=!empty($this->input->post('attributes_value'))?$this->input->post('attributes_value'):"";
      $sold_as=!empty($this->input->post('sold_as'))?$this->input->post('sold_as'):"";
      $price=!empty($this->input->post('price'))?$this->input->post('price'):"";
      $inventory=!empty($this->input->post('inventory'))?$this->input->post('inventory'):"";
      $tax_rate=!empty($this->input->post('tax_rate'))?$this->input->post('tax_rate'):"";
      if($attributes){
        $this->products_model->update_price($prod_id);
        foreach ($attributes as $key => $value) {
          $attribute_data=array('attributes_id'=>$attributes[$key],
                                'attributes_value'=>$attributes_value[$key],
                                'price' => $price[$key],
                                'sold_as'=>$sold_as[$key],
                                'inventory'=>$inventory[$key],
                                'updated_at'=>date("Y-m-d h:i:s"),
                                'is_deleted' =>'0',
                                'tax_rate'=>$tax_rate[$key]);

          if($prod_price_ids[$key]){
           $this->products_model->edit_price($prod_price_ids[$key],$attribute_data);
          }else {
            $attribute_data['prod_id']=$prod_id;
            $this->products_model->add_price($attribute_data);
          }
        }
      }

      if($result){
        $this->session->set_flashdata(array('message'=>'Product updated Successfully','type'=>'success'));
      }else {
        $this->session->set_flashdata(array('message'=>'Something went wrong. Try again','type'=>'warning'));
      }
      redirectToAdmin('products');
    }

    public function delete()
    {
      $prod_id=$this->input->post('prod_id');
      $result=$this->products_model->edit($prod_id,array('is_deleted'=>'1','updated_at'=>date("Y-m-d h:i:s") ));
      if($result){
        $this->activity_model->add(array('login_id'=>$this->login_id,'activity'=>ucfirst($this->username).' deleted a brand at '.date("M d, Y H:i")));
        echo json_encode(array('message'=>'Brand deleted Successfully','type'=>'success'));
      }else {
        echo json_encode(array('message'=>'Something went wrong','type'=>'warning'));
      }
    }
    public function _rules()
    {
        $this->form_validation->set_rules('name', 'Name', 'trim|required');
        $this->form_validation->set_rules('product_category', 'Product Category', 'trim|required');
        $this->form_validation->set_rules('brand', 'Product Brand', 'trim|required');
        $this->form_validation->set_rules('attributes[]', 'Product Attributes', 'trim|required');
        $this->form_validation->set_error_delimiters('<span class="text-danger">', '</span><br/>');
    }

}
