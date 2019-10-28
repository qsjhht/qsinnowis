<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/10/25
 * Time: 11:00
 */

namespace app\index\controller;

use think\Db;
use app\common\controller\Adminbase;

class Attendance extends Adminbase
{
    public function index()
    {
        //根据当前控制器名 ->auth_id  ->子类
        $auth_id = Db('auth')->where('auth_c',$this->request->controller())->where('auth_pid','0')->field('auth_id')->find();
        $sub = Db('auth')->where('auth_pid',$auth_id['auth_id'])->select();
        $defaultUrl = ($sub['0']['auth_isLink']) ? $sub['0']['auth_url'] : $sub['0']['auth_c'].'/'.$sub['0']['auth_a'];
        $is_http = ($sub['0']['auth_isLink']) ? 1 : 0;
        $this->assign('Sub',$sub);
        $this->assign('defaultUrl',$defaultUrl);
        $this->assign('is_http',$is_http);
        return $this->fetch('index',[],['__PUBLIC__'=>'/public/']);
    }

//    排班管理
    public function set()
    {
        return $this->fetch();
    }

//    值班考勤
    public function check()
    {
        return $this->fetch();
    }

//    值班异常记录
    public function abnorma()
    {
        return $this->fetch();
    }

//    值班日志
    public function log()
    {
        return $this->fetch();
    }

}