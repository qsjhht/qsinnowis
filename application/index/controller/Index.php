<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use app\common\controller\Adminbase;
use app\index\model\AdminUser as AdminUser_model;

class Index extends Adminbase
{
    public function index()
    {
        $this->assign('userInfo', $this->_userinfo);
        $navi = Db('auth')->where('auth_pid',0)->order('auth_id', 'esc')->select();
        //dump( $navi);die;
        $this->assign('Navi',$navi);
        return $this->fetch();
    }

    public function hello($name = 'ThinkPHP5')
    {
        return 'hello,' . $name;
    }

    //登录判断
    public function login()
    {
        $AdminUser_model = new AdminUser_model;
        if ($AdminUser_model->isLogin()) {
            $this->redirect('index/index/index');
        }
        if ($this->request->isPost()) {
            $data = $this->request->post();
            // 验证数据
            $result = $this->validate($data, 'AdminUser.checklogin');
            if (true !== $result) {
                $this->error($result);
            }
            //验证码
            /*if (!captcha_check($data['captcha'])) {
            $this->error('验证码输入错误！');
            return false;
            }*/
            $AdminUser_model->login($data['username'], $data['password']);
            if ($AdminUser_model->login($data['username'], $data['password'])) {

                $this->success('恭喜您，登陆成功', url('index/index/index'));
            } else {
                $this->error($AdminUser_model->getError(), url('index/index/index'));
            }
        } else {
            return $this->fetch();
        }

    }

    //手动退出登录
    public function logout()
    {
        $AdminUser_model = new AdminUser_model;
        if ($AdminUser_model->logout()) {
            //手动登出时，清空forward
            //cookie("forward", NULL);
            $this->success('注销成功！', url("admin/index/login"));
        }
    }
}
