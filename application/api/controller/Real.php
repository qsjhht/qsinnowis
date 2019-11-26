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

class Real extends Common
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
        /*$realdata = [];
        $real = Db::connect('yk_config')->table('newtable')
            ->where('TIME','=',function($query){
                $query->table('newtable')->field('TIME')->order('TIME','desc')->limit(1);
            })
            ->field('NAME,VALUE')
            ->where('ZONE',$zone)
            ->select();
        foreach ($real as $value){
            $realdata[$value['NAME']] = $value['VALUE'];
        }*/
        $conn=odbc_connect('kinghistory','sa','sa');
        if (!$conn)
        {
            exit("连接失败: " . $conn);
        }

        $sql="SELECT * FROM realtime where TagName like '%".$zone."'";
        $rs=odbc_exec($conn,$sql);

        if (!$rs)
        {
            exit("SQL 语句错误");
        }
        $yk_arr = array();
        while (odbc_fetch_row($rs))
        {
//            $name = substr(odbc_result($rs,"TagName"),-5);
            /* $compname=odbc_result($rs,"TagName");*/
            //$conname=odbc_result($rs,"DataTime");
//            if($name == $zone){
                $yk_arr[substr(odbc_result($rs,"TagName"),16)] =odbc_result($rs,"DataValue");
//            }
//            $yk_arr[$name]['TagName'] = $name;
//            $yk_arr[$name]['DataTime'] = odbc_result($rs,"DataTime");
//            $yk_arr[$name]['DataValue'] = odbc_result($rs,"DataValue");
//            echo "<tr><td>$compname</td>";
            //echo "<td>$conname</td></tr>";
//            $yk_arr[substr(odbc_result($rs,"TagName"),16)] = odbc_result($rs,"DataTime");
//            $yk_arr[odbc_result($rs,"DataTime")] =odbc_result($rs,"DataValue");

        }
        odbc_close($conn);
        /*dump($yk_arr);
        die;*/
        //dump($realdata);
        /*$return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $real;*/
        echo json_encode($yk_arr,JSON_UNESCAPED_UNICODE);die;
    }
    public function real_times()
    {
        $zone = $this->request->param('zone');
        $name = $this->request->param('name');
        //$last_time = Db::connect('yk_config')->table('newtable')->field('TIME')->order('TIME','desc')->limit(1)->find();
        /*$real =Db::connect('yk_config')
            ->table('history')
            ->where('TIME','=',function($query){
                $query->table('history')->field('TIME')->order('TIME','desc')->limit(1);
            })
            ->select();*/
//        $realdata = [];
        /*$real = Db::connect('yk_config')->table('newtable')
            ->where('TIME','in',function($query){
                $query->table('newtable')->field('TIME')->order('TIME','desc')->limit(1000);
            })
            ->field('TIME,VALUE')
            ->where('ZONE',$zone)
           // ->where('NAME',$name)
            ->select();*/
//        $real_times = Db::connect('yk_config')
//            ->table('newtable')
//            ->field('TIME,VALUE')
//            ->order('TIME','esc')
//            ->where('NAME',$name)
//            ->limit(100)
//            ->select();
        //dump($last_time);
        /*$return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $real;*/
//        foreach ($real_times as $value){
//            $realdata[$value['TIME']] = $value['VALUE'];
//        }
//        echo json_encode($realdata,JSON_UNESCAPED_UNICODE);die;

        $pars = $name.'_'.$zone;
        $conn=odbc_connect('kinghistory','sa','sa');
        if (!$conn)
        {
            exit("连接失败: " . $conn);
        }

        $sql="SELECT top 200 * FROM history where TagName like '%".$pars."' and DataTime > '2010-10-10' order by DataTime desc";
        $rs=odbc_exec($conn,$sql);

        if (!$rs)
        {
            exit("SQL 语句错误");
        }

        $yk_arr = array();
        $num = 0;
        while (odbc_fetch_array($rs))
        {
//            $yk_arr[substr(odbc_result($rs,"TagName"),16)] =odbc_result($rs,"DataValue");
//            $yk_arr[] =  array(odbc_result($rs,"DataTime") => odbc_result($rs,"DataValue"));
            $yk_arr[odbc_result($rs,"DataTime")] = odbc_result($rs,"DataValue");
//            $name = substr(odbc_result($rs,"TagName"),-5);
            /* $compname=odbc_result($rs,"TagName");*/
            //$conname=odbc_result($rs,"DataTime");
//            if($name == $zone){
//            }
//            $yk_arr[$name]['TagName'] = $name;
//            $yk_arr[$name]['DataTime'] = odbc_result($rs,"DataTime");
//            $yk_arr[$name]['DataValue'] = odbc_result($rs,"DataValue");
//            echo "<tr><td>$compname</td>";
            //echo "<td>$conname</td></tr>";
//            $yk_arr[substr(odbc_result($rs,"TagName"),16)] = odbc_result($rs,"DataTime");
//            $yk_arr[odbc_result($rs,"DataTime")] =odbc_result($rs,"DataValue");
        }
        odbc_close($conn);
        /*dump($yk_arr);
        die;*/
        //dump($realdata);
        /*$return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $real;*/
        echo json_encode(array_reverse($yk_arr) ,JSON_UNESCAPED_UNICODE);die;

    }

    public function get_last_real()
    {
        $zone = $this->request->param('zone');
        $name = $this->request->param('name');
        $pars = $name.'_'.$zone;
        $conn=odbc_connect('kinghistory','sa','sa');
        if (!$conn)
        {
            exit("连接失败: " . $conn);
        }
        $sql="SELECT * FROM realtime where TagName like '%".$pars."'";
        $rs=odbc_exec($conn,$sql);

        if (!$rs)
        {
            exit("SQL 语句错误");
        }
        $yk_arr = array();
        while (odbc_fetch_row($rs))
        {
            $yk_arr[odbc_result($rs,"DataTime")] =odbc_result($rs,"DataValue");
        }
        odbc_close($conn);
        /*dump($yk_arr);
        die;*/
        //dump($realdata);
        /*$return_data['code'] = 200;
        $return_data['msg']  = '查询成功！';
        $return_data['data'] = $real;*/
        echo json_encode($yk_arr,JSON_UNESCAPED_UNICODE);die;

//        $real_times = Db::connect('yk_config')
//            ->table('newtable')
//            ->field('TIME,VALUE')
//            ->order('TIME','desc')
//            ->where('NAME',$name)
//            ->find();
//        $realdata = [];
//        $realdata[$real_times['TIME']] = $real_times['VALUE'];
//        echo json_encode($realdata,JSON_UNESCAPED_UNICODE);die;
    }
}