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
use app\index\model\Dept as DeptModel;

class Dept extends Controller
{
    protected function initialize()
    {
        parent::initialize();
        $this->DeptModel = new DeptModel;
    }
    public function index()
    {
        $depts = Db('dept')->field('dept_id,dept_pid,dept_name')->select();
        $depts = $this->DeptModel->get_Tree($depts);
        $this->assign('depts',$depts);
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
    public function get_tree_data()
    {
        $depts = Db('dept')->field('dept_id,dept_pid,dept_name')->select();
        return unserialize($this->DeptModel->get_Tree($depts));
    }
}