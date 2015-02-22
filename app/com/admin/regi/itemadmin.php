<?php
//defined('_JEXEC') or die('Restricted access'); 
//ostályok----------------------------------------------------------------------
//JHTML::_('behavior.tooltip');
//változók-------------------------------------------------------------------
$tabla='aa_bejegyzesek';
$mezok=$_POST['mezok'];
if(empty($task)){$task=$_GET['task'];}if ($task==''){$task='listaz';}
if(empty($itemid)){$itemid=$_GET['itemid'];}

//include_once($form_fuggvenyek_eleres);
echo 'aruszerkeszt';

