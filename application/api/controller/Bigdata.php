<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/21
 * Time: 15:03
 */

namespace app\api\controller;
use think\Controller;
use think\Db;

class Bigdata extends Controller
{
    protected function initialize()
    {
        parent::initialize();
    }
    public function date()
    {
     $this->start_date = Db('st_d_time')->limit(1)->field('start_time')->find();
    //         $start_time = strtotime();
     //$this->date_start = new \DateTime($this->start_date['start_time']);
     //$days = $this->start_date['start_time']->diff($this->new_date)->days;
     $days = floor(abs((time() - $this->start_date['start_time']) / 86400));
     $arr['days'] = $days;
     $txt =  json_encode($arr,JSON_UNESCAPED_UNICODE);
     echo $txt;
    }
    public function return_msg($code, $msg = '', $data = [])
    {
        // 组合数据
        $return_data['code'] = $code;
        $return_data['msg']  = $msg;
        $return_data['data'] = $data;
        // 返回信息并终止脚本
        echo json_encode($return_data,JSON_UNESCAPED_UNICODE);die;
    }

}