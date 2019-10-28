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