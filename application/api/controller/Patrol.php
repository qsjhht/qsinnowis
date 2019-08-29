<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/8/29
 * Time: 11:40
 */

namespace app\api\controller;
use think\Db;
use think\Request;

class Patrol extends Common
{
    public function data()
    {
        $data = $this->params;
        $this->return_msg(200, '连接失败！', $data);
        $datas = Db('rmd_base_equipment')->where('id'<100)->select();


            $this->return_msg(200, '连接失败！', $datas);



    }
    public function eqpt_data()
    {
        $data = $this->params;

        $return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $data;
        echo json_encode($return_data,JSON_UNESCAPED_UNICODE);die;
        $this->return_msg(200, '查询成功！', $data['eqpt_id']);
        $datas = Db('rmd_base_equipment')->field('equipmentName,catalogue,equipmentGuide')->where('id'<100)->select();
        phpinfo();
    }
}