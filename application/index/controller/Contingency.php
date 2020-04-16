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
use app\common\controller\Adminbase;

class Contingency extends Adminbase
{
    protected function initialize()
    {
        parent::initialize();
    }
    //主页 模版
    public function index()
    {
        //根据当前控制器名 ->auth_id  ->子类
        $auth_id = Db('auth')->where('auth_c',$this->request->controller())->where('auth_pid','0')->field('auth_id')->find();
        $sub = Db('auth')->where('auth_pid',$auth_id['auth_id'])->order('auth_id','esc')->select();
        $defaultUrl = ($sub['0']['auth_isLink']) ? $sub['0']['auth_url'] : $sub['0']['auth_c'].'/'.$sub['0']['auth_a'];
        $is_http = ($sub['0']['auth_isLink']) ? 1 : 0;
        $this->assign('Sub',$sub);
        $this->assign('defaultUrl',$defaultUrl);
        $this->assign('is_http',$is_http);
        return $this->fetch();
    }

    //应急预案
    public function plan()
    {
        return $this->fetch();
    }

    //应急物资
    public function supplies()
    {
        $cates = Db('sup_cate')->select();
        $this->assign('Cates',$cates);

        if ($this->request->isAjax()) {
        $limit = $this->request->param('limit/d', 10);
        $page = $this->request->param('page/d', 1);
        $cate = $this->request->param('cate');
        $keyword = $this->request->param('keyword');

        if($keyword == null||$keyword==""){
            $keyword = '%';
        }
//        dump($keyword);
//        dump($cate);
            if(!empty($cate)){
                $result = Db('supplies')
                    ->page($page, $limit)
                    ->field('s.sup_id,s.s_name,c.s_c_name,s.s_num,s.s_c_remark,s.s_number,s.s_position,a.nickname,s.s_car_num,s.s_car_model,s_model,a.phone')
                    ->alias('s')
                    ->order(array('sup_id' => 'DESC'))
                    ->where('s.s_c_id', $cate)
                    ->where('s.s_name|s.s_model|s.s_car_model|c.s_c_name|s.s_position|s.s_car_num|a.nickname', 'like', '%' . $keyword . '%')
                    ->join('sup_cate c','s.s_c_id = c.s_c_id')
                    ->join('admin a','s.s_user_id = a.userid')
//                ->where('is_alarm = 1')
                    ->select();
                $total = Db('supplies')
                    ->alias('s')
                    ->where('s.s_c_id', $cate)
                    ->where('s.s_name|s.s_model|s.s_car_model|c.s_c_name|s.s_position|s.s_car_num|a.nickname', 'like', '%' . $keyword . '%')
                    ->join('sup_cate c','s.s_c_id = c.s_c_id')
                    ->join('admin a','s.s_user_id = a.userid')
                    ->count();
            }else{
                $result = Db('supplies')
                    ->page($page, $limit)
                    ->field('s.sup_id,s.s_name,c.s_c_name,s.s_num,s.s_c_remark,s.s_number,s.s_position,a.nickname,s.s_car_num,s.s_car_model,s_model,a.phone')
                    ->alias('s')
                    ->order(array('sup_id' => 'DESC'))
                    ->where('s.s_name|s.s_model|s.s_car_model|c.s_c_name|s.s_position|s.s_car_num|a.nickname', 'like', '%' . $keyword . '%')
                    ->join('sup_cate c','s.s_c_id = c.s_c_id')
                    ->join('admin a','s.s_user_id = a.userid')
//                ->where('is_alarm = 1')
                    ->select();
                $total = Db('supplies')
                    ->alias('s')
                    ->where('s.s_name|s.s_model|s.s_car_model|c.s_c_name|s.s_position|s.s_car_num|a.nickname', 'like', '%' . $keyword . '%')
                    ->join('sup_cate c','s.s_c_id = c.s_c_id')
                    ->join('admin a','s.s_user_id = a.userid')
                    ->count();
            }

//        $result = Db::name('categorys')->order(array('listorder', 'id' => 'DESC'))->select();

        $result = array("code" => 0,"msg" => '', "count" => $total, "data" => $result);
        return json($result);
        }
        return $this->fetch();
    }

    //应急物资 新增
    public function supplies_add()
    {
        if ($this->request->isPost()) {
            $data = $this->request->post();
//            dump($data);die;
            $res = Db('supplies')
                ->strict(false)
                ->insertGetId($data);
            $s_number = 'YJWZ-'.sprintf('%03d', $res);
            $ress = Db('supplies')
                ->where('sup_id', $res)
                    ->update(['s_number' => $s_number]);
            if ($ress){
                $this->success('新增成功！');
            }$this->error('新增失败！');
        }else{
            $cates = Db('sup_cate')->select();
            $users = db('admin')->field('userid,nickname')->order('userid', 'desc')->select();
            $this->assign('Cates',$cates);
            $this->assign('Users',$users);
            return $this->fetch();
        }
    }

    //应急物资 详情
    public function sup_details(){
        $sup_id = $this->request->param('sup_id');
        //获取设备信息
        $sups = Db('supplies')
            ->alias('s')
            ->field('s.sup_id,s.s_name,s.s_number,c.is_car,c.s_c_name,s.s_num,s.s_c_remark,s.s_number,s.s_position,a.nickname,s.s_car_num,s.s_car_model,s_model,a.phone')
            ->where('s.sup_id',$sup_id)
            ->join('sup_cate c','s.s_c_id = c.s_c_id')
            ->join('admin a','s.s_user_id = a.userid')
            ->find();
        //注入
        $this->assign("Sups", $sups);
        return $this->fetch();
    }

    //应急物资 详情编辑
    public function sup_edit(){
        if ($this->request->isPost()) {
            $sup_id = $this->request->param('sup_id');
            $data = $this->request->post();
            $res = Db('supplies')
                ->where('sup_id',$sup_id)
                ->strict(false)
                ->update($data);
//            $s_number = 'YJWZ-'.sprintf('%03d', $res);
//            $ress = Db('supplies')
//                ->where('sup_id', $res)
//                ->update(['s_number' => $s_number]);
            if ($res){
                $this->success('编辑成功！');
            }$this->error('编辑失败！');
        }else{
            $sup_id = $this->request->param('sup_id');
            //获取设备信息
            $sups = Db('supplies')
                ->alias('s')
                ->field('s.sup_id,s.s_name,s.s_c_id,a.userid,s.s_number,c.is_car,c.s_c_name,s.s_num,s.s_c_remark,s.s_number,s.s_position,a.nickname,s.s_car_num,s.s_car_model,s_model,a.phone')
                ->where('s.sup_id',$sup_id)
                ->join('sup_cate c','s.s_c_id = c.s_c_id')
                ->join('admin a','s.s_user_id = a.userid')
                ->find();
            //注入
            $this->assign("Sups", $sups);
            $cates = Db('sup_cate')->select();
            $users = db('admin')->field('userid,nickname')->order('userid', 'desc')->select();
            $this->assign('Cates',$cates);
            $this->assign('Users',$users);
            return $this->fetch();
        }

    }

    public function sup_del()
    {
        $sup_id = $this->request->param('sup_id');
        if (empty($sup_id)) {
            $this->error('ID错误');
        }
        if(Db('supplies')->delete($sup_id)){
            $this->success('删除成功！');
        }$this->error('删除失败！');
    }


    //应急队伍
    public function team()
    {
        return $this->fetch();
    }

    //应急演练
    public function drill()
    {
        return $this->fetch();
    }

    //指挥调度
    public function dispatch()
    {
        return $this->fetch();
    }

    //应急指挥
    public function command()
    {
        return $this->fetch();
    }

}