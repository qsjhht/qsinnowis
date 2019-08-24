<?php
namespace app\index\model;

use app\index\controller\Eqpt;
use think\Db;
use think\Model;

class Dept extends Model
{
    public function get_dept_tree(){
        return json_encode($this->field('dept_id')->select());
        
    }

    public function get_Tree($arr){
        $array = [];
        foreach ($arr as $key => $value) {
            $array[$key]['id'] = $value['dept_id'];
            $array[$key]['pid'] = $value['dept_pid'];
            $array[$key]['name'] = $value['dept_name'];
            $array[$key]['open'] = false;
            $array[$key]['checked'] =  false;
        }

        return $this->quote_make_tree($array);
    }
   
    public static function quote_make_tree($list, $pk = 'id', $pid = 'pid',$child = 'children', $root = 0)
    {
        $tree = $packData = [];
        foreach ($list as $data) {
            $packData[$data[$pk]] = $data;
        }
        foreach ($packData as $key =>$val) {
            if ($val[$pid] == $root) {//代表跟节点
              $tree[] = & $packData[$key];
              unset($packData[$key]['pid']);
            } else {
              //找到其父类
              $packData[$val[$pid]][$child][] = & $packData[$key];
              unset($packData[$key]['pid']);
            }
        }

        return json_encode($tree);
    }

}
