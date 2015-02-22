<?php
include 'language/hu.php';
class LANG{
static public $param=[];
static public $lang_tomb=[];

static function param_beir($param){//frissíti a paratömböt
foreach($param as $key=>$value){
self::$param[$key]=$value;
}}
static function cserel($cserelendo,$param=[]){
foreach($param as $key=>$value){
$cserelendo = str_replace("<<$key>>", $value,$cserelendo);
}
return $cserelendo;
}
static function RET($szo,$param=[]){
$v= self::param_beir($param);
$v= self::$lang_tomb[$szo];
if($v==''){$v=$szo;}else{$v=self::cserel($v, $param);}
return $v;
}
// a $param lehet associativ vagy sima tömb
static function ECH($szo,$param=[]){echo self::RET($szo,$param);}
}

 LANG::$lang_tomb=$lang_tomb;