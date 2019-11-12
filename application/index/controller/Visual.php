<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/4/29
 * Time: 9:43
 */
namespace app\index\controller;

use think\Controller;
use think\Db;
use app\index\model\Visuals as Visual_Model;
use app\common\controller\Adminbase;

class Visual extends Adminbase
{
    public function index()
    {
        $range = db('work_plan')->field('time_range')->select();
        foreach ($range as $ra) {
            $j = date("H:i:s");

            $h = strtotime($j);

            $time = explode(' - ', $ra['time_range']);


            $z = strtotime($time['0']);//获得指定分钟时间戳，00:00
            if($time['1'] == '00:00:00'){
                $time['1'] = '24:00:00';
            }
            $x = strtotime($time['1']);//获得指定分钟时间戳，00:29

            if ($h > $z && $h < $x) {
                $this->assign('S_time', date('H:i',$z));
                $this->assign('E_time', date('H:i',$x));
            }
        }
            $this->assign('Uname', $this->_userinfo['nickname']);
            return $this->fetch();
    }

    public function map()
    {
        return $this->fetch();
    }
    public function bim()
    {
        return $this->fetch();
    }
    public function demo()
    {
        return $this->fetch();
    }
    public function demoOne()
    {
        $this->assign('Uname', $this->_userinfo['nickname']);
        return $this->fetch();
    }
    public function demoTwo()
    {
        return $this->fetch();
    }
    public function demoThree()
    {
        return $this->fetch();
    }
}