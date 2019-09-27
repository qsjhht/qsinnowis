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
use app\index\model\User as UserModel;

class User extends Controller
{
    private $host;
    private $url;
    private $default_icon;
    private $default_pwd ;
    protected function initialize()
    {
        parent::initialize();
        $this->host = 'http://192.168.20.60:8080';
        $this->url = $this->host .= "/RMD_PipeGallery/rmdBaseEquipmentController.do?addOrUpdateUser";
        $this->UserModel = new UserModel;
        $this->default_icon = '/photo/default/usericon.jpeg';
        $this->default_pwd = '123456';
    }
    public function index()
    {
        if ($this->request->isAjax()) {
            $limit = $this->request->param('limit/d', 10);
            $page = $this->request->param('page/d', 1);
            $field = "u.user_id,u.user_name,u.user_phone,u.user_icon,u.user_sex,r.role_name,d.dept_name";
            $join  = [['role r', 'u.user_role_id = r.role_id', 'LEFT'], ['dept d', 'u.user_dept_id = d.dept_id', 'LEFT']];
            $res   = db('user')->alias('u')->field($field)->order('u.user_id', 'desc')->join($join)->page($page, $limit)->select();
            $total = $this->UserModel->count();
            $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $res);
            return json($result);
        }
        /*$depts = $this->UserModel->get_Tree($depts);
        //dump($depts);die;
        $this->assign('depts',$depts);*/
        return $this->fetch();

    }
    public function user_add()
    {
        if ($this->request->isPost()) {

            Db::transaction(function () {
                $data['user_name'] = $this->request->param('user_name');
                $data['user_phone'] = $this->request->param('user_phone');
                $data['user_sex'] = $this->request->param('user_sex');
                $data['user_dept_id'] = $this->request->param('user_dept_id');
                $data['user_role_id'] = $this->request->param('user_role_id');
                $data['user_icon'] = $this->default_icon;
                $data['user_pwd'] = md5($this->default_pwd);
                $user_id = Db('user')->insertGetId($data);
                //拼接url 发送get请求
                $arr['userName'] = $data['user_name'];
                $arr['userId'] = $user_id;
                $arr['type'] = 'add';

                $arr = json_encode($arr);

                $res = $this->get_url($arr,$this->url);
                if($res['flag']){
                    $this->success('新增用户成功！');
                }
            });
            $this->error('新增用户失败！');
        }else{
            $fieldrole  = "role_id,role_name";
            $role = Db('role')->field($fieldrole)->select();
            $this->assign('Role',$role);
            return $this->fetch();
        }
    }
    public function user_details()
    {
        $user_id = $this->request->param('user_id');
        $field = "u.user_id,u.user_name,u.user_phone,u.user_icon,u.user_sex,r.role_name,d.dept_name";
        $join  = [['role r', 'u.user_role_id = r.role_id', 'LEFT'], ['dept d', 'u.user_dept_id = d.dept_id', 'LEFT']];
        $details   = db('user')->alias('u')->field($field)->order('u.user_id', 'desc')->join($join)->where('user_id',$user_id)->find();
        $this->assign('details',$details);
        return $this->fetch();
    }
    public function user_edit()
    {
        if ($this->request->isPost()) {
            Db::transaction(function () {
                $user_id = $this->request->param('user_id');
                $data['user_name'] = $this->request->param('user_name');
                $data['user_phone'] = $this->request->param('user_phone');
                $data['user_dept_id'] = $this->request->param('user_dept_id');
                $data['user_role_id'] = $this->request->param('user_role_id');
                Db('user')->where('user_id',$user_id)->update($data);
                $arr['userName'] = $data['user_name'];
                $arr['userId'] = $user_id;
                $arr['type'] = 'update';
                $arr = json_encode($arr);
                $res = $this->get_url($arr,$this->url);
                if($res['flag']){
                    $this->success('编辑用户成功！');
                }
            });
            $this->error('编辑用户失败！');
        }

        $user_id = $this->request->param('user_id');
        $field = "u.user_id,u.user_name,u.user_phone,u.user_icon,u.user_dept_id,u.user_role_id,u.user_sex,r.role_name,d.dept_name";
        $join  = [['role r', 'u.user_role_id = r.role_id', 'LEFT'], ['dept d', 'u.user_dept_id = d.dept_id', 'LEFT']];
        $details   = db('user')->alias('u')->field($field)->order('u.user_id', 'desc')->join($join)->where('user_id',$user_id)->find();

        $fieldrole  = "role_id,role_name";
        $role = Db('role')->field($fieldrole)->select();
        $this->assign('Role',$role);
        $this->assign('details',$details);
        return $this->fetch();
    }
    public function user_del(){
        $user_id = (int)$this->request->param('user_id/d');
        if (empty($user_id)) {
            $this->error('ID错误');
        }
        /*$result = Db::name('eqpt_management')->where(["parentid" => $id])->find();
        if ($result) {
            $this->error("含有子菜单，无法删除！");
        }*/
        if ($this->UserModel->where('user_id', $user_id)->delete()) {
            $arr['userId'] = $user_id;
            $arr['type'] = 'delete';

            $arr = json_encode($arr);
            $res = $this->get_url($arr,$this->url);
            if($res['flag']){
                $this->success('删除用户成功！');
            }
        } else {
            $this->error("删除用户失败！");
        }
    }
    public function get_tree_data()
    {
        $depts = Db('dept')->field('dept_id,dept_pid,dept_name')->select();
        $depts = $this->UserModel->get_Tree($depts,'dept_id','dept_pid','dept_name');
        return $depts;
    }
    public function get_url($arr,$url){

        $post_data = array(
            "params" => $arr,
        );
        $ch = curl_init ();
        curl_setopt ( $ch, CURLOPT_URL, $url );
        curl_setopt ( $ch, CURLOPT_POST, 1 );
        curl_setopt ( $ch, CURLOPT_HEADER, 0 );
        curl_setopt ( $ch, CURLOPT_RETURNTRANSFER, 1 );
        curl_setopt ( $ch, CURLOPT_POSTFIELDS, $post_data );
        curl_setopt ($ch, CURLOPT_HTTPHEADER, array("Expect:"));
        $return = curl_exec ( $ch );
        curl_close ( $ch );
        $output = json_decode($return,true);
        return $output;
    }
}