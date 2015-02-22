<?php
class GOB{
static public $hiba=[];
}
class ELL{
//a param tömböt járja be a cserel függvény, ide kell beírni a használt változókat.
static public $param=['min'=>'1','max'=>'250'];
static public $DATA=[];
static public $REG_EX=[
'R_ENG_SZO_KIS'=>'/^[a-z\d]+$/',  // 1 ha csak angol kisbetű és szám van benne szóköz sem lehet
'R_ENG_SZO'=>'/^[a-zA-Z\d]+$/',  // 1 ha csak angol kis és nagybetű és szám van benne szóköz sem lehet
'R_ENG_TOBB_SZO'=>'/^[a-zA-Z\d ]+$/',  //csak angol kis és nagybetű szám és szóköz van
'R_ENG_TEXT'=>'/^[a-zA-Z\d \!\"\?\.\:\(\)]+$/',//1 ha csak angol kis és nagybetű és szám szóköz és !?().:
'R_MIN_MAX'=>'/^.{<<min>>,<<max>>}$/',  
'R_MIN'=>'/^.{<<min>>,}$/',  
'R_MAX'=>'/^.{1,<<max>>}$/',  
'R_HU_SZO'=>'/^[a-zA-Z\d]+$/éáűúőóüöÁÉŰÚŐÓÜÖ]+$/',  // eng_szo plusz ékezetesek
'R_HU_TOBB_SZO'=>'/^[a-zA-Z\d éáűúőóüöÁÉŰÚŐÓÜÖ]+$/', //eng_tobb_szo plusz ékezetesek
'R_HU_TEXT'=>'/^[a-zA-Z\d \!\"\?\.\:\(\)éáűúőóüöÁÉŰÚŐÓÜÖ]+$/',//eng_text plusz 
'R_MAIL'=>'/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/'//1 ha email
];
static function cserel($cserelendo){//behelyettesíti a regexet a param tömb értékeivel
foreach(self::$param as $key=>$value){
$cserelt = str_replace("<<$key>>", $value,$cserelendo);
return $cserelt;
}}
static function param_beir($param){//frissíti a paratömböt
foreach($param as $key=>$value){
self::$param[$key] =$value;
}}

static function REG_EX($reg_ex,$str,$lang_param=[],$reg_param=[]){
self::param_beir($reg_param);//param frissítés----------
$reg_ex=self::cserel($reg_ex);//regex frissítés param alapján
$d=preg_match(self::$REG_EX[$reg_ex],$str); //regexel vizsgál
if(!$d)GOB::$hiba[]=LANG::RET($reg_ex,$lang_param); //ha hibát talál beírja a GOB::hiba tömbbe
return $d; // regex vizsgalat eredménye 0 vagy 1
}
static function REG_EX_TOMB($reg_ex_tomb,$str,$lang_param=[],$reg_param=[]){
foreach($reg_ex_tomb as $reg_ex){
$dd=REG_EX($reg_ex,$str,$lang_param,$reg_param);
if($dd){$d++;}
}
return $d; // regex vizsgalat eredménye 0 vagy 1
}
}
class LANG{
static public $param=[];
static public $lang_tomb=[
'R_MAX'=>'A <<0>> maximum <<1>> karakter lehet!',//változók mezőnév,maxchar
'R_MIN'=>'A <<0>> minimum <<1>> karakter hosszúnak kell lennie!',
'R_MIN_MAX'=>'A <<0>> minimum <<1>> mnaximum <<2>>  karakter hosszú lehet!',//változók 
'R_ENG_SZO_KIS'=>'A <<0>> mező csak ékezetnélküli kisbetűt és számot tartalmazhat szóköz nélkül',
'R_ENG_SZO'=>'A <<0>> mező csak ékezetnélküli betűt és számot tartalmazhat szóköz nélkül', 
'R_ENG_TOBB_SZO'=>'A <<0>> mező csak ékezetnélküli betűt és számot tartalmazhat szóközzel', 
'R_ENG_TEXT'=>'A <<0>> mező csak ékezetnélküli 
betűt,számot és  !?().: jeleket  tartalmazhat',
'R_HU_SZO'=>'A <<0>> mező csak betűt és számot tartalmazhat szóköz nélkül',
'R_HU_TOBB_SZO'=>'A <<0>> mező csak betűt,számot és szóközt tartalmazhat',
'R_HU_TEXT'=>'A <<0>> mező csak betűt,számot és  !?().: jeleket  tartalmazhat',
'R_MAIL'=>'Az email cím nem szabványos'
];
static function param_beir($param){//frissíti a paratömböt
foreach($param as $key=>$value){
self::$param[$key] =$value;
}}
static function cserel($cserelendo, $param=[]){
foreach($param as $key=>$value){
$cserelt = str_replace("<<$key>>", $value,$cserelendo);
return $cserelt;
}}
static function RET($szo,$param=[]){
$v= self::$lang_tomb[$szo];
$v=self::cserel($v, $param);
return $v;
}
// a $param lehet associativ vagy sima tömb
static function ECH($szo,$param=[]){echo self::RET($szo,$param);}
}

$adatok= ['pass'=>'pass11éé111adat', 'pass2'=>'pass222222adat'];

ELL::REG_EX_TOMB(['R_ENG_SZO','R_MAIL'],$adatok['pass']);

print_r(GOB::$hiba);
?>
