<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/1/25
 * Time: 10:33
 */

namespace app\index\controller;


use think\Controller;
use think\Db;



class Enterprise extends Controller
{
    //$this->

    //设备管理首页 模版继承 注入左侧导航
    public function index()
    {
        $eqpt = Db('auth')->where('auth_pid',106)->select();
        $this->assign('Eqpt',$eqpt);
        return $this->fetch();
    }

    public function firm()
    {
        return $this->fetch();
    }

    public function pay()
    {
        return $this->fetch();
    }



}