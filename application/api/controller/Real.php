<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/18
 * Time: 16:33
 */

namespace app\api\controller;
use think\Controller;
use think\Db;
use think\Request;
use think\Validate;

class Real  extends Controller
{
    protected function initialize()
    {
        parent::initialize();
    }
    public function real_time()
    {
        $zone = $this->request->param('zone');
        //$last_time = Db::connect('yk_config')->table('history')->field('TIME')->order('TIME','desc')->limit(1)->find();
        /*$real =Db::connect('yk_config')
            ->table('history')
            ->where('TIME','=',function($query){
                $query->table('history')->field('TIME')->order('TIME','desc')->limit(1);
            })
            ->select();*/
        $realdata = [];
        $real = Db::connect('yk_config')->table('newtable')
            ->where('TIME','=',function($query){
                $query->table('newtable')->field('TIME')->order('TIME','desc')->limit(1);
            })
            ->field('NAME,VALUE')
            ->where('ZONE',$zone)
            ->select();
        foreach ($real as $value){
            $realdata[$value['NAME']] = $value['VALUE'];
        }
        //dump($realdata);
        /*$return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $real;*/
        echo json_encode($realdata,JSON_UNESCAPED_UNICODE);die;
    }
}