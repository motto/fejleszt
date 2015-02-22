<html dir="ltr" lang="hu-HU"><head>
    <meta charset="utf-8"/>
</head>
<body>
<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);

class GOB{
static public $hiba=[];
}
ELL::$adatok= ['pass'=>'pass11éé11 1adat', 'pass2'=>'pass2222b 22adat'];
//ELL::REG_EX('R_SZAM','pass2');
//ELL::REG_EX_TOMB(['R_ENG_SZO','R_ENG_TOBB_SZO','R_MAIL'],'pass2');
//$d=preg_match('/^[-]?[\d ]+$/','-44752572');
//echo $d;
ELL::SAME_2M('MEZO=ERTEK','pass','pass2');
tomb_kiir(GOB::$hiba);
class ELL{
//a param tömböt járja be a cserel függvény, ide kell beírni a használt változókat.
static public $param=['min'=>'1','max'=>'250'];
static public $adatok=[];
static public $REG_EX=[
'R_SZAM'=>'/^[-+]?(\d*[.])?\d+$/', //pozitív vagy negativ szám tizeds tört is lehet
'R_SZAM_POZ'=>'/^(\d*[.])?\d+$/', //pozitív szám tizedes tört is lehet
'R_EGESZ'=>'/^[-]?[\d ]+$/', //pozitív vagy negatív egész szám
'R_EGESZ_POZ'=>'/^(\d*[.])?\d+$/', //pozitív egész zsám
'R_ENG_SZO_KIS'=>'/^[a-z\d]+$/',  // 1 ha csak angol kisbetű és szám van benne szóköz sem lehet
'R_ENG_SZO'=>'/^[a-zA-Z\d]+$/',  // 1 ha csak angol kis és nagybetű és szám van benne szóköz sem lehet
'R_ENG_TOBB_SZO'=>'/^[a-zA-Z\d ]+$/',  //csak angol kis és nagybetű szám és szóköz van
'R_ENG_TEXT'=>'/^[a-zA-Z\d \!\"\?\.\:\(\)]+$/',//1 ha csak angol kis és nagybetű és szám szóköz és !?().:
'R_MIN_MAX'=>'/^.{<<min>>,<<max>>}$/',  
'R_MIN'=>'/^.{<<min>>,}$/',  
'R_MAX'=>'/^.{1,<<max>>}$/',  
'R_HU_SZO'=>'/^[a-zA-Z\déáűúőóüöÁÉŰÚŐÓÜÖ]+$/',  // eng_szo plusz ékezetesek
'R_HU_TOBB_SZO'=>'/^[a-zA-Z\d éáűúőóüöÁÉŰÚŐÓÜÖ]+$/', //eng_tobb_szo plusz ékezetesek
'R_HU_TEXT'=>'/^[a-zA-Z\d \!\"\?\.\:\(\)éáűúőóüöÁÉŰÚŐÓÜÖ]+$/',//eng_text plusz 
'R_MAIL'=>'/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/'//1 ha email
];
static function SAME_STR($algo,$mezo,$param=[]){//1 mezőt hasonlít paraméterhez
param_beir($param);
//if(!preg_match(self::$REG_EX['R_SZAM'],$mezo)){};
switch ($algo) {
    case 'R_MIN': $d=preg_match('/^.{'.self::$param['min'].',}$/',$mezonev);
				$lang_param=[$mezo,self::$param['min']];break;
    case 'R_MAX':$d=preg_match('/^.{0,'.self::$param['max'].',}$/',$mezonev);
				$lang_param=[$mezo,self::$param['max']];break;
    case 'R_MIN_MAX':
	$d=preg_match('/^.{'.self::$param['min'].','.self::$param['max'].',}$/',$mezonev);
	$lang_param=[$mezo,self::$param['min'], self::$param['max']];break;
}
if(!$d)GOB::$hiba['ELL']=LANG::RET($algo,[$lang_param]);
}

static function SAME_2M($algo,$mezonev,$mezonev2){//1 mezőt hasonlít paraméterhez
$a=self::$adatok[$mezonev];
$ertek=self::$adatok[$mezonev2];
switch ($algo) {
      case 'MEZO>ERTEK': if($a>$ertek){$d=1;};break;
    case 'MEZO<ERTEK': if($a<$ertek){$d=1;};break;
	case 'MEZO>=ERTEK': if($a>=$ertek){$d=1;};break;
    case 'MEZO<=ERTEK': if($a<=$ertek){$d=1;};break;
    case 'MEZO=ERTEK': if($a==$ertek){$d=1;};break;
}
if(!$d==1)GOB::$hiba['ELL']=LANG::RET($algo,[$mezonev,$mezonev2]);
}
static function SAME($algo,$mezonev,$ertek){//1 mezőt hasonlít paraméterhez
$a=self::$adatok[$mezonev];
switch ($algo) {
    case 'MEZO>ERTEK': if($a>$ertek){$d=1;};break;
    case 'MEZO<ERTEK': if($a<$ertek){$d=1;};break;
	case 'MEZO>=ERTEK': if($a>=$ertek){$d=1;};break;
    case 'MEZO<=ERTEK': if($a<=$ertek){$d=1;};break;
    case 'MEZO=ERTEK': if($a==$ertek){$d=1;};break;
}
if(!$d==1)GOB::$hiba['ELL']=LANG::RET($algo,[$mezonev,$ertek]);
}

static function cserel($cserelendo){//behelyettesíti a regexet a param tömb értékeivel
foreach(self::$param as $key=>$value){
$cserelt = str_replace("<<$key>>", $value,$cserelendo);
return $cserelt;
}}
static function param_beir($param){//frissíti a paratömböt
foreach($param as $key=>$value){
self::$param[$key] =$value;
}}

static function REG_EX($reg_ex,$mezonev){
$d=preg_match(self::$REG_EX[$reg_ex],self::$adatok[$mezonev]); //regexel vizsgál
if(!$d)GOB::$hiba[]=LANG::RET($reg_ex,[$mezonev]); //ha hibát talál beírja a GOB::hiba tömbbe
return $d; // regex vizsgalat eredménye 0 vagy 1
}
static function REG_EX_TOMB($reg_ex_tomb,$mezonev){
//echo '----------'.$mezonev;
foreach($reg_ex_tomb as $reg_ex){
$dd=self::REG_EX($reg_ex,$mezonev);
if($dd){$d++;}
}
return $d; // regex vizsgalat eredménye 0 vagy 1
}
}
class LANG{
static public $param=[];
static public $lang_tomb=[
'MEZO>ERTEK'=>'A <<0>> mező nagyobb kell hogy legyen mint <<1>>!',
'MEZO<ERTEK'=>'A <<0>> mező kissebb kell hogy legyen mint <<1>>!',
'MEZO>=ERTEK'=>'A <<0>> mező nagyobb vagy egyenlő kell hogy legyen mint <<1>>!',
'MEZO<=ERTEK'=>'A <<0>> mező kissebb vagy egyenlő kell hogy legyen mint <<1>>!',
'MEZO=ERTEK'=>'A <<0>> mező, és a <<1>> mező, egyenlő kell hogy legyen!',
'R_SZAM'=>'A <<0>> csak szám lehet!(tizedes tört és negatív is)',
'R_SZAM_POZ'=>'A <<0>> csak pozitiv szám lehet!(tizedes tört is)',
'R_EGESZ'=>'A <<0>> csak egész szám lehet!(negatív is)',
'R_EGESZ_POZ'=>'A <<0>> csak pozitiv egész szám lehet',
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
static function cserel($cserelendo,$param=[]){
foreach($param as $key=>$value){
$cserelendo = str_replace("<<$key>>", $value,$cserelendo);
}
return $cserelendo;
}
static function RET($szo,$param=[]){
$v= self::$lang_tomb[$szo];
$v=self::cserel($v, $param);
return $v;
}
// a $param lehet associativ vagy sima tömb
static function ECH($szo,$param=[]){echo self::RET($szo,$param);}
}


function tomb_kiir($tomb){
foreach($tomb as $elem){
if(is_array($elem)){tomb_kiir($elem);}else{echo $elem."\n </br>";}}
}

//print_r(GOB::$hiba);
?>
</body></html>