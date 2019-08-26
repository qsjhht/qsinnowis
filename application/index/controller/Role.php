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
use app\index\model\Role as RoleModel;

class Role extends Controller
{
    protected function initialize()
    {
        parent::initialize();
        $this->RoleModel = new RoleModel;
    }
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);
            $total = $this->RoleModel->count();
            $data = $this->RoleModel->page($page, $limit)->select();
            $data=json_decode($data,false);
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $data);
            return json($result);
        }
        /*$depts = $this->DeptModel->get_Tree($depts);
        //dump($depts);die;
        $this->assign('depts',$depts);*/
        return $this->fetch();

    }
    public function map()
    {
        return $this->fetch();
    }
    public function role_add()
    {
        if ($this->request->isPost()) {

            Db::transaction(function () {
                $data['role_name'] = $this->request->param('role_name');
                $data['role_detail'] = $this->request->param('role_detail');
                $data['dept_auth_ids'] = $this->request->param('dept_auth_ids');
                $data['dept_auth_names'] = $this->request->param('dept_auth_names');
                dump($data);die;
                $role_path = Db('role')->insertGetId($data);
                if(!$data['role_pid']){
                    $update['role_level'] = Db('role')->field('role_level')->where('role_id',$data['role_pid'])->find()['role_level'] + 1;
                }
                $update['role_level'] = '0';
                $update['role_path'] = $role_path;
                Db('role')->where('role_id',$role_path)->update($update);
                $this->success('新增角色成功！');
            });
            $this->error('新增角色失败！');
        }else{
            return $this->fetch();
        }
    }
    public function role_details()
    {
        $dept_id = $this->request->param('dept_id');
        $details = $this->RoleModel->where('dept_id',$dept_id)->find();
        /*if(!$details['dept_pid']){
            $details['dept_p'] = '该角色为顶级';
        }else{
            $dept_name = $this->RoleModel->where('dept_id',$details['dept_pid'])->field('dept_name')->find();
            $details['dept_p'] = $dept_name['dept_name'];
        }*/
        $this->assign('details',$details);
        return $this->fetch();
    }
    public function dept_edit()
    {

        if ($this->request->isPost()) {
            Db::transaction(function () {
                $dept_id = $this->request->param('dept_id');
                $data['dept_name'] = $this->request->param('dept_name');
                $data['dept_pid'] = $this->request->param('dept_pid');
                $data['location'] = $this->request->param('location');
                $data['detail'] = $this->request->param('detail');
                $data['remarks'] = $this->request->param('remarks');
                Db('dept')->where('dept_id',$dept_id)->update($data);
                if($data['dept_pid']){
                    $update['dept_level'] = Db('dept')->field('dept_level')->where('dept_id',$data['dept_pid'])->find()['dept_level'] + 1;
                }else{
                    $update['dept_level'] = 0;
                }
                Db('dept')->where('dept_id',$dept_id)->update($update);
                $this->success('编辑角色成功！');
            });
            $this->error('编辑角色失败！');
        }
        $dept_id = $this->request->param('dept_id');
        $details = $this->RoleModel->where('dept_id',$dept_id)->find();
        if(!$details['dept_pid']){
            $details['dept_p'] = '该角色为顶级';
        }else{
            $dept_name = $this->RoleModel->where('dept_id',$details['dept_pid'])->field('dept_name')->find();
            $details['dept_p'] = $dept_name['dept_name'];
        }
        $this->assign('details',$details);
        return $this->fetch();
    }
    public function dept_del(){
        $dept_id = (int)$this->request->param('dept_id/d');
        if (empty($dept_id)) {
            $this->error('ID错误');
        }
        /*$result = Db::name('eqpt_management')->where(["parentid" => $id])->find();
        if ($result) {
            $this->error("含有子菜单，无法删除！");
        }*/
        if ($this->RoleModel->where('dept_id', $dept_id)->delete()) {
            $this->success("删除角色成功！");
        } else {
            $this->error("删除角色失败！");
        }
    }
    public function get_tree_data()
    {
        $auths = Db('auth')->field('auth_id,auth_pid,auth_name')->select();
        $auths = $this->RoleModel->get_Tree($auths,'auth_id','auth_pid','auth_name');
        return $auths;
    }
}