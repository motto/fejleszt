<?php
/**
 * Created by PhpStorm.
 * User: dolgozo
 * Date: 2015.03.01.
 * Time: 18:30
 */
class Os
{
    protected $tilos = ['pr2', 'pr3'];
    protected $set = ['pr1'];
    protected $pr1, $pr2, $pr3;
    public $param=[];

    function __construct($paramtomb)
    {
        $this->frissit($paramtomb);
    }

    function frissit($paramtomb)
    {
        foreach ($paramtomb as $key => $param) {
            if (in_array($key, $this->tilos)) {
            } else {if (in_array($key, $this->set)) {$this->$key._set();
                        } else { $this->$key = $param;}
                    }
        }
    }
}

class proba
{
    public $pr1;
    public $pr2;
    protected $pr;
    protected $param;
  function megjelenit(){
      echo "gg  ".$this->pr2;}
}

class OBJ{

//pl.:$param='class:hhh,id:azon,name:név' Obj::gyors($osztaly,$param,'megjelenit')
    static function gyors($osztaly,$param,$fugveny='',$tagolo1=',',$tagolo2=':') //stringből tölti fel az osztály változókat
    {

        $ujobj=new $osztaly;
        if(is_array($param)){$param2=$param;}else{
            $param2=TOMB::char_to_assoc($param,$tagolo1,$tagolo2);
        }
        foreach($param2 as $kulcs => $ertek){$ujobj->$kulcs=$ertek;}
        //ha van függvény azzal hanincs az objektummal tér vissza
        if($fugveny==''){return $ujobj;}else{return $ujobj->$fugveny();}
        return $ujobj;
    }

}

$paramtomb['pr1']='ggg';
$paramtomb['pr2']='cccccccccccccc';
//$dd=Obj::gyors('proba',$paramtomb,'megjelenit');
$dd=OBj::gyors('proba',$paramtomb,'megjelenit');
echo $dd->pr1;