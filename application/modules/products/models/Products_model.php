<?php
# @Author: Sahebul
# @Date:   2019-05-29T11:59:41+05:30
# @Last modified by:   Sahebul
# @Last modified time: 2019-05-29T11:24:15+05:30



if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Products_model extends MY_Model
{
  protected $tbl;
  protected $primary_key;
  function __construct(){
    parent::__construct();
    $this->tbl="tbl_products";
    $this->primary_key = "prod_id";
  }
    // get data by id
    function get_by_id($id)
    {
        $this->db->select("p.*,pp.*,tpa.name as attributes_name")
                  ->from('tbl_products as p')
                  ->join('tbl_product_price as pp','pp.prod_id=p.prod_id','left')
                  ->join('tbl_product_attributes as tpa','tpa.attributes_id=pp.attributes_id','left')
                  ->where(array("p.prod_id"=>$id,"p.is_deleted"=>"0","pp.is_deleted"=>"0"));
        return $this->db->get()->result();
    }
    function get_all(){
      $this->db->select("name")
                ->from($this->tbl)
                ->where('is_deleted','0')
                ->order_by('name');
      return $this->db->get()->result();
    }
    function add($data){
        $this->db->insert($this->tbl,$data);
        return $this->db->insert_id();
    }
    function add_price($data){
      $this->db->insert("tbl_product_price",$data);
      return $this->db->insert_id();
    }
    function edit_price($prod_price_id,$data){
      $this->db->where('prod_price_id',$prod_price_id);
      $this->db->update("tbl_product_price",$data);
    }
    function update_price($prod_id){
      $this->db->where('prod_id',$prod_id);
      $this->db->update("tbl_product_price",array('is_deleted'=>"1"));
    }

    function edit($id,$data){
      $this->db->where($this->primary_key, $id);
      $this->db->update($this->tbl,$data);
      return $this->db->affected_rows();
    }

    function get_product_inventory($prod_id){
      $query = "SELECT
                  tp.name as product_name,
                  tp.image_path,
                  tpp.prod_id,
                  tpp.prod_price_id,
                  tpp.attributes_id,
                  tpp.attributes_value,
                  tpp.sold_as,
                  tpp.price,
                  tpp.tax_rate,
                  tpp.inventory,
                  tap.name as attributes_name
                 FROM tbl_product_price as tpp
                 LEFT JOIN tbl_product_attributes as tap on tap.attributes_id=tpp.attributes_id
                 LEFT JOIN tbl_products as tp on tp.prod_id=tpp.prod_id
                 WHERE  tpp.is_deleted='0' AND tpp.prod_id=$prod_id group by tpp.prod_price_id";
      return $this->db->query($query)->result();
    }
    function get_products(){
      $query = "SELECT
                  tp.prod_id,
                  tp.image_path,
                  tp.name,
                  tc.name as category_name,
                  tb.name as brand_name
                 FROM tbl_products as tp
                 LEFT JOIN tbl_category as tc on tp.category_id=tc.category_id
                 LEFT JOIN tbl_brand as tb on tp.brand_id=tb.brand_id
                 WHERE tp.is_deleted='0' ";

     $totalCol = $this->input->post('iColumns');
     $search = $this->input->post('sSearch');
     $columns = explode(',', $this->input->post('columns'));
     $start = $this->input->post('iDisplayStart');
     $page_length = $this->input->post('iDisplayLength');

     $query .= " AND (tp.name like '%$search%' OR tc.name like '%$search%' OR tb.name like '%$search%' )";
     $query .= " GROUP BY tp.prod_id";
     $totalRecords = count($this->db->query($query)->result());

     for ($i = 0; $i < $this->input->post('iSortingCols'); $i++) {
         $sortcol = $this->input->post('iSortCol_' . $i);
         if ($this->input->post('bSortable_' . $sortcol)) {
           $query .= " ORDER BY ($columns[$sortcol])" . $this->input->post('sSortDir_' . $i);
         }
     }

     $this->db->limit($page_length, $start);

     $query .= " LIMIT $start,$page_length";
     $result = $this->db->query($query);
     $data = $result->result();
     $resData = json_encode(array(
         "aaData" => $data,
         "iTotalDisplayRecords" => $totalRecords,
         "iTotalRecords" => $totalRecords,
         "sColumns" => $this->input->post('sColumns'),
         "sEcho" => $this->input->post('sEcho')
     ));

     return $resData;
    }
}
