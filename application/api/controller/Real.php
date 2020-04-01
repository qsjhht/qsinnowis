<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/9/18
 * Time: 16:33
 */

namespace app\api\controller;
use app\index\model\Realsql as RealsqlModel;
use app\index\model\Phone as PhoneModel;
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

        $sql="SELECT * FROM realtime where TagName like 'WIN%".$zone."%'";
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

        $pars = 'T_'.$name.'_'.$zone;  //区分 T LT
        $conn=odbc_connect('kinghistory','sa','sa');
        if (!$conn)
        {
            exit("连接失败: " . $conn);
        }
        $sql="SELECT top 200 * FROM history where TagName like '%".$pars."' and DataTime > '2019-10-10' order by DataTime desc";
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

    public function real_timest()
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

        $pars = 'T_'.$name.'_'.$zone;  //区分 T LT
        $conn=odbc_connect('kinghistory','sa','sa');
        if (!$conn)
        {
            exit("连接失败: " . $conn);
        }
        $sql="SELECT top 200 * FROM history where TagName like '%".$pars."' and DataTime > '2019-10-10' order by DataTime desc";
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
            $yk_arr[] = ['time'=>odbc_result($rs,"DataTime"),'data'=>odbc_result($rs,"DataValue")];
//            $yk_arr[odbc_result($rs,"DataTime")] = odbc_result($rs,"DataValue");
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
        $pars = 'T_'.$name.'_'.$zone; //区分 T LT
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

    public function status_refresh()
    {
        return  'false';
    }

    public function call_ericsson()
    {

//        $msg = 'hello';
//        $handle = stream_socket_client("udp://127.0.0.1:22335", $errno, $errstr);
//        if( !$handle ){
//            die("ERROR: {$errno} - {$errstr}\n");
//        }
//        fwrite($handle, $msg."\n");
//        $result = fread($handle, 1024);
//        fclose($handle);

        //创建一个socket套接流
        $socket = socket_create(AF_INET,SOCK_DGRAM,SOL_UDP);
        /****************设置socket连接选项，这两个步骤你可以省略*************/
        //接收套接流的最大超时时间1秒，后面是微秒单位超时时间，设置为零，表示不管它
        socket_set_option($socket, SOL_SOCKET, SO_RCVTIMEO, array("sec" => 1, "usec" => 0));
        //发送套接流的最大超时时间为6秒
        socket_set_option($socket, SOL_SOCKET, SO_SNDTIMEO, array("sec" => 1, "usec" => 0));
        /****************设置socket连接选项，这两个步骤你可以省略*************/

        //连接服务端的套接流，这一步就是使客户端与服务器端的套接流建立联系
        if(socket_connect($socket,'127.0.0.1',22334) == false){
            echo 'connect fail massege:'.socket_strerror(socket_last_error());
        }else{
            $message = 'call somebody Ericsson Ericsson Ericsson';
            //转为GBK编码，处理乱码问题，这要看你的编码情况而定，每个人的编码都不同
            $message = mb_convert_encoding($message,'GBK','UTF-8');
            //向服务端写入字符串信息

            if(socket_write($socket,$message,strlen($message)) == false){
                echo 'fail to write'.socket_strerror(socket_last_error());

            }else{
                echo 'client write success'.PHP_EOL;
                //读取服务端返回来的套接流信息
//                while($callback = socket_read($socket,1024)){
//                    echo 'server return message is:'.PHP_EOL.$callback;
//                }
            }
        }
        socket_close($socket);//工作完毕，关闭套接流


    }

    public function get_video_set()
    {
        $sets = db('video_set')
            ->select();
        echo json_encode($sets,JSON_UNESCAPED_UNICODE);die;
    }

    public function video_set()
    {
        $realsql = new RealsqlModel();
        $sets = $this->request->param();
        $arr = [];
        $arrs = [];
        foreach ($sets as $key=>$val) {
            $key = substr($key,2);
            $arr['id'] = $key;
            $arr['token'] = $val;
            $arrs[] = $arr;
        }
        $res = $realsql->saveAll($arrs);
        if($res){
            $this->return_msg(200, '更新成功！');
        }
//
    }

    public function get_phone()
    {
        $serverName  =  "192.168.20.50" ;
        $connectionInfo  = array(  "Database" => "RMDDISP" ,  "UID" => "sa" ,  "PWD" => "Qiushi123"  );
        $conn  =  sqlsrv_connect (  $serverName ,  $connectionInfo );
        if(  $conn  ===  false  ) {
            die(  print_r (  sqlsrv_errors (),  true ));
        }

        $sql  =  "select * FROM 组分机" ;

        // print "SQL: $sql\n";

        // $str=iconv ( "utf-8", "gb2312//IGNORE", $str ); //第一次转换，不可省略，省略立即报错
        $cmd='SELECT *  FROM 组分机;';//拼接
        $long= iconv ( "utf-8", "gb2312//IGNORE", $cmd );//第二次转换，不可省略
        $result = sqlsrv_query($conn , $long);//正常运行未报错


        // $result = sqlsrv_query($conn, $sql);
        if($result === false) {
            $this->return_msg(400, '获取失败！');
            die(print_r(sqlsrv_errors(), true));
        }
        #Fetching Data by array
        while($row = sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC)) {
            // $row = iconv('gbk', 'utf-8', $row);
            foreach ($row as $key => $value) {
                $keys = $this->doEncoding($key);
                $arr[$keys] = $this->doEncoding($value);
            }
            $data[] = $arr;
        }
        $this->return_msg(200, '获取成功！',$data);
//        $phone_data = Db::connect('phone_config');
//
//
//        if($phone_data){
//            $this->return_msg('200','获取成功！',$phone_data);
//        }else{
//            $this->return_msg('400','获取失败！');
//        }

    }


}