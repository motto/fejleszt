-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Hoszt: localhost
-- Létrehozás ideje: 2014. nov. 07. 22:47
-- Szerver verzió: 5.5.31
-- PHP verzió: 5.3.10-1ubuntu3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `pnet354_motto001_menkuotto`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet: `ajanlasok`
--

CREATE TABLE IF NOT EXISTS `ajanlasok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(80) NOT NULL,
  `perdom` varchar(50) NOT NULL,
  `userid` int(11) NOT NULL,
  `ajanloid` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `aruhazid` int(11) NOT NULL,
  `lapid` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `ajanlasok`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `aru`
--

CREATE TABLE IF NOT EXISTS `aru` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `webhely_id` int(11) NOT NULL,
  `foto_id` int(11) NOT NULL,
  `galeria_id` int(11) NOT NULL,
  `kategoria_id` int(11) NOT NULL,
  `cim` text NOT NULL,
  `intro` text NOT NULL,
  `rtext` text NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `ar` int(11) NOT NULL,
  `darab` int(11) NOT NULL,
  `rendelheto` date NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `kategoria_id` (`kategoria_id`),
  KEY `user_id` (`user_id`),
  KEY `aruhaz_id` (`webhely_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- A tábla adatainak kiíratása `aru`
--

INSERT INTO `aru` (`id`, `user_id`, `webhely_id`, `foto_id`, `galeria_id`, `kategoria_id`, `cim`, `intro`, `rtext`, `meta`, `jog`, `ar`, `darab`, `rendelheto`, `datum`, `pub`) VALUES
(2, 62, 0, 0, 0, 0, 'EM-BIO mikrobiológiai készítmény<br>', '<div align="justify">30 évvel ezelőtt indult el japánból az EM - Effektív Mikroorganizmusok útja az Ember és Természet közös szolgálatára. Úgy válogatták össze a fotoszintetizáló és tejsavbaktériumok, élesztők- és moszatgombák asztalközösségét, hogy azok egymás anyagcseréjét segítve, a természetben velük együtt élő lények ( növények, állatok és az ember) létezését segítsék, kiegészítsék. <br>Az EM egy rendszer, azaz rend szer, mely olyan környezetet alakít ki, melyben a mikroorganizmusok által az erjedéssel történő lebontás kerül előtérbe és a rothadás megszűnik. A növények életfolyamatainak támogatásával optimális termelési színvonal érhető el, a betegségek kártevők betelepedése visszaszoríthatóak, és jobb minőségű termények hozhatóak létre.<br>Az EM jótékony hatása már az első évben észlelhető, de évről évre fokozódik. Ezzel párhuzamosan a felhasznált EM-BIO mennyiség csökkenthető.<br>Az effektív mikroorganizmusok a talaj regeneratív mikroorganizmusait támogatják. Segítik a szerves anyagok átalakítását a növények számára szükséges tápanyagokká, és olyan élőhelyet, közösséget teremtenek, amely elvonja a patogének, kártevők életterét. A hatékony mikroorganizmusok segítségével a talaj termelékenysége jelentősen növekszik, és a növények ellenálló képessége fokozódik.<br>Kiszerelés: 1 liter/5 liter/10 liter/20 liter/1000 liter<br></div>', 'TALAJOLTÁS<br>Javasolt technológia:<br>30 liter EM-BIO/ha 200-300 vízhez keverve. Évente egyszer vagy kétszer, aratás után illetve ültetés, szántás, kombinátorozás vetés előtt 10-14 nappal kipermetezni, majd 1-2 napon belül 15-20 cm mélyen bedolgozni a talajba. Fontos, hogy a talajon lévő elhalt és élő növényi részekre permetezzük ki és ezekkel együtt munkáljuk a talajba.<br><br>Várható hatása:<br>- Javuló talajminőség<br>- Talajban felhalmozódott szerves anyag és vegyszermaradvány lebontása<br>- Javul a talaj vízháztartása és tápanyag-szolgáltató képessége<br>- Aktívabb talajéletet eredményez<br>- Lazább szerkezetű, morzsalékos talaj<br>- Fokozódik a humusz képződés<br>- Csökken az ammónia képződés, a légköri nitrogénmegkötés 70%-kal nő<br>- Intenzívebb gyökeresedés<br>- A növény fokozódó tápanyag felvevő képessége<br>- Növekvő (10-40%-kal több) terméshozam<br>-Javuló termésminőség, magasabb antioxidáns tartalom, jobb beltartalmi érték, ízletesebb termés<br>- Növekvő betegségekkel és kártevőkkel szembeni ellenálló-képesség<br>- Stressztűrő képesség javulása<br>- A termés eltarthatósága növekszik <br><br>KOMPOSZTÁLÁS<br>Javasolt technológia:<br>1m3 komposzthoz 1 liter EM-BIO permetezése, újabb szerves anyag hozzáadásakor 0,1 liter EM-BIO-t juttassunk ki.<br><br>Várható hatása:<br>- Komposztálás hatékonyságának növelése<br>- Tápanyag-feltáródás növelése<br>- Nincs szükség átforgatásra, mozgatásra<br>- Megmaradnak az anyagcseretermékek, a nitrogén ammónia formájában nem illan el<br>- A talaj mikrobiális aktivitásának, kémhatásának (pH) javítása<br>A talajban felhalmozódott növényvédőszer-maradványok lebontásának elősegítése<br><br>LOMBKEZELÉS<br>Javasolt technológia:<br>300 liter vízhez keverjen 1-2 liter EM-BIO-t és permetezze a növény lombozatára! Mindig vegyük figyelembe a lombfelület nagyságához szükséges víz mennyiségét és ehhez igazítsuk az EM-BIO mennyiségét.<br><br>Alkalmazás:<br>- Szántóföldi növény kultúrákban ( gabonafélék, napraforgó, kukorica): 1-3 alkalommal virágzás, termésérés időszakában.<br>- Zöldség és gyümölcsfélék, szőlő 4-7 alkalommal vagy heti gyakorisággal az intenzív növekedés - virágzás - zöldérés időszakáig.<br><br>Várható hatása: <br>- Intenzív gyökeresedés<br>- A növény fokozódó tápanyagfelvevő és beépítő képessége<br>- Növekvő (10-40%-kal több) terméshozam<br>- Javuló termésminőség, magasabb antioxidáns tartalom, jobb beltartalmi érték, ízletesebb termés<br>- növekvő betegségekkel és kártevőkkel szembeni ellenálló-képesség<br>- Stressztűrő képesség javulása ( aszály, kedvezőtlen tápanyag ellátás)<br>- A termés eltarthatósága növekszik<br><br>DÍSZ-ÉS SZOBANÖVÉNYEK VIRÁGÁGYÁS/FÜVEK&nbsp; alkalmazásánál a várható hatás: Néhány kezelés után a növények láthatóan dúsabbak, egészségesebbek lesznek. A stressztűrő képességük fokozódik, ellenállóbbá válnak a külső hatásokkal szemben. Tápanyag ellátottságuk emelkedik. A kezelések hatására levélzet, a szár és a virágzat szöveti állománya erősebb, kompaktabb lesz.<br><br><br>&nbsp; <br>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:00:52', 1),
(3, 62, 0, 0, 0, 0, 'EM-BIO HERBS Kiegészítő takarmány haszonállatok részére<br>', '<div align="justify">Az EM-BIO HERBS egy <font color="blue">fermentált mikroorgan</font>izmusokat, gyógynövénykivonatokat tartalmazó, aromatikus, étvágynövelő kiegészítő takarmány. Hatására állataink immunrendszere erősödik, bélrendszerük mikrobiális egyensúlya helyreáll, javul az étvágyuk, nyugodtabbá válnak és a stressz tűrő képességük jelentősen megnövekszik.<br>Kiszerelés: 1 liter/5 liter/10 liter/20 liter/30 liter<br></div>', '<div align="justify">Az EM-BIO mikrobiológiai készítmény alkotórészei - az állatok környezetébe kijuttatva - átalakítják azok életterét, a kórokozó mikroorganizmusok kiszorításával, egészségesebbé teszik az állatok környezetét, pozitív irányba befolyásolják az élettani folyamatokat. Az EM-BIO HERBS készítmény a biotermesztésben előállított, megerjesztett gyógynövények - mint a kömény, ánizs, cickafark, édeskömény, nyírfalevél, aranyvessző, rozmaring, borsmenta, hibiszkuszgyökér, eperlevél - valamint a természetben szabadon fellelhető mikroorganizmusok elegyéből áll össze. <br>Az irányított erjedés során keletkező biológiailag aktív anyagok az állatok anyagcseréjére gyakorolt kedvező hatásuk révén, hozzájárulnak az állatok és környezetük egyensúlyához. A fermentáció során képződő baktériumok és esszenciális anyagok (aminosavak, vitaminok, provitaminok) az állatok bélrendszerébe jutva, fokozzák a szervezet védekező mechanizmusát.Ezek a keletkezőn anyagok jelentős antioxidáns hatással rendelkeznek, s ezáltal hozzájárulnak az állat egészségének megtartásához. <br><br>Kijuttatása: Ivóvízbe és takarmányba adagolandó. <br>Várható hatás:<br>- kevesebb gyógyszerfelhasználás<br>- egészségesebb állatok<br>- kedvező bélflóra kialakítása<br>- jobb ellenálló-képesség<br>- kedvezőbb súlygyarapodás és takarmányértékesítés<br>- stresszhatás csökkenése<br>- emésztési problémák visszaszorulása<br>- magasabb tejhozam, magasabb tej beltartalmi érték<br>- erősebb tojáshéj, szép tojáshéj-<span style="background-color: red;">szín, tojásmennyiség növekedése<br>- ízletesebb, jobb minőségű, magas antio</span>xidáns tartalmú hús, jobb&nbsp; eltarthatóság<br>- magas tápértékű trágya<br><br>Az istálló, ólkezelések,trágyakezelések esetén: <br>- 50% ammóniaszint csökkenés<br>- szagok jelentős mértékű csökkenése<br>- legyek számának drasztikus visszaszorulása<br>- kiváló minőségű, kontrollált fermentációjú istállótrágya<br>- nyugodtabb stressztűrőbb állatállomány<br>- mikroflóra kontroll<br><br><br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:23:42', 1),
(4, 62, 0, 0, 0, 0, 'MIKROBIOVET Kiegészítő takarmány Lovak részére<br>', '<div align="justify">A Mikrobiovet egy fermentált mikroorganizmusokat tartalmazó aromatikus, étvágynövelő kiegészítő takarmány. Hatására állataink immunrendszere erősödik, bélrendszerük mikrobális egyensúlya helyreáll, javul az étvágyuk, nyugodtabbá vállnak és a stressztűrő képességük jelentősen megnövekszik.<br>Kiszerelés: 1 liter/5 liter/10 liter/20 liter/1000 liter<br></div>', '<div align="justify">Az irányított erjedés során keletkező biológiailag aktív anyagok az állatok anyagcseréjére gyakorolt kedvező hatásuk révén hozzájárulnak az állatok és környezetük egyensúlyához. A fermentáció során képződő baktériumok és esszenciális anyagok (aminosavak, vitaminok, provitaminok) az állat bélrendszerébe jutva fokozzák a szervezet természetes védekező mechanizmusát. Ezek a keletkező anyagok jelentős antioxidáns hatással rendelkeznek, s ezáltal hozzájárulnak az állat egészségének megőrzéséhez.<br><br><br><br>Kijuttatása: Ivóvízbe keverve, 50ml/állat/nap. Takarmányba keverve, 50ml/állat/nap az állat takarmányába permetezve stresszhelyzetben ( szállítás, takarmányváltás...stb.) Várható stresszhelyzet előtt az adag duplájára emelhető!<br><br>Az istálló, boxok, alom kezelésére EM-BIO-t használjunk. Az istálló bepermetezésére a magasnyomásúval végzett alapos tisztításra 1:4 hígítású EM-BIO + víz keveréket használjunk, gondosan lefedve vele a teljes felületet. A továbbiakban boxonként 0,25 liter EM-BIO hígítás nélkül permetezővel vagy ködképző géppel, heti 2-3 alkalommal permetezzük ki a boxfalra valamint a talajfelszínre ( szalmára vagy faforgácsra). Ahova az állat rendszeresen ürít, vizel, valamivel többet juttassunk ki, ezáltal az ammónia megkötődik. Az alom és a boxok kezelését felülalmozás előtt végezzük el.<br></div><br>Alkalmazása során a lótartásban az alábbi előnyök származnak:<br>- egészségesebb lesz az állat környezete<br>- kellemetlen szagok megszűnnek (az&nbsp; ammónia és egyéb szagok termelése jelentősen mérséklődik)<br>- csökken a porképződés<br>- kevesebb gyógyszerre van szükség<br>- természetes úton erősödik az állatok immunrendszere<br>- jobb lesz a stressztűrő képesség<br>- nyugodtabbá vállnak az állatok<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp; <br>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:25:42', 1),
(5, 62, 0, 0, 0, 0, 'EM-BIO TÁPLÁLÉK-KIEGÉSZÍTŐ KUTYÁK RÉSZÉRE<br>', '<div align="justify">A EMBIOPET Herbs kiegészítő takarmány, kutyák étvágyának fokozására szolgál. Alkotórészei a fermentált gyógynövény kivonatok, pH-ja 3,5. A savas pH kedvező hatással van az egészségre, a bélflórát alkotó mikroorganizmusok fejlődésére, ezáltal fokozódik az étvágy, nő a takarmány felvétel, javul a takarmány kihasználása. Betegség vagy betegségből való lábadozás esetén, kifejezetten hasmenéses betegségek, valamint antibiotikum kezelés után javasolt.<br>Kiszerelés: 250ml<br></div>', 'Az állati szervezetnek (mint ahogy az emberi szervezetnek is) az első védelmi vonala a bélflóra.Ez a bélflóra az élő test tömegéhez képest nagy arányban 2-3%-ban van jelen.Ezek megfelelő működése nélkül az emésztőrendszer képtelen elvégezni a feladatát. A bélflóra károsodását okozzák a bélgyulladások, parazitás és egyéb fertőzések és egyéb fertőzések , hosszas gyógyszerezés, - antibiotikumos kezelés, stressz, tápanyagváltás, utaztatás, szülő állattól való elválasztás és még számos behatás. <br><br>Adagolás: a terméken feltüntetett mennyiségben, naponta az állat eledelébe keverve, vagy rápermetezve. Ha az állat szívesen fogyasztja az ivóvízébe is adagolható.<br><br>Mikor ajánljuk?<br><br>Beteg állat:<br>- étvágy fokozására<br>- legyengült állapot<br>- lábadozás esetén<br>- krónikus betegségekben<br>- hasmenéses megbetegedések alatt és után<br>- antibiotikum kezelés alatt és után, bélflóra helyreállítására<br>- immunrendszeri probléma esetén<br>- tápváltások alkalmával<br><br>Egészséges állat:<br>- betegségek megelőzésére<br>- szőrzetváltásnál<br>- száj higiénia javítása<br>- ízületi problémák esetén<br>- aktivitás növeléséhez<br>- vemhesség és szoptatás időszakában<br><br><br><br><br>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:30:12', 1),
(7, 62, 0, 0, 0, 0, 'EMÓCIÓ 7.84 Táplálék kiegészítő<br>', '<div align="justify">Emóció 7.84 élőflórás magas antioxidáns étrend-kiegészítő ital flavonoiddal vagy gyógynövényekkel.<br>A legfontosabb feladat megelőzni a bajt, s sokkal nehezebb utólag kezelni.<br>Az Emóció antioxidánsokkal dúsított (gyümölcslé sűrítmények: feketeribizli, meggy és kékszőlő héjkivonat sűrítmény) összetevői által javítják a bélflóra mikrobális állapotát.<br>Az Emóció a káros mikroorganizmusokat gyéríti, és élőflórájával erősíti a hasznosokat, valamit segíti az immunrendszer helyreállítását, erősítését a megnövelt antioxidáns hatásával.<br>Ajánlott napi bevitel: 1-2 alkalom 20-30ml, mely fogyasztható koncentrátum formájában, vagy 2 dl folyadékkal hígítva. Az Emóció 7.84-nek semmilyen káros mellék- és utóhatása nem ismert.<br></div> ', '<br><div align="justify">Mivel az immunanyagok kb. 70%-át a bélflóra termeli, ennek károsodása súlyosan veszélyezteti immunrendszerünk normális működését. Amennyiben a bélflóra megsérül, pre-, vagy probiotikus tejsavbaktériumokkal állíthatjuk helyre a normál működését. Efektív Mikroorganizmusok - az Ember és a Természet közös szolgálatára. Úgy válogatták össze a fotoszintetizáló és tejsavbaktériumokat, élesztők, asztalközösségét, hogy azok a természettel együtt élő élőlények, beleértve az emberek immunitását is erősítsék, bélflóráját helyreállítsák. Az Emóció összetétele biztosítja, hogy ezen mikroflóra hasznosítható mennyiségben jut el rendeltetési helyére, a bél megfelelő szakaszába, s ott kifejtheti előnyös hatását. Ezen kívül természetes szervessav-, cukor- és mikro-makroelem összetételével elősegíti a szervezet normális működéséhez szükséges anyagok bevitelét pótlását. <br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:40:54', 1),
(9, 62, 0, 0, 0, 0, '30 darabos EM kerámia csomag<br>', '<div align="justify">Szürke, rideg, magas hőfokon kiégetett kerámia szonda alakú. Az EM kerámia a hatását közvetlenül víz feljavításában mutatja, kicsinyíti a vízklasztereket, csökkenti a felületi feszültséget és gátolja az oxidációt, infravörös sugarakat bocsát ki, aktiválja és energetizálja a vizet - elősegíti a víztisztulást - javítja az ivóvíz minőségét és a víz felvételét a szervezetbe.<br><br></div>', '<div align="justify">EM kerámia egy különleges alapanyagból, a Kibushi-ból ( egy különleges finom japán anyag féleség) készül. Ez az anyag őskori mikroorganizmusok lenyomatait tartalmazza olyan szerves anyagokat és enzimeket, amelyek több, mint 1 millió évesek. A Kibushi Manju-val történő fermentálás után 800-1200 fokon légmentesen kerülnek kiégetésre.A fermentáció által az anyag ásványi anyagainak kristályos szerkezete megőrzi a tipikus energetizáló ujjlenyomatait ezeknek az összetevőknek.<br><br>EM kerámia hatásai:<br>- Aktiválja és energetizálja a vizet<br>- Javítja és stabilizálja az (ivó)víz minőségét<br>- Segíti a sejtek anyagcseréjét a szervezetben<br>- Javítja a víz szállítóképességét a létfontosságú összetevőkkel kapcsolatban<br>- Erősíti stabilizálja a víz tisztulását<br>- Szabályozza az oxidatív folyamatokat<br>- Meggátolja a vízkő kialakulását, lerakódását<br>- Optimalizálja a víz oldó és kötőerejét a vízklaszterek kicsinyítésével, felületi feszültség csökkentésével, infravörös sugárzás kibocsátásával<br><br>Korlátlan ideig felhasználható.<br></div> ', '', '', 0, 0, '0000-00-00', '2013-09-12 10:55:15', 1),
(10, 62, 0, 0, 0, 0, 'EM Kerámia 500g<br>', '<div align="justify">Szürke, rideg, magas hőfokon kiégetett kerámia kicsinyíti a vízklasztereket, csökkenti a felületi feszültséget és gátolja az oxidációt, infravörös sugarakat bocsát ki, aktiválja és energetizálja a vizet- elősegíti a víztisztulást- javítja az ivóvíz minőségét és a víz felvételét a szervezetbe.<br>EM egy lehetőséget kínál, hogy újra regenerálódjon a víz.<br></div>', '<br><br><br><br><div align="justify">Az EM kerámia hatásai úszómedencéknél:<br><br>- Aktiválja és energetizálja a vízet<br>- Erősíti a víz tisztulását<br>- Meggátolja a vízkő tisztulását, lerakódását<br>- Optimalizálja a víz oldó és kötőerejét a vízklaszterek kicsinyítésével, felületi feszültség csökkentésével, infravörös sugárzás kibocsátásával<br>- Klórt tartalmazó fertőtlenítő szerek nélkülözhetősége és/vagy csökkentett használata miatt mérsékli a klór bőrre és szemekre gyakorolt agresszív hatásait<br><br>Az algásodás elkerülése érdekében a vízzel frissen feltöltött medencébe tegyük a kerámiát! Már algásodott vizet kezelés előtt le kell cserélni. <br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 10:59:36', 1),
(11, 62, 0, 0, 0, 0, 'EM KERÁMIA 35mm<br>', '<div align="justify">Magas hőfokon kiégetett szürke EM kerámia alkalmas a víz mindenféle aktiválásához és energetizálásához, kódolja és átadja a rezgéseiből származó infórmációkat a víz szerkezetébe, elősegítve ezzel a szervezet normális, kiegyensúlyozott anyagcseréjét.<br></div>', '<br><br><br><br><br><br><div align="justify">Az EM kerámia hatásai:<br><br>- Aktiválja és energetizálja a vizet<br>- Javítja az (ivó)víz minőségét<br>- Segíti a sejtek anyagcseréjét a szervezetben<br>- Javítja a víz szállítóképességét a létfontosságú összetevőkkel kapcsolatban<br>- Erősíti és stabilizálja a víz tisztulását<br>- Szabályozza az oxidatív folyamatokat<br>- Megakadályozza a kártevők elterjedését és a betegségek kialakulását<br>- Meggátolja a vízkő kialakulását, lerakódását<br>- Optimalizálja a víz oldó és kötőerejét a vízklaszterek kicsinyítésével, a felületi feszültség csökkentésével, infravörös sugárzás kibocsátásával<br><br>Korlátlan ideig felhsználható.<br></div><br>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:06:11', 1),
(12, 62, 0, 0, 0, 0, 'eMC PROBIOTIKUS TISZTÍTÓSZER SZETT - 4db<br>', '<div align="justify">100%-ban TERMÉSZETES PROBIOTIKUS eMC tisztítószerek, olcsó vegyszermentes tisztaság az egész háztartásban. A szett Eukaliptusz-Konyhai, Citrom-Fürdőszobai, Levendula-Univerzális, Lime-Extraerős tisztítókból áll. <br>Az eMC tisztítószerek előnyei:<br>- Hatásos a szennyeződések feloldására.<br>- Hatékony a kellemetlen szagok és a penész eltüntetésére.<br>- Hosszantartó tisztaságot eredményez.<br>- Kíméletes kényes anyagú felületekkel szemben.<br>- Fokozza az antisztatikus hatást.<br>- Vízelvezető rendszerben megszűnnek a lerakódások.<br></div><br>', '<div align="justify">Az eMC tisztítószerek hatása az egészségre:<br><br>- Genetikailag módosított anyagoktól mentes.<br>- Csakis természetes anyagokat tartalmaz és különösen bőrbarát, allergiások számára is ajánlott.<br>- Ember, állat és növény számára egyaránt ártalommentes, hiszen a hagyományos tisztítószerektől eltérően nem maradnak a felületen mérgező anyagok.<br><br>Az eMC tisztítószerek és az ökológia:<br><br>- A koncentrált formának köszönhetően a tisztítószerek rendkívül kis mennyiségben is hatékonyak.<br>- Kíméli a környezetet és a vizet, mivel használatát követően nem keletkeznek oldószer maradványok.<br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:16:50', 1),
(13, 62, 0, 0, 0, 0, 'eMC citrom/FÜRDŐSZOBAI TISZTÍTÓ<br>', '<div align="justify">Az eMC citrom tisztítókoncentrátum univerzálisan is alkalmazható, de különösen alkalmas egészségügyi helyiségek számára. Hatásos megoldást nyújtanak a fürdőszoba és WC tisztántartására. Az eszenciális olajok frissességet biztosítanak és növelik a tisztító hatást. <br>Összetétele: EM, PDM-7, citrom és narancskivonat, illóolajok (citrom, limette, narancs, fenyő), természetes eredetű cukornádmelasz.<br>Kiszerelés: 0,5 liter/1 liter<br></div>', '<br><br><div align="justify">Felhasználási terület:<br><br>- Zuhanyrózsa-vízkőoldás-tisztítószer-10ml tisztítószer:1 liter víz<br>- Csempe-Tisztaság, lerakódásmentesség-1-10ml tisztítószer: 1 liter víz<br>- Tükör-Fényes tisztaság, portaszítás-1 ml tisztítószer: 1 liter víz<br>- WC-Tisztaság, lerakódásmentesség, szagtalanítás-20-30ml tisztítószer/nap/WC tartály<br>- Mosdó, zuhanyzó, fürdőkád, bidé-Tisztaság, lerakódás, szagtalanítás-10ml tisztítószer:1 liter víz<br><br>Fújja ki aerosolos palackkal vagy ha erős a szennyeződés, tegyen néhány cseppet a nedves szivacsra vagy rongyra, majd azzal törölje le.<br></div><br><br>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:19:35', 1),
(14, 62, 0, 0, 0, 0, 'eMC Levendula/UNIVERZÁLIS TISZTÍTÓ<br>', '<div align="justify">Az eMC levendula általános háztartási tisztítókoncentrátum, mindenütt használható, azonban különösen alkalmas bútorok, padló és ablakok tisztítására. <br>Összetétele: EM, PDM-7, grapefruitkivonat, illóolajok (levendula, narancs), természetes eredetű cukornádmelasz.<br>eMC Tisztítószerek természetes úton segítenek eltávolítani a szennyeződéseket. Felfrissíti a nappaliját, semlegesíti a port, füstöt és más kellemetlen szagokat. Hosszabb távú használat után alacsonyabb mértékű az újraszennyeződés. A termékkel való takarítás bevonja a felszínt és regeneratív mikroorganizmusokkal népesíti be, hatásaként antisztatikus felület keletkezik, melyre kevésbé tapad a por és egyéb szennyeződések.<br>Kiszerelés: 0,5 liter/ 1 liter<br></div>', '<div align="justify">Felhasználási terület:<br><br>Bőr bútorok-Penészképződés megakadályozása-1-10ml tisztítószer: 1 liter víz<br>Kárpit bútor, függönyök, szőnyegek, matracok-Tisztítás, kellemetlen illat-10-100ml tisztítószer: 1 liter víz<br>Belső környezet-Szag, füst, pormentesítés-10-100ml tisztítószer: 1 liter víz<br>Szekrények, gardróbok, cipőtartók, más bútorok- Szag, penész, pormentesítés, felfrissítés-10-100ml tisztítószer: 1 liter víz<br>Lámpaernyő, TV-szett, számítógép-pormentesítés, antisztatikus hatás-10-100ml tisztítószer: 1 liter víz<br>Ablakok, ablakkeretek, üvegtáblák-Erős tisztító és antisztatikus hatás-10-100ml tisztítószer: 1 liter víz<br>Padló-Hosszantartó tisztaság és fényesség-10-100ml tisztítószer: 1 liter víz a vödörbe<br><br>Fújja ki a aerosolos palackkal a felületre.<br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:22:55', 1),
(15, 62, 0, 0, 0, 0, 'eMC Lime/EXTRA ERŐS TISZTÍTÓ<br>', '<div align="justify">eMC Lime Extraerős tisztítószer mindenütt használható de elsősorban nagy kiterjedésű és erősen szennyezett felületek ( üzemi konyhák, óvodák, iskolák) tisztítására.<br>Összetétele: EM, PDM-7, citrom és narancs kivonat, illóolajok (citrom, limette, narancs, fenyő), enzimek (limáz, proteáz, amiláz), természetes eredetű cukornádmelasz.<br>Kiszerelés: 0,5 liter/1 liter<br></div>', '<br><br><br><br><div align="justify">Felhasználási terület:<br><br>Bőr bútorok- Penészképződés megakadályozása-1-10ml tisztítószer: 1 liter víz<br>Kárpit bútor, függönyök, szőnyegek, matracok-Tisztaság, kellemes illat-10-100ml tisztítószer: 1 liter víz<br>Belső környezet-Szag, füst, pormentesítés-10-100ml tisztítószer: 1 liter víz<br>Szekrények, gardróbok, cipőtartók, más bútorok-Szag,penész,pormentesítés, felfrissítés-10-100ml tisztítószer: 1 liter víz<br>Lámpaernyő, TV-szett, számítógép-Pormentesítés, antisztatikus hatás-10-100ml tisztítószer: 1 liter víz<br>Ablakok, ablakkeret, üvegtáblák-Erős tisztító és antisztatikus hatás-10-100ml tisztítószer. 1 liter víz<br>Padló-Hosszantartó tisztaság és fényesség-10-100ml tisztítószer: 1 liter víz a vödörbe<br><br>Fújja ki aerosolos palackkal a keveréket felületre.<br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:27:02', 1),
(16, 62, 0, 0, 0, 0, 'eMC Eukaliptusz/KONYHAI TISZTÍTÓ<br>', '<div align="justify">eMC Eukaliptusz konyhai tisztítószer, mindenütt használható, azonban különösen alkalmas konyhai felületek tisztítására. A konyha a lakás központja, melynek tisztántartása elsődleges. az olaj és zsírmaradványok eltüntetése gyakran nehézkes, ezért sokan erős vegyszerek segítségét veszik igénybe. Az EM termékek azonban kiváló alternatívát jelentenek a veszélyes oldószerekkel szemben.<br>Kiszerelés: 0,5 liter/1 liter<br></div>', '<br><br><br><div align="justify">Felhasználási terület:<br><br>Lefolyók-Lerakódás, dugulás mentesítés-10-100ml tisztítószer: 1 liter víz<br>Páraelszívók-Zsírréteg eltávolítása-1-10ml tisztítószer: 1 liter víz<br>Csempe, csap-Tisztítás cseppmentesítés-1-10ml tisztítószer: 1 liter víz<br>Mosogató-Zsírmentes tisztaság-10-100ml tisztítószer: 1 liter víz<br>Tűzhely és más konyhai berendezések, vágódeszka, edények stb.-Tisztaság és higénia-10-100ml tisztítószer: 1 liter víz<br>Hűtő-Tisztítás, szagtalanítás-10-100ml tisztítószer: 1 liter víz<br>Konyhaszekrény-Tisztítás,rovarok, kártevők megszüntetése-10-100ml tisztítószer: 1 liter víz<br><br>Fújja ki aerosolos palackkal a keveréket a felületre. <br></div>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:29:58', 1),
(17, 62, 0, 0, 0, 0, 'eMC VÍZKŐOLDÓ<br>', '<div align="justify">Az eMC Vízkőtisztító egy univerzális tisztítószer, ami különösen jól alkalmazható nagy és erősen szennyezett felületeken.<br>Tartalma. Effektív Mikroorganizmusok és más kifejezetten zsír és olaj szétválasztására alkalmas mikroorganizmusok, citrom kivonat, citromsav, szerves cukornád melasz, citromolaj, fenyőolaj, citronella.<br>Kiszerelés: 0,5 liter/1 liter <br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-12 11:35:05', 1),
(18, 62, 0, 0, 0, 0, 'eMC KÁRPIT TISZTÍTÓ<br>', '<div align="justify">Az eMC Kárpittisztító megszünteti a szagokat és hosszan tartó tisztaságot és ápolást biztosít. A lakás minden szegmensében általánosan alkalmazható, de különösen ajánlott erős szennyeződések eltávolítására és mosásra is.100%-ban természetes.<br>Összetevői: Effektív Mikroorganizmusok, zsír és cellulózbontó kultúrák, citrom és narancs kivonat, illóolajok (citrom, lime, narancs, fenyő), szerves cukornád melasz.<br>Kiszerelés: 0,5 liter/1 liter<br></div><br>', '<br><br><br><br><br><br><br>Felhasználási terület:<br><br>Ruházat-Szagoktól felfrissülés-1-10ml tisztítószer: 1 liter víz<br>Cipők, lábmelegítők-Tisztítás, szagtalanítás-10-100ml tisztítószer: 1 liter víz<br>Mosoda, mosókonyha-Tisztítás-Adagoljon egy kupakkal a mosószerhez<br><br>Fújja ki aerosolos palackkal a keveréket a tisztítandó felületre.<br>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:37:26', 1),
(23, 62, 0, 0, 0, 0, 'Teruo Higa - Forradalom a Föld megmentéséért<br>', '<div align="justify">Effektív mikroorganizmusok, röviden EM, és különböző felhasználási formáit képezik e könyv tárgyát. E könyv olvasásakor érthetővé válnak a fontosabb részletek, hogyan nyújt az EM a mezőgazdaságban lehetőséget arra, hogy mindenféle talajtípust, a sivatagot is beleértve, művelhető földdé változtasson, melyben az eddiginél sokkal magasabb terméshozamok érhetőek el. <br></div>', '<div align="justify">A parányi élőlények ereje: <br>Effektív mikroorganizmusok (EM), problémamegoldók és mindentudók a földművelésben és kertészeti termesztésben, háztartásban, környezetvédelemben, iparban éppúgy, mint gyógyászati problémák esetén.<br>Ebben a könyvben az úgynevezett effektív és hasznos mikroorganizmusok, röviden EM, bámulatos sikereiről van szó. Ez egy multi - mikróbakeverék, melyet e könyv szerzője a japán agrártudós és egyetemi tanár, Dr. Teruo Higa talált meg a maga specifikus összetételében. Az évek hosszú folytatott kísérleteinek a sikere 1981 őszi estéjén következett be.<br><br>"A mikroorganizmusok világára kell irányítanunk a tekintetünket, ezekre a parányi élőlényekre, melyek jelenléte és tevékenysége megtartja életünket." Prof. Dr. Teruo Higa<br></div> <br>', '', '', 0, 0, '0000-00-00', '2013-09-12 11:55:28', 1),
(21, 62, 0, 0, 0, 0, 'Organikus Bokashi Háztartási Vödör<br>', '<div align="justify">Organiko konyhai komposztáló vödör kitünően alkalmas a konyhai hulladékok, maradékok szagmentes fermentálására. Kényelmesen és könnyen használható. Az Organiko háztartási vödör végterméke egy "kitűnő minőségű trágya", mely alkalmas cserepes és kerti növények táplálására. A csapon át távozó trágyát 1:1000-2000 arányban hígítva célszerű felhasználni.<br><br>Méret: 37*27*32cm<br>Űrtartalom: 16 liter<br>Tartalmaz: 1db fedő, 1db szűrő, 1db mérőkanál, 1db simítólapát, 1db adagoló<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-12 11:48:07', 1),
(22, 62, 0, 0, 0, 0, 'SZÁRÍTOTT BIO BOKASHI SZAGLEKÖTÉSRE<br>', 'EM-BIO Bokashi szárított szaglekötésre és bio hulladék fermentálásához.<br>Kiszerelés: 600g<br>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-12 11:49:43', 1),
(25, 62, 0, 0, 0, 0, 'EM-BIO TÁPLÁLÉK-KIEGÉSZÍTŐ TAKARMÁNY MACSKÁK RÉSZÉRE<br>', 'Az EMBIOPET Herbs kiegészítő takarmány, élő flórás, macskák étvágyának fokozására szolgál. Alkotórészei a fermentált gyógynövény kivonatok, PH-ja 3,5. A savas PH kedvező hatással van az egészségre a bélflórát alkotó&nbsp; mikroorganizmusok fejlődésére, ezáltal fokozódik az étvágy, nő a takarmány felvétel, javul a takarmány kihasználása.<br>betegség vagy betegségből való lábadozás esetén, kifejezetten hasmenéses betegségek valamint antibiotikum kezelés után javasolt. <br>Kiszerelés: 100ml<br>', '<br><div align="justify">Mikor ajánljuk?<br><br>Beteg állat:<br>- Étvágy fokozására<br>- Legyengült állapotokban<br>- Lábadozás esetén<br>- Krónikus betegségekben<br>- Hasmenéses megbetegedések alatt és után<br>- Antibiotikum kezelés alatt és után bélflóra egyensúlyának helyreállítására<br>- Immunrendszeri probléma esetén<br>- Tápváltások alkalmával<br><br>Egészséges állat:<br>- Betegségek megelőzése<br>- Szőrzetváltásnál<br>- Száj higiénia javítása<br>- Ízületi problémák esetén<br>- Aktivitás növeléséhez<br>- Vemhesség és szoptatás időszakában<br><br>Adagolás: a terméken feltüntetett mennyiségben, naponta az állat eledelébe keverve, vagy rápermetezve. Ha az állat szívesen fogyasztja ivóvízébe is adagolható. <br></div><br>', '', '', 0, 0, '0000-00-00', '2013-09-12 15:27:39', 1),
(33, 62, 0, 0, 0, 0, 'Szerkeszthető cím', 'Intro szöveg', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-20 19:54:40', 1),
(35, 62, 0, 0, 0, 0, 'KAPCSOLAT<br>', '<div align="justify">"Óvjuk meg Földünket jelen és jövő nemzedékei számára és éljünk tudatos egészséges életet"<br></div><div align="justify">Szeretnénk ehhez mi is hozzájárulni, tanácsadásainkkal és további információinkkal állunk szíves rendelkezéseikre. A termékek az alábbi telefonos, e-mailes elérhetőségeinken és webáruházunkban megrendelhetőek.<br><br>MAHETI Kft.<br>Székhely: 5100 Jászberény, Kodály Zoltán u. 26.<br>Mobil: +36-30-609-2149<br>E-mail: ipetro.tibor@gmail.com<br><br><br></div>', 'hjghjghjhj jghjgjghjghjghjgj<br>', '', '', 0, 0, '0000-00-00', '2013-09-21 16:25:10', 1),
(37, 62, 0, 0, 0, 0, 'Zöldborsó - Kelvedon csodája<br>', '<div align="justify">Alacsony fajta, hosszú, sötét zöld hüvelyekkel. Nagy hozamú ellenálló, korai velőborsó.<br><br>1 tasak: kb.2m2-re elegendő<br>Súlya: 40,00g<br>Vetési hónap: 04.-05.-hó<br>Temelő: ReinSaat&nbsp; KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-23 13:37:07', 1),
(39, 62, 0, 0, 0, 0, 'Cukorborsó - Ambrosia<br>', '<div align="justify">Kb. 70 cm magasra növő, bőtermő fajta. Közepes méretű, világos zöld hüvelyeket hoz, a borsó héjával együtt fogyasztható.<br><br>1 tasak: kb.2m2-re elegendő<br>Súlya: 40.00g<br>Vetési hónap: 02.-03.-04.hó<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 07:28:11', 1),
(40, 62, 0, 0, 0, 0, 'Bokorbab - Cupidon<br>', '<div align="justify">Szálkamentes ceruzabab, hüvelye 16-20 cm hosszú. Zsengén is szedhető ceruza, (filet)-babnak vagy normál méretben bokor babként. A hüvelyek egy része a levélzet fölé emelkedik, ez megkönnyíti a szedést. Bab mozaikvírussal és baktériumos foltossággal szemben rezisztens.<br>1 tasak: kb.4-5m2-re elegendő<br>Súlya: 40.00g<br>Vetési hónap: 05.-06.-07.-hónap<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 07:43:12', 1),
(49, 62, 0, 0, 0, 0, 'Paradicsom - Jani<br>', '<div align="justify">Bokorparadicsom. Korai fajta, kb. 80cm magas lesz. A kerekded, jóízű termések kb. 7cm átmérőjűek lesznek. Mind szabadföldi termesztésre, mind dézsás paradicsomnak kiváló (teraszra, erkélyre) ajánljuk.<br>1 tasak: tartalmából 30-35 növény lesz<br>Súlya: 20.00g<br>Vetési idő: 01.-02.-03.-hónapban<br>Termelő: ReinSaat KG<br></div><br>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 13:12:53', 1),
(43, 62, 0, 0, 0, 0, 'Bokorbab - Maxi<br>', '<div align="justify">Egyenes növésű fajta, 18-20 cm hosszú terméseket hoz, melyek a levelek fölé magasodnak, így nagyon könnyen szedhető. Nagyon korai, bőtermő fajta, hajtatásra is alkalmas.<br>1 tasak: 4-5m2-re elegendő<br>Súlya: 40.00g<br>Vetési hónap: 05--06.-07.-hónap<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 08:00:57', 1),
(45, 62, 0, 0, 0, 0, 'Koktélparadicsom - Black Cherry<br>', 'Nagyon bőtermő koktél paradicsom fajta, hosszú fürtökben hozza rengeteg apró lilásvörös termését. a paradicsomok nagyon aromásak, édesek. Magas folytonnövő fajta.<br>1 tasak: tartalmából kb. 40 növény lesz.<br>Vetési idő: 01.-02.-03.-hónap<br>Termelő: ReinSaat KG<br>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 08:13:32', 1),
(47, 62, 0, 0, 0, 0, 'Paradicsom - Ruthje<br>', '<div align="justify">Levele fényes, rövid ízközökkel, a termés keményhúsú, 40-55 g közötti, íze kimagaslóan jó, vetekszik a koktélparadicsoméval. A kemény paradicsom sokáig a tövön marad, meg kell várni amíg teljesen bepirosodik. Tápanyaggal kevésbé ellátott helyeken is jól termeszthető.<br>1 tasak: tartalmából kb.40 növény lesz<br>Súlya: 20.00g<br>Vetési idő: 01.-02.-03.-hónapban<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 12:45:47', 1),
(50, 62, 0, 0, 0, 0, 'Paprika - Ferenc Tender<br>', '<div align="justify">Bőtermő, édes ízű paprika,világos sárga, húsos, nagy vastag falú, tompa végű termésekkel.Ragyogó pirosra érik. Jó szabadföldi fajta, de hajtatásra is alkalmas.<br>1 tasak: tartalmából kb. 40 növény lesz<br>Súlya: 20.00g<br>Vetési idő: 02.-03.-05.-hónapban<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 13:24:09', 1),
(52, 62, 0, 0, 0, 0, 'Cukkini - Costates Romanesco<br>', '<div align="justify">Hosszú világoszölddel csíkozott terméseket hoz, melyek nagyon ízletesek. Középkésőn fordul termőre. Kimondottan házikerti különlegesség.<br>1 tasak: tartalmából 7-10 növény lesz<br>Súlya: 30.00g<br>Vetési idő: 04.-05.-06.-hónapban<br>Termelő: ReinSaat KG<br></div>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 13:51:36', 1),
(53, 62, 0, 0, 0, 0, 'Uborka - Marketmore<br>', '<div align="justify">Sötétzöld 25 cm-ig növő, sima héjú, karcsú szabadföldi uborka, jóízű, nem keseredik. Igen bőtermő, toleráns a mozaikvírus, valódi és hamis lisztharmat és varasodás betegségekkel szemben.<br>1 tasak: tartalmából 20-30 növény lesz<br>Súlya: 30.00g<br>Vetési idő: 04.-05.-06.-hónapban<br>Termelő: ReinSaat KG<br></div><br><br>', 'bővebben szöveg', '', '', 0, 0, '0000-00-00', '2013-09-24 13:59:08', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `cikk`
--

CREATE TABLE IF NOT EXISTS `cikk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `html` text NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- A tábla adatainak kiíratása `cikk`
--

INSERT INTO `cikk` (`id`, `userid`, `cim`, `intro`, `html`, `meta`, `jog`, `datum`, `pub`) VALUES
(1, 62, 'Üdvözlöm honlapomon!', '', '<img style="margin: 20px; float: right; width: 201px; height: 291px;"\r\n alt="" src="kepek/portre.jpg"><br>\r\n&nbsp;M&eacute;nkű\r\nOtt&oacute; vagyok az LMP j&aacute;szs&aacute;gi\r\nk&eacute;pviselőjel&ouml;ltje.<br>\r\n&nbsp;&nbsp;&nbsp;&nbsp; A Lehet M&aacute;s a\r\nPolitika megalakul&aacute;sa &oacute;ta szimpatikus\r\nsz&aacute;momra. A z&ouml;ldek k&uuml;ldet&eacute;se\r\nt&ouml;bbek k&ouml;z&ouml;tt, hogy\r\nbegy&oacute;gy&iacute;ts&aacute;k azokat a sebeket,\r\namelyeket a rendszerv&aacute;lt&aacute;s &oacute;ta a\r\nmagyar politikai kult&uacute;ra elszenvedett. <br>\r\n&nbsp;&nbsp;&nbsp; <span\r\n style="font-weight: bold;">Ki kell\r\ngy&oacute;gy&iacute;tanunk a t&aacute;rsadalmat a politikai\r\nkett&eacute;osztotts&aacute;gb&oacute;l! </span><br>\r\nFenntarthat&oacute;, z&ouml;ld gazdas&aacute;g,\r\neg&eacute;szs&eacute;ges k&ouml;rnyezet,\r\nt&aacute;rsadalmi igazs&aacute;goss&aacute;g, a helyi\r\nk&ouml;z&ouml;ss&eacute;gek\r\nmegerős&ouml;d&eacute;s&eacute;nek\r\nelőseg&iacute;t&eacute;se a feladatunk.\r\nV&eacute;lem&eacute;nyem szerint helyi szinten kell megtenni az\r\nelső l&eacute;p&eacute;st a v&aacute;ltoz&aacute;shoz.<br>\r\n&nbsp;&nbsp;&nbsp;\r\n&nbsp;Felh&aacute;bor&iacute;t&oacute;, hogy mi\r\nj&aacute;sz ős&ouml;k\r\n&ouml;r&ouml;k&ouml;seik&eacute;nt\r\nt&ouml;mj&uuml;k magunkba a multi\r\n&aacute;ruh&aacute;zl&aacute;ncok\r\nk&iacute;n&aacute;lta szemetet. Gondoljuk bele, hogy őseink\r\nmilyen fejlett mezőgazdas&aacute;ggal rendelkeztek. Nem\r\nelk&eacute;pesztő, hogy Eur&oacute;pa egyik\r\nlegterm&eacute;kenyebb ter&uuml;letein &eacute;lve hagyjuk\r\nelgyomosodni vagy nagy&uuml;zemi\r\nmonokult&uacute;r&aacute;kkal t&ouml;nkre tenni\r\nf&ouml;ldjeinket.<br>\r\n&nbsp;&nbsp;&nbsp; &nbsp;Az az\r\n&eacute;rz&eacute;s sem jobb hogy 1745-ben m&eacute;g 570\r\n000 rajnai arany forintot tudtunk fizetni a\r\nkiv&aacute;lts&aacute;gaink&eacute;rt, most pedig az\r\norsz&aacute;g szeg&eacute;ny\r\nr&eacute;gi&oacute;j&aacute;nak\r\nsz&aacute;m&iacute;tunk, &eacute;s multi\r\nc&eacute;gekn&eacute;l &aacute;llunk sorba rabszolga\r\nmunk&aacute;&eacute;rt. <br>\r\n&nbsp;&nbsp;&nbsp; Vagy eml&iacute;tsem az\r\n&aacute;llami seg&eacute;dlettel v&eacute;grehajtott\r\nfosztogat&aacute;sokat, a deviza\r\nhitelez&eacute;sk&eacute;nt elh&iacute;res&uuml;lt\r\ncsal&aacute;ssorozatot?<br>\r\n&nbsp;&nbsp;&nbsp; &nbsp;Ink&aacute;bb ne,\r\nink&aacute;bb vissza a b&eacute;k&eacute;be &eacute;s a\r\nharm&oacute;ni&aacute;ba. Egy jobb vil&aacute;gba ahol az\r\nLMP nem csak bent van a parlamentben, de el&eacute;g nagy\r\ns&uacute;llyal van jelen ahhoz, hogy val&oacute;di kontrollja\r\nlegyen a hatalomnak. Legyen az piros vagy narancss&aacute;rga.\r\nV&eacute;g&uuml;l is nem sokban\r\nk&uuml;l&ouml;nb&ouml;znek egym&aacute;st&oacute;l\r\n', '', '', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `dir`
--

CREATE TABLE IF NOT EXISTS `dir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `szulo_id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `pub` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `dir`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(80) NOT NULL,
  `userid` int(11) NOT NULL,
  `ugyfelid` int(11) NOT NULL,
  `kuldocim` varchar(50) NOT NULL,
  `kuldonev` varchar(50) NOT NULL,
  `targy` varchar(200) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `cimnev` varchar(50) NOT NULL,
  `uzenet` text NOT NULL,
  `allapot` varchar(10) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- A tábla adatainak kiíratása `email`
--

INSERT INTO `email` (`id`, `domain`, `userid`, `ugyfelid`, `kuldocim`, `kuldonev`, `targy`, `cim`, `cimnev`, `uzenet`, `allapot`, `datum`) VALUES
(1, 'proba.infolapok.hu', 12, 0, 'mail@infolapok.hu', '', 'gggg', 'motto001@gmail.com', '', 'sui sfuf eufuef ', 'sikeres', '2012-12-25 01:07:18');

-- --------------------------------------------------------

--
-- Tábla szerkezet: `galeria`
--

CREATE TABLE IF NOT EXISTS `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dir_id` int(11) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `dir_id` (`dir_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `galeria`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `galeria_content`
--

CREATE TABLE IF NOT EXISTS `galeria_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `galeria_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `sorrend` int(5) NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `galeria_id` (`galeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `galeria_content`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `hibak`
--

CREATE TABLE IF NOT EXISTS `hibak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(80) NOT NULL,
  `hiba` varchar(250) NOT NULL,
  `userid` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `link` varchar(250) NOT NULL,
  `referer` varchar(250) NOT NULL,
  `adatok` text NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `hibak`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `kapcsolatok`
--

CREATE TABLE IF NOT EXISTS `kapcsolatok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `webhelyid` int(11) NOT NULL,
  `menu_cim` varchar(50) NOT NULL,
  `nev` varchar(250) NOT NULL,
  `cim` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `skype` varchar(250) NOT NULL,
  `tel` varchar(250) NOT NULL,
  `szoveg` text NOT NULL,
  `datum` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `kapcsolatok`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `kategoria`
--

CREATE TABLE IF NOT EXISTS `kategoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `webhely_id` int(11) NOT NULL,
  `szulo_id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `pub` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `kategoria`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `kepek`
--

CREATE TABLE IF NOT EXISTS `kepek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `dir_id` int(11) NOT NULL,
  `file_nev` varchar(50) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `dir_id` (`dir_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `kepek`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `komment`
--

CREATE TABLE IF NOT EXISTS `komment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `menuid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `komment`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `kosar`
--

CREATE TABLE IF NOT EXISTS `kosar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `aruid` int(11) NOT NULL,
  `db` int(11) NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `kosar`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `menuk`
--

CREATE TABLE IF NOT EXISTS `menuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `webhely_id` int(11) NOT NULL,
  `pozicio` varchar(20) NOT NULL DEFAULT 'felsőmenü',
  `sorrend` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `szulo_id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `pub` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `webhely_id` (`webhely_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- A tábla adatainak kiíratása `menuk`
--

INSERT INTO `menuk` (`id`, `user_id`, `webhely_id`, `pozicio`, `sorrend`, `csid`, `szulo_id`, `nev`, `pub`) VALUES
(1, 0, 0, 'felsőmenü', 0, 0, 0, 'Nyitólap', 0),
(2, 0, 0, 'felsőmenü', 0, 0, 0, 'Sürgős tennivalók', 0),
(3, 0, 0, 'felsőmenü', 0, 0, 0, 'A társadalomról', 0),
(4, 0, 0, 'felsőmenü', 0, 0, 0, 'Közösség', 0),
(5, 0, 0, 'felsőmenü', 0, 0, 0, 'Kapcsolat', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `menu_content`
--

CREATE TABLE IF NOT EXISTS `menu_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `tabla` varchar(50) NOT NULL,
  `wiev` varchar(50) NOT NULL,
  `sorrend` int(5) NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '0',
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- A tábla adatainak kiíratása `menu_content`
--

INSERT INTO `menu_content` (`id`, `menu_id`, `item_id`, `tabla`, `wiev`, `sorrend`, `pub`, `datum`) VALUES
(1, 1, 1, 'rtext', 'full', 0, 0, '2013-10-20 20:32:34'),
(2, 2, 24, 'aru', '', 0, 0, '2013-10-20 20:32:34'),
(3, 3, 33, 'aru', '', 0, 0, '2013-10-20 20:32:34'),
(4, 3, 19, 'rtext', '', 0, 0, '2013-10-20 20:32:34'),
(5, 5, 18, 'rtext', '', 0, 0, '2013-10-20 20:32:34'),
(6, 5, 32, 'aru', '', 0, 0, '2013-10-20 20:32:34'),
(7, 5, 34, 'aru', '', 0, 0, '2013-10-20 20:32:35');

-- --------------------------------------------------------

--
-- Tábla szerkezet: `modulok`
--

CREATE TABLE IF NOT EXISTS `modulok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `pozicio` varchar(20) NOT NULL DEFAULT 'felsőmenü',
  `sorrend` int(11) NOT NULL,
  `lathato` varchar(200) NOT NULL,
  `param` text NOT NULL,
  `pub` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `modulok`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `rendeles`
--

CREATE TABLE IF NOT EXISTS `rendeles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `aruk` text NOT NULL,
  `megjegyzes` text NOT NULL,
  `datum` date NOT NULL,
  `ido` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `rendeles`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `rtext`
--

CREATE TABLE IF NOT EXISTS `rtext` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `html` text NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- A tábla adatainak kiíratása `rtext`
--

INSERT INTO `rtext` (`id`, `userid`, `cim`, `intro`, `html`, `meta`, `jog`, `datum`, `pub`) VALUES
(1, 0, 'Bemutatkozás', 'ide jön az intro', 'ez lesz a szöveg', '', '', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet: `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `userid` int(11) DEFAULT '0',
  `server_adatok` text,
  PRIMARY KEY (`session_id`(64)),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `session`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `stat`
--

CREATE TABLE IF NOT EXISTS `stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `url` varchar(200) NOT NULL,
  `ref` varchar(200) NOT NULL,
  `kliens` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ido` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- A tábla adatainak kiíratása `stat`
--


-- --------------------------------------------------------

--
-- Tábla szerkezet: `userek`
--

CREATE TABLE IF NOT EXISTS `userek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `ajanlo` varchar(50) NOT NULL,
  `szamlaszam` varchar(200) NOT NULL,
  `sznev` varchar(250) NOT NULL,
  `szcim` varchar(250) NOT NULL,
  `adoszam` varchar(50) NOT NULL,
  `telefon` varchar(200) NOT NULL,
  `pubtel` varchar(50) NOT NULL,
  `pubnev` varchar(200) NOT NULL,
  `skype` varchar(100) NOT NULL,
  `msn` varchar(100) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `weboldal` varchar(200) NOT NULL,
  `egyeb` varchar(200) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `leiras` text NOT NULL,
  `ellenorzott` varchar(11) NOT NULL DEFAULT 'nem',
  `pubcim` varchar(250) NOT NULL,
  `webhelyek` text NOT NULL,
  `adminok` text NOT NULL,
  `tilt_datum` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=251 ;

--
-- A tábla adatainak kiíratása `userek`
--

INSERT INTO `userek` (`id`, `name`, `username`, `email`, `password`, `registerDate`, `lastvisitDate`, `activation`, `params`, `ajanlo`, `szamlaszam`, `sznev`, `szcim`, `adoszam`, `telefon`, `pubtel`, `pubnev`, `skype`, `msn`, `facebook`, `weboldal`, `egyeb`, `foto`, `leiras`, `ellenorzott`, `pubcim`, `webhelyek`, `adminok`, `tilt_datum`) VALUES
(62, 'Administrator', 'admin', 'motto001@gmail.com', '2c3c03d184949261d6dc8656b46b308a', '2011-08-02 10:49:04', '2012-12-06 22:04:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n', '0', '+4++6', 'fjdfjdgjgh', 'zukftukfzukzfuk', 'zukfzukf', 'rthjeruuze', '54+4++6+66', '', 'tzktikte', 'dtkutk', 'zuktuikuk', 'ukzukz', 'ukzukzuk', 'images/stories/avatar/images8.jpg', '<img src="http://infolapok.hu/images/stories/62/4111470_work_group_o.jpg" border="" /> <span style="font-size: large;"><span style="color: #993300;">fgnjfjnrftjnrtjrjtrtj jr rtjhrdt uzuzrtuz</span><br /><br /><br /></span> rtuzrz eruzrt zurtz rz rtrtz rtzer tze r erzr', 'nem', '', '', '', '0000-00-00'),
(228, 'Neo Shin', 'neoshin', 'lazado001@gmail.com', '2c3c03d184949261d6dc8656b46b308a', '2011-12-21 21:29:38', '0000-00-00 00:00:00', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'nem', '', '', '', '0000-00-00'),
(233, 'Ménkű Ottó', 'motto', 'motto001@infolapok.com', '5d3c106c19e96df95f9a6ad900975145:OyJnFQRezN7ChHrrgTtxPC1BUsLw7Gh3', '2012-01-18 14:35:31', '2012-04-02 23:11:13', '', 'language=\ntimezone=1\n\n', '62', '', '', '', '', '', '', '', 'menkuotto1', '', '', 'hackotopia.hu', '', 'images/stories/avatar/images8.jpg', '', 'igen', '', '', '', '0000-00-00'),
(247, 'Petro Tibor', 'tibi', 'petro1.tibor@gmail.com', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '2012-06-05 18:18:22', '2012-09-07 07:05:14', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'nem', '', '', '', '0000-00-00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
