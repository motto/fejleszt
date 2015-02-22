-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Hoszt: 127.0.0.1
-- Létrehozás ideje: 2015. Feb 06. 10:09
-- Szerver verzió: 5.6.17
-- PHP verzió: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Adatbázis: `fejleszt`
--

DELIMITER $$
--
-- Eljárások
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllArticle`()
BEGIN
  SELECT id FROM cikk;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getcc`()
BEGIN
  SELECT * FROM cikk;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getcc2`(IN mezonev VARCHAR(50))
BEGIN
  SELECT mezonev FROM cikk;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getcc3`()
BEGIN
  SELECT `id` FROM cikk;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getcc4`(IN `mezonev` VARCHAR(50))
BEGIN
DECLARE mezonev varchar(50);
 SELECT mezonev FROM cikk;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getdata`(IN `kategoria` VARCHAR(50))
BEGIN
  SELECT id,kat FROM cikk WHERE kat=kategoria;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Getdata2`(IN mezonev VARCHAR(50))
BEGIN
    SET @s = CONCAT('SELECT ',mezonev,' FROM cikk' );
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getdata9`(IN `lng` VARCHAR(50), IN `szukit` VARCHAR(250))
    NO SQL
BEGIN

DECLARE c CURSOR FOR SELECT * FROM item ;
    OPEN c ;
   
    CLOSE c;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cikk`
--

CREATE TABLE IF NOT EXISTS `cikk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sorrend` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media` varchar(200) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `og_intro` varchar(400) NOT NULL,
  `szoveg` text NOT NULL,
  `kat` varchar(200) NOT NULL,
  `cimke` varchar(200) NOT NULL,
  `meta` varchar(200) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- A tábla adatainak kiíratása `cikk`
--

INSERT INTO `cikk` (`id`, `sorrend`, `user_id`, `media`, `cim`, `intro`, `og_intro`, `szoveg`, `kat`, `cimke`, `meta`, `jog`, `datum`, `pub`) VALUES
(10, 0, 62, 'media/62_1395431062_230.jpg', 'Kössünk szövetséget!', 'Üdvözlöm honlapomon Ménkű Ottó vagyok a SZÖVETSÉG A VÁLTOZÁSÉRT egyesület önkormányzati képviselő jelöltje. A 7. választókerület polgárait szeretném képviselni.', '', 'Néhány szó magamról: 46 éves vagyok, nős, a legújabb és a hozzám legközelebb álló képzettségemet tekintve rendszerinformatikus. Sajnos ebben a szakmámban nem sokat dolgoztam, leginkább az iparban és a kereskedelemben találtam megélhetést. Voltam hegesztő, minőségellenőr, műszakvezető, és&nbsp; saját vállalkozásként volt egy kis antikváriumom is. Jelenleg egy kis családi cégnél dolgozok. Az Elelktrolux-nak készítünk különféle szerelő szerszámokat és végzünk karbantartási munkákat. Mint látható, nem az a tipikus politikusi előéletem van. Ez két dolog miatt jó:<br>-Megszoktam, hogy megdolgozom a pénzemért, hogy számon kérnek, és hogy teljesítményt kell felmutatnom.<br>-Nem vagyok elköteleződve senkinek. Ha bizalmat kapok, azt nem holmi engem segítő lobbinak kell megszolgálnom, hanem a választóimnak.<br>&nbsp;Mivel ez egy választási bemutatkozás, engedtessék meg nekem, hogy elsősorban arról beszéljek, miért vagyok alkalmas több ezer ember képviseletére. Természetesen nekem is vannak hibáim, de ezek taglalását átengedem politikai ellenfeleimnek. <br>&nbsp;De ha már a hibáknál tartunk, kezdeném a legfontosabb jó tulajdonságaimmal: amellett, hogy intelligens (és szerény :) ) vagyok, felismerem, sőt elismerem a hibáimat. És ami még fontosabb, képes vagyok tanulni belőlük. Vagy egy kicsit általánosabban: képes vagyok tanulni, fejlődni. Ez alatt nemcsak azt értem, hogy folyamatosan képezem magam (jelenleg is tanulok az egri Eszterházy Károly Főiskola gazdaságinformatikus szakán), hanem hogy igyekszem minél több mindent megtanulni a körülöttem lévő világról, a dolgok működéséről, hogy hogyan kell megcsinálni, létrehozni valamit. Ez kezdődött a festészettel. Hamar felismertem, hogy nem vagyok egy nagy művész, de nagyon érdekelt a portréfestés, ezért addig "szívóskodtam", míg a technikák kellően ügyes használatával elég jó képeket nem sikerült csinálnom.  <font color="blue"><a href="https://www.facebook.com/photo.php?fbid=363426900412363&amp;set=a.701751946579855&amp;type=3&amp;theater">&lt;<font color="blue">néhány munkám itt megtekinthető</font>&gt;</a></font><br>&nbsp;Ezt a gyakorlatias, célorientált hozzáállást szeretném a politikába is meghonosítani. Mert úgy gondolom, az erőforrásaink hatékony felhasználásával, és egy emberközelibb döntéshozói hozzáállással, Jászberény egész élhető kisváros lehetne.<br>Ehhez persze nem csak jó képességű, de jó szándékú emberek is kellenek. <br>Most hagy ne bizonygassam hogy én vagyok a tiszta lélek a politika mocsarában. Sajnos nem. Sem jobb sem rosszabb nem vagyok mint az átlag polgár. Talán amire mégis büszke lehetek, az a velem született erős igazság érzetem. Ami már rengeteg problémát okozott, sok munkahelyembe került és mégis örülök hogy van. Valamint hogy én már tényleg eljutottam arra a szintre, hogy nem a pénz a legfontosabb a világon. Az ötödik x felé közeledve már nem érzem&nbsp; korlátlannak az időmet. És nem akarom úgy letenni a lantot, hogy semmi értelme nem volt az életemnek...<br>Persze igazából mindegy, hogy én itt miket irkálok. A lényeg úgyis az, hogy ön megbízik bennem vagy nem. A bizalmat ha megkapom vakon azt megköszönöm, de ha szeretne velem találkozni az is megoldható. Sokan elvárnák tőlem hogy a nap 24 órájába járjam a kerületem és győzködjem az embereket. Sajnos ezt munka mellett nem tudom megoldani. Igyekszem minél több helyre eljutni, de a tapasztalatom a következő: 10 házból 4-ben nem tudok senkit elérni. 3-ban nem érdekel semmi, nem foglalkozok semmivel, hagyjon engem békén mentalitás van. Legalább egy "IGAZ MAGYAR" okoskodását is végig kell halgatnom, valamint legalább egy csőlátású fideszes is elmagyarázza a rezsicsökkentést.Olyan jó lenne ha az ezekre pazarolt időt inkább normális beszélgetésre fordíthatnám. Ha ön nem tartozik a fenti három kategóriába kérem írjon a menkuotto@gmail.com-ra vagy&nbsp;<font color="blue"> <a href="http://menkuotto.infolapok.hu/index.php?com=mail&amp;toid=62&amp;mod=kapcs&amp;csid=5">&lt;<font color="blue"> ide </font>&gt;</a></font> kattintva hagyjon üzenetet.Fel fogom venni önnel a kapcsolatot. <br>&nbsp;Tisztelettel:<br>&nbsp;Ménkű Ottó', '', '', '', '', '2014-09-28 22:20:31', 0),
(6, 0, 62, 'media/62_1395609067_85.jpg', 'Tiszta Magyarországot!', 'Az emberhez méltó élet legyen elérhető mindenki számára!', '', '<div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);">-Erős vidék:ami csak erős mezőgazdasággal, a ráépülő feldolgozó, kiszolgáló iparral és korrekt kereskedelemmel érhető el. Európa legjobb termőföldjein tesszük tönkre nagyipari módszerekkel. Olyan Jász ősök kulturális örököseiként akik már kétezer éve is fejlett mezőgazdasággal rendelkeztek. Az egyik oldalon megműveletlen vagy rosszul kihasznált földek és tömeges munkanélküliség, A másik oldalon lassan megfizethetetlen élelmiszer árak, a jó minőségű élelmiszer helyett kereskedelmi láncok szemeteivel tömött emberek. Vajon mi lehet a megoldás?</div><div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);">Persze ehhez és az emberhez méltó élethez jelentősen csökkenteni kell, a bürokráciát a korrupciót,a kisvállalkozások terheit és a munkára rakódó költségeket. Hogy végre a bérek is kezdjenek elmozdulni a nyugati irányba.</div><div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);">Természetesen én is látom az áldatlan állapotokat az egészségügyben, az oktatásban, a közigazgatásban és a &nbsp;szociális hálóban is. De míg az első &nbsp;ponthoz be merek vállalni egy jelentős fordulatot, az utóbbiak rendbetételéhez már egy LMP-s kétharmad kellene.</div><div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);">Amit még meg merek ígérni: Minden &nbsp;elérhető törvényes eszközzel harcolni fogok a deviza hitelezésként elhíresült csalás sorozat áldozatainak kártalanításáért, és elkövetőinek valamint bűntársaiknak felelősségre vonásáért.</div><div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);">-De mi a garancia rá?</div><div style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13px; line-height: normal; background-color: rgb(255, 255, 255);"><div>Elsősorban a motivációm: az hogy én igazából nem vagyok politikus.Nem egy elefántcsont toronyban élek,mint a politikai elit. Nekem az itteni emberek nem választóim hanem családtagjaim barátaim munkatársaim ismerőseim és jövendő ismerőseim. Nap mint nap találkozok velük és a szemükbe kell néznem! Nem tehetem meg hogy a jövőjükkel játsszak!&nbsp;</div><div>Továbbá egész életemben az iparban és a mezőgazdaságban dolgoztam. Hozzászoktam hogy a rám bízott feladatot el kell végeznem. Hogy számon kérnek elszámoltatnak és ha kell felelősségre is vonnak.És még valami: Ha én kapok bizalmat az azt jelenti hogy valami alapvető változás indult el. Azt jelenti hogy nem vagyunk kiszolgáltatva a hatalmasoknak. Egy kisember is tehet valamit ha saját kezébe akarja venni a sorsát...&nbsp;</div></div>', 'program', '', '', '', '2014-03-23 22:18:41', 1),
(8, 0, 62, 'media/62_1412031773_723.jpg', 'A KISEMBEREKÉRT DOLGOZUNK!', 'A SZÖVETSÉG A VÁLTOZÁSÉRT\r\nösszefogás programja\r\n', '', '<br><br>Jászberény város társadalmi és gazdasági helyzete<br>•&nbsp;&nbsp; &nbsp;Szabó Tamás nem valósította meg programját<br>•&nbsp;&nbsp; &nbsp;A Fidesz a gazdagok pártja: nem a kisembert képviseli<br>•&nbsp;&nbsp; &nbsp;Folyamatosan csökken a lakosság száma<br>•&nbsp;&nbsp; &nbsp;Romlik az egészségügy, az oktatás és a kultúra színvonala<br>Jászberényben évről évre csökken a lakosság száma. Romlik az egészségügy, az oktatás és a kultúra színvonala. A munkavállalók számára kevés a megfelelő állás, és nő kiszolgáltatottságuk a munkáltatók felé. Túlélésükért küzdenek a kis- és középvállalkozások. Nő a szegénység, a társadalmi és vagyoni különbségek. A városvezetés párthovatartozás szerint kezeli az embereket. Emelte a közüzemi díjakat, a helyi adókat, miközben programját lényegében nem valósította meg. <br>Romlott Jászberény város térségi vezető szerepe. Az állam – Szabó Tamás támogatásával - oktatási és egészségügyi intézményeket vett el. A polgármester kulturális intézmények (DMK és könyvtár) összevonását és ezzel lefokozását rendelte el. Nem épült meg a várost megkerülő körgyűrű harmadik üteme. Nem valósultak meg a Fidesz kiemelt projektjei, az ipari park, a wellnessfürdő. Ígérték, de ne csináltak mélygarázst, geotermikus erőművet. Ehelyett városi ingatlanokat adtak el, áron alul. Történtek ugyan fejlesztések a helyi adófizetők és az Európai Unió forrásaiból, de Jászberénynek nem sikerült új lendületet adni. A Fidesz a helyi sajtót a kudarcok leplezése érdekében befolyása alá vonta. Tény, hogy a Fideszes városvezetés rosszul „sáfárkodott” a rábízott közpénzekkel. Nem a választókat szolgálta, hanem megbízatását a saját hatalmának építgetésére használta. <br>A „Szövetség a változásért” jelöltjei ezen fognak változtatni!<br><br>Jászberény szellemisége <br>•&nbsp;&nbsp; &nbsp;Befogadó várost építünk <br>•&nbsp;&nbsp; &nbsp;Megvédjük értékeinket<br>Magyarország a jászokat a XIII. században fogadta be, „mert az egy nyelvű és egy szokású ország gyenge és esendő”. Ez a jász szellemiség ma is hat.&nbsp; Arra tanít, hogy minden embernek egyenlő méltósága van, legyen gazdag vagy szegény, nő vagy férfi, roma vagy zsidó, rokkant vagy egészséges, őseire büszke jász atyafi vagy „gyüttment”. Jó szívvel fogadjuk az idegeneket. Kerüljük a kirekesztést, a születési előjogokat, és elutasítjuk azt, hogy valaki a kizárólagos igazságot hirdesse. Jászberény mindig büszke volt szabadságára és autonómiájára. Az 1745-ös „jász redemptio” is ezt igazolta. Számunkra Lehel vezér legendája, a Lehel Kürt is a szabadságot és az autonómiát szimbolizálja. &nbsp;<br>A jászberényiek sohasem voltak közömbösek közösségük iránt. Törekedtek a jóra, a szüleik, gyermekeik, barátaik és a közösség boldogulására, szeretetére. Szolidárisak voltak egymás iránt és áldozatkészek a város építésében. Ennek köszönhető, hogy az elsők között alapított az országban Jászberény múzeumot. Újkori példa, hogy a Hűtőgépgyár, vagy az Aprítógépgyár igazi mecénásaivá váltak Jászberénynek. <br>A Szövetség a változásért jelöltjei ezt a szellemiséget kívánják követni. <br><br>Jászberény az otthonunk<br>•&nbsp;&nbsp; &nbsp;Gyarapítjuk a város vagyonát <br>•&nbsp;&nbsp; &nbsp;Kezünkbe vesszük a döntést a saját sorsunkról<br>•&nbsp;&nbsp; &nbsp;Európa nem ellenség, hanem szövetséges<br>•&nbsp;&nbsp; &nbsp;Gondolkodjunk globálisan, cselekedjünk lokálisan<br>•&nbsp;&nbsp; &nbsp;Pártpolitika-mentes közigazgatás Jászberényben<br>Mi, Jászberényben vagyunk otthon! Éppen úgy, ahogyan a gyermekeink, a barátaink, ismerőseink, vagy bárki, aki városunkat választotta otthonának. Természetes törekvésünk hát, hogy az otthonunk boldogulását szolgáljuk, értékeit és vagyonát gyarapítsuk. Hisszük, hogy kiegyensúlyozott magánéletet csak akkor teremthetünk a magunk számára, ha a közéletben is szerepet vállalunk. Minden jászberényinek helye és szerepe van tehát a helyi közéletben, a város politikájában! Senki, de különösen a jászok nem hagyhatják, hogy a fejük felett döntsenek! Nem hagyhatjuk, hogy a magunk ügyébe, a helyi ügyekbe mások, akár az állam beleszóljanak. Európa ebben nekünk nem ellenségünk, hanem szövetségesünk, mert a helyi autonómiákat, a helyi közösségeket, a kultúrák sokszínűségét támogatja, fejlesztéseinkhez támogatást nyújt.<br>Mindenre képesek vagyunk gyerekeinkért, miközben bölcsőjét, a Földet mérgezzük. Sokan úgy viselkednek, mintha lenne egy másik Föld is, ahova majd a gyermekeink elköltözhetnek, ha ezt tönkretettük. Ám ez nem így van. Szakemberek szerint egy emberöltőnk van, hogy megmentsük bolygónkat, valójában magunkat: az embert. A Szövetség változásért hirdeti: a természettel harmóniában kell élni.<br>Európa, de talán a világ egyik legjobb termőterületén élünk. Olyan jászok kulturális örököseiként, akik már kétezer éve fejlett mezőgazdasággal rendelkeztek. Termőterületeinket monokultúrás nagyipari módszerekkel zsákmányoljuk ki, erdeink már csak telepített faültetvények, a kevés megmaradt "vad" területen pedig a vadászok tenyésztenek fácánt, őzet és nyulat. Vizeinket megmérgezzük, a levegőnk pedig csak azért jó még, mert az iparunk haldoklik. Ez a környezetnek káros, de gazdaságilag sem előnyös.<br>&nbsp;A Szövetség a változásért olyan helyi politikát kíván folytatni, amely kielégíti a jászberényiek igényeit, de nem veszélyezteti gyermekeink esélyét arra, hogy ők is kielégíthessék szükségleteiket. Cél a szociális jólét, a méltányos életfeltételek lehetőségének biztosítása mindenki - a jelenlegi és a jövőbeli nemzedékek – számára. Ez csak úgy lehetséges, ha fenntartható módon hasznosítjuk a helyi természeti erőforrásokat, elkerüljük a káros hatásokat, a környezet állapotában bekövetkező visszafordíthatatlan változásokat.<br>A közigazgatásban nincs helye a pártpolitikának, annál inkább a szakmaiságnak és a teljesítménynek. A Szövetség a változásért támogatja a közigazgatás szolgáltató jellegének visszaállítását, a Kormányablak létrehozását. <br><br>Több lehetőséget adunk a leszakadóknak, több felelősséget a tehetőseknek<br>•&nbsp;&nbsp; &nbsp;Több segítséget a rászorulóknak<br>•&nbsp;&nbsp; &nbsp;Több terhet az igazán gazdagoknak<br>•&nbsp;&nbsp; &nbsp;Azoknak segítünk, akiknek szükségük van rá – nem a gazdagoknak<br>A Szövetség a változásért tagjai minden jászberényi képviseletét vállalják, hisz ez törvényi kötelezettségük! Ám az is nyilvánvaló, hogy sokkal erősebb érdekérvényesítők Jászberény város mostani vezetésénél a gazdag nagyvállalkozók. A bérből és fizetésből élő munkavállalók, a kisnyugdíjasok, a fiatal felnőttek vagy a kis- és középvállalkozás képviselői hátrányba kerültek. Az egyensúly megbillent. Azonban a várospolitika az egész közösség érdekét kell, hogy szolgálja! A Szövetség a változásért programja elsősorban a jászberényi kisember helyzetén kell, hogy javítson! Politikánk központjában tehát a munkavállalók, az ifjúság, a kisnyugdíjasok, a hátrányos helyzetűek és a kis- és középvállalkozások érdekeinek képviselete áll. A helyi forrásokból több lehetőséget adunk a leszakadóknak, de több felelősséget a tehetőseknek. <br><br>Munkahelyeket teremtünk<br>•&nbsp;&nbsp; &nbsp;1000 közmunkás állás öt év alatt<br>•&nbsp;&nbsp; &nbsp;Különleges gazdasági övezet a „katonák földjén”<br>•&nbsp;&nbsp; &nbsp;Adókedvezmény a munkahelyteremtő vállalkozásoknak<br>•&nbsp;&nbsp; &nbsp;Munkajogi ombudsmant a városházára<br>•&nbsp;&nbsp; &nbsp;Pályázat a megváltozott munkaképességű, fogyatékkal élő emberek rehabilitációjára, foglalkoztatásuk elősegítésére<br>Munkahelyeket elsősorban a gazdaság szereplői tudnak létesíteni. Mégis – különösen nehéz társadalmi helyzetekben – egy önkormányzatnak is vannak lehetőségei erre. Jászberény adóbevétele ezt lehetővé teszi, a város fejlődése pedig azt követeli, hogy önkormányzatunk ebben megkétszerezze erőfeszítéseit. A Szövetség a változásért kiemelten támogatja tehát a munkahelyteremtést. Ennek keretében különleges gazdasági övezetet hoz létre Jászberényben, az ún. „katonák földjén”. Az ide betelepülő és munkahelyeket teremtő vállalkozások számára helyi adókedvezményt ad. 1000 közmunka helyet teremt a jászberényi munkavállalóknak 5 év alatt. Felállítja a munkajogi ombudsman intézményét az önkormányzatban. A munkajogi ombudsman a jászberényi munkavállalók munkajogi ügyeiben ad jogi tanácsot és eljár munkajogi érdekeik védelmében.<br>Nehéz manapság megfelelő munkát találni, de különösen az a megváltozott munkaképességű, fogyatékkal élő embereknek. Rehabilitációjuk és foglalkoztatásuk elősegítésére, a Szövetség a változásért folyamatosan pályázni fog olyan munkahelyek létrehozására, amelyek az ő foglalkoztatásukat támogatják.<br><br>Az egészség mindnyájunk számára elsődleges érték<br>•&nbsp;&nbsp; &nbsp;A munkakörülmények javítása<br>•&nbsp;&nbsp; &nbsp;Bérkiegészítés az orvosoknak<br>•&nbsp;&nbsp; &nbsp;Bérkiegészítés az ápolóknak<br>•&nbsp;&nbsp; &nbsp;Lakhatási támogatás az egészségügyben dolgozóknak<br>•&nbsp;&nbsp; &nbsp;Támogatás az életmódváltáshoz<br>Évről évre csökken az egészségügyi szolgáltatások színvonala. Pénzhiány, orvos- és ápolóhiány, várólisták jellemzik a szektort. A Szövetség a változásért stratégiai ágazatnak tekinti az állami kézben lévő egészségügyet. Az önkormányzatnak folyamatos feladata, hogy javítsa a jászberényi Szent Erzsébet Kórház tárgyi feltételeit, az egészségügyben dolgozó orvosok, ápolók munkakörülményeit. A Szövetség a változásért hiszi, hogy a „Szent Erzsébet Kórház erőssége nem a falakban, hanem orvosainak, ápolóinak és más dolgozóinak lelkében van”, ezért az ő helyzetükön kíván elsősorban változtatni. A helyi egészségügyben dolgozók számára jó munkájukért bérkiegészítést, a cafetéria lehetőségek bővítését és lakhatási támogatást kíván biztosítani.<br>Megfelelő életmóddal a betegségek jó részét elkerülhetnénk. Tudjuk, hogy az „egészségiparnak” betegekre van szüksége. De a betegnek is jó, ha „kicsit beteg”, mert figyelmet, törődést, gondoskodást és pénzt kaphat a környezetétől. Ám az ország számára ez óriási kiadást jelent, amit ha egészségesebbek lennénk, másra fordíthatnánk: munkahelyteremtésre, a szegények megsegítésére, kultúrára és oktatásra. Félreértés ne essék: nem az a kérdés, hogy fontos-e az egészségügy fejlesztése, hanem az, hogyan lehet elkerülni a kórházakat. A válasz százszor is ugyanaz: megfelelő életmóddal. Ezt viszont támogatni, sőt, tanítani kell, önkormányzati szinten is. A Jászberényi Városházán olyan szakemberekre is szükség van, akik a helyes életmódot művelik, szervezik és oktatják. Akik képesek a jászberényieknek tanácsot és támogatást adni egy egészségesebb jobb színvonalú élethez! A lakosok egészségtudatosságát fejlesztő rendezvényekre, a tudatos és egészséges táplálkozást hirdető programokra van szükség.<br><br>Az oktatás az előrelépés kulcsa<br>•&nbsp;&nbsp; &nbsp;Helyzetkép a közoktatás állapotáról<br>•&nbsp;&nbsp; &nbsp;Középpontban a gyermek<br>•&nbsp;&nbsp; &nbsp;Önállóságot a pedagógusnak<br>•&nbsp;&nbsp; &nbsp;Továbbképzési támogatás<br>•&nbsp;&nbsp; &nbsp;A térség igényeihez igazodó szakképzés<br>Az államosítás zűrzavart okozott a közoktatásban. Az előrelépés kiindulópontja Jászberényben is egy – elsősorban a gyermekek szempontjából történő - helyzetkép készítése lehet. Ám e nélkül is nyilvánvaló, hogy a pedagógusok autonómiája, továbbképzési lehetőségei csökkentek, miközben félnek a helyi hatalom túlkapásaitól. A városnak talán még soha nem volt olyan szüksége a Lehel Vezér Gimnáziumban nemcsak kiművelt, de emberi tartást is birtokló és megszerző szellemeire, mint manapság. A középiskolákban megszerzett szellemiség dönti el ugyanis, hogy a friss diplomás a főiskola, az egyetem után visszatér-e a városba, vagy diplomájával kezében legyint egyet a visszatérés lehetőségére.&nbsp; A térség közép- és kisvállalkozásainak igényeihez igazodó szakmunkás-, ill. szakképzés a helyi, az országos átlagot meghaladó ipari vállalkozások fejlődésének alapfeltétele. Támogatjuk a pedagógusok szakmai önállóságát, továbbképzését. A Szövetség a változásért kiemelten kívánja támogatni a hátrányos helyzetű vagy fogyatékos gyermekek oktatását. &nbsp;<br><br>Adópolitika<br>•&nbsp;&nbsp; &nbsp;A kommunális adó eltörlése<br>•&nbsp;&nbsp; &nbsp;Adókedvezmény a munkahelyteremtő vállalkozásoknak<br>•&nbsp;&nbsp; &nbsp;Kincstári józanság és ésszerűség<br>A Szövetség a változásért elutasítja, hogy a városvezetés tovább sarcolja a szegényeket! A helyi költségvetésnek nincs szüksége a Fidesz által bevezetett új helyi adóra, a kommunális adóra! Ezeket a pénzeket a lakosok zsebében kell hagyni, hisz a kormányzat úgy is igazságtalan módon túlterheli a munkából élőket. A Szövetség a változásért adókedvezményekkel támogatja a munkahelyteremtést. Az adókedvezmények forrása a propagandakiadások, az eltúlzott megbízási díjak, a drága kirakat-beruházások, az utazási és&nbsp; „tűzijáték-rendezvények” költségeinek csökkentésével áll elő. A Szövetség a változásért a kincstári józanság és ésszerűség talaján áll, azaz „addig nyújtózkodunk, amíg a takaró ér”. <br><br>Gazdaságfejlesztés<br>•&nbsp;&nbsp; &nbsp;Helyi adómentes vállalkozási övezet munkahelyteremtő vállalkozásoknak<br>•&nbsp;&nbsp; &nbsp;Zöld tudásközpont a malomban <br>•&nbsp;&nbsp; &nbsp;Ingyenes pályázati tanácsadás EU-s források lehívásához <br>•&nbsp;&nbsp; &nbsp;Közmunkaprogram a mezőgazdaság fejlesztéséhez<br>•&nbsp;&nbsp; &nbsp;Biointenzív mezőgazdasági termelés<br>•&nbsp;&nbsp; &nbsp;Mezőgazdasági termékek helyi feldolgozása<br>•&nbsp;&nbsp; &nbsp;„Kiskert modell” bevezetése<br>A Fidesz új lendületet ígért a helyi gazdaságnak. Ezzel szemben meghiúsította a Tudásközpont és a geotermikus energia hasznosításának ügyét. Több milliárdos kárt okozott a városnak. Önmagában a Tudásközpont helyi elutasítása a kormány által nyújtott 2 milliárdos támogatás visszavonását eredményezte. Ígérte, de mégsem épített ipari parkot, sem termál hotelt. A Szövetség a változásért összefogás a katonák földjén helyi adómentes vállalkozási övezetet létesít új, munkahelyteremtő vállalkozásoknak. A malom épületében, csónakház helyett inkubátorházat hoz létre kezdő vállalkozásoknak és ingyenes pályázati tanácsadást indít helyi vállalkozások számára az EU-s források eléréséhez. A malom helyszínén egy új „zöld tudásközpontot” alakítunk ki, ahol zöld oktatási, nevelési, sport (kultúra) tevékenység kap helyet. A zöld tudásközpont ösztönözhetné a jászberényi zöld ipari tevékenység kialakítását. <br>A Szövetség a változásért a Neszűrben a geotermikus energia hasznosításával üvegházak létesítését támogatja, közmunkaprogramokkal pedig erősíti a térség mezőgazdasági tevékenységét.&nbsp;&nbsp; A monokultúrás növénytermesztés hatékony, de a keletkezett profit nagyon kevés embernek jelent megélhetést. A sebezhetőségéről nem is beszélve. Egy rosszkor jött esőzés vagy egy aszályos időszak tönkreteheti az egész ágazatot. A támogatások jó része mégis ide kerül. A Szövetség a változásért a munkaigényesebb termelési módokat (bio, biointenzív, permakultúra stb.) és növényeket (zöldségek, gyümölcsök) támogatását részesíti előnyben, mert jóval nagyobb hozzáadott érték keletkezne, és több embernek tudnánk munkát adni. A Szövetség a változásért támogatja a helyi feldolgozó üzemek létesítését és működését, amelyek serkentik a háttéripart, maguk után húzzák a kereskedelmet és a szolgáltatásokat. <br>A Szövetség a változásért támogatja az úgynevezett „kiskert modell” térnyerését. Célunk a jászberényiek egészséges élelmiszerellátása, a foglalkoztatottság problémáinak a megoldása, a városból kiábrándult fiatalok vidéken történő letelepedésének elősegítése, a szabad művelhető kiskertek, az önfenntartó családi gazdaságok és az élelmiszertermelő mikro gazdaságok létrehozásának megszervezése, továbbképzése, az alapanyagok feldolgozása, a termékek közös forgalmazása. <br><br>Közlekedésfejlesztés<br>•&nbsp;&nbsp; &nbsp;A várost megkerülő körgyűrű harmadik üteme <br>•&nbsp;&nbsp; &nbsp;Adu-körforgalmi csomópont<br>•&nbsp;&nbsp; &nbsp;A könyvtár melletti közlekedési csomópont problémájának megoldása<br>•&nbsp;&nbsp; &nbsp;Intermodális közösségi közlekedési csomópont létesítése<br>•&nbsp;&nbsp; &nbsp;A Zagyva sétány továbbfejlesztése<br>2002-2006 között megépült a várost megkerülő körgyűrű első üteme, 2006-2010 között a második ütem. 2010-2014 között, a Fidesz ígérete ellenére, nem épült meg a harmadik ütem. A Szövetség a változásért közreműködik abban, hogy a harmadik ütem mielőbb megépüljön. Az Adu-körforgalmi és könyvtár közlekedési csomópontot, a lakosság igényei szerint, a biztonságos és gyors közlekedés érdekében alakítja át. A város forgalmi helyzete megkívánja, hogy egy intermodális közösségi közlekedési csomópont létesüljön és ezzel tehermentesítsük a város központi részét. Dr. Balogh Balázs, diákjaival számos tervet készített a Zagyva területének hasznosítására. Ez szolgált alapul a Zagyva sétány tervezéséhez is. Az általuk megkezdett programot folytatni kell. <br><br>Településfejlesztés, településüzemeltetés<br>•&nbsp;&nbsp; &nbsp;Új településfejlesztési koncepció<br>•&nbsp;&nbsp; &nbsp;A közvilágítás energia hatékony korszerűsítése<br>•&nbsp;&nbsp; &nbsp;Külváros kapui program<br>Jászberény kiemelkedően sikeres volt 2006 és 2010 között az európai uniós pályázatokon, de sok forrást nyert a kormányzattól is. Az elkerülő út harmadik üteme, a négy számjegyű utak felújítása, a hűtőgépgyári út felújítása, a belváros rekonstrukciója, a központi óvoda, a csapadékvíz elvezetés az előbbi kategóriába, míg a Jászság Népi Együttes Székháza és jégpálya kialakítása az utóbbi csoportba tartozik. A források elnyerésének alapjául az integrált városfejlesztési koncepció, a településfejlesztési koncepció és más tervek szolgáltak. Az EU új költségvetési ciklusában a gazdaságfejlesztés a fő prioritás, amihez városunknak új terveket kell készítenie. A tervek elsősorban a munkahelyteremtést, a gazdaság élénkítését kell, hogy szolgálják. A Szövetség a változásért összefogás új településfejlesztési koncepciót készít.<br>A Szövetség a változásért összefogás energetikai tanulmányt készít a jászberényi közvilágítás energiatakarékos átalakítása érdekében, és részt vesz azokon a pályázatokon, ahol a közvilágítás energiatakarékos korszerűsítésére nyerhet Jászberény forrásokat. <br>&nbsp;A Fidesz a „Belváros kapuja program” keretében kizárólag a város központját fejlesztette. Most a „külváros kapuin” a sor. A külváros kapuinál rengeteg a csapadékvíz-elvezetési probléma, az utak karbantartása komolyabb ráfordítást igényel. Még mindig nincs járda mindenütt. <br><br>Hulladékgazdálkodás<br>•&nbsp;&nbsp; &nbsp;Megszüntetjük az illegális szemétlerakókat<br>•&nbsp;&nbsp; &nbsp;Elszállítjuk a szemetet a városból<br>•&nbsp;&nbsp; &nbsp;Felelősségre vonjuk a szabályok megsértőit<br>Jászberény nem csak a politikusoktól lehetne jobb hely. Apróságnak tűnő, de fontos fejlesztésekkel könnyebbé tehetjük az életünket. A Szövetség a változásért összefogás ezt látja a szelektív hulladékgyűjtés terén is. Ám a szemetet, ha eldobják, vagy nem megfelelően helyezik ki, attól még el kell szállítani. Ez nyilván a város feladata. Mint ahogyan az is, hogy az illegális hulladéklerakást, vagy a kihelyezés rendjét megsértőket tetten érjék, és felelősségre vonják. A Szövetség a változásért összefogás megszünteti az illegális hulladéklerakókat. <br><br>Helyi környezet- és természetvédelem<br>•&nbsp;&nbsp; &nbsp;Környezetet megóvó csapadék- és szennyvíz-elvezetés <br>•&nbsp;&nbsp; &nbsp;Zöldfelületek növelése, megfelelő gondozása<br>•&nbsp;&nbsp; &nbsp;28 ezer új fát Jászberénybe<br>•&nbsp;&nbsp; &nbsp;Új lendület a természetvédelmi fórumoknak, egyesületeknek <br>•&nbsp;&nbsp; &nbsp;A fakivágások korlátozása<br>•&nbsp;&nbsp; &nbsp;„Zöld parkerdő” fejlesztése az állatkert mellett<br>Jászberényben eső idején, gyakran az utcán folyik a szennyvíz. Az ok nyilvánvaló: sokan felelőtlenül, az esővizet a szennyvízelvezető csatornákba vezetik. Az illegális bevezetéseket haladéktalanul fel kell tárni és meg kell szüntetni. Az is nyilvánvaló, hogy még mindig folyik szennyvíz a Zagyvába. Az egészséget és természetet egyaránt veszélyeztető bevezetéseket itt is meg kell szüntetni. <br>A Szövetség a változásért javít Jászberény levegőjén. Ennek egyik eszköze a zöldfelületeink növelése (utcafásítás, parlagon lévő területek hasznosítása) és megfelelő gondozása. A Szövetség a változásért minden jászberényinek ültet egy fát. Öt év alatt összesen 28 ezret. Választása szerint saját otthonában, vagy önkormányzati területen.<br>A városban számos természetvédelmi fórum (Zöld diákparlament) és egyesület alakult, de működésük akadozik. Új lendületet kell adni számukra az önkormányzat támogatásával, az Állatkert és a területileg illetékes Nemzeti Park szakembereinek bevonásával. <br>A városvezetés számos fa kivágását hagyta jóvá az elmúlt években, holott azok megmenthetőek lettek volna.&nbsp; A város fejlesztéseit a fák megóvására tekintettel szabad elvégezni. Emellett hiányzik a fák megfelelő kezelése, pótlása.<br>&nbsp;Jó ideje nem fordít gondot a város az állatkert melletti parkerdő megóvására, a környező területek ápolására, pedig ezek kedvelt kiránduló területei lehetnének a városunkba érkező vendégeknek.&nbsp; A Szövetség a változásért támogatja, hogy ezen a helyen, az állatkert felügyeletével és irányításával ”Zöld Parkerdő” jöjjön létre.&nbsp; Az ide szervezett programok résztvevői nemcsak a környezettudatos önfenntartó modellekkel, szemlélettel, ismerkedhetnének meg, de a helyi természeti, és kulturális értékeinkkel is. <br><br>Kulturális szolgáltatások<br>•&nbsp;&nbsp; &nbsp;Politikamentes városi kultúra<br>•&nbsp;&nbsp; &nbsp;Új szórakozóhelyek<br>•&nbsp;&nbsp; &nbsp;Tradíció és új szellemiség<br>•&nbsp;&nbsp; &nbsp;A Jászsági Rock-fesztivál újraindítása <br><br>A jászberényi fiatalok megtartásának másik kulcskérdése, hogy iskolán kívüli idejükben is jól érezzék magukat a városban. Komplex szórakozási, művelődési tereket kell nyitni a város ifjúsága, különös tekintettel a 14-20 év közötti korosztály számára! Ezekben a terekben otthonra találnának a kulturáltan szórakozni vágyó ifjoncok éppúgy, mint akik egyszerűen csak jól szeretnék érezni magukat, és nincs hová menniük. A Szövetség a változásért megőrzi a város kulturális értékeit, hagyományait, de közben nem zárja ki a másként, és újat is gondolni vágyó szellemiséget! <br>A jászberényi kultúra nem az aktuálisan hatalmon lévő politikai csoportok kiszolgálásának eszköze. Meg kell szüntetni a város vezetőinek kézi irányítását a helyi kultúrában, a rendezvények politikai célú használatát, az erről szóló propagandát.&nbsp; A XXI. század Jászberényében a politikai, ideológiai tartalmakkal átitatott városi nagyrendezvények, presztízsből létrehozott „kulturális események” kora lejárt. A kultúra, miként az oktatás és egészségügy mindenkié, nem sajátíthatja ki egyetlen politikai csoportosulás sem. <br>Jászberény zenei életét sokáig színesítették a különböző amatőr könnyűzenei együttesek. A Jászsági Rock-fesztivál számukra biztosított bemutatkozási lehetőséget. Manapság, a tehetséges zenekarok csak „rock-kocsmákban” tudnak fellépni, amelyeknek városunkban amúgy is korlátozott a nyitvatartási ideje.&nbsp; A Szövetség a változásért összefogás újra indítja a Jászsági Rock-fesztivált.<br><br>Óvodai ellátás, szociális és gyermekjóléti szolgáltatások<br>•&nbsp;&nbsp; &nbsp;A városi óvodák és bölcsőde fejlesztése<br>•&nbsp;&nbsp; &nbsp;Pályázati támogatás az óvónők továbbképzéséhez<br>•&nbsp;&nbsp; &nbsp;Átmeneti gyermekotthon létrehozása<br>•&nbsp;&nbsp; &nbsp;Gyermekétkeztetés támogatása<br>2006 és 2010 között a kormányzat számos jászberényi elképzeléshez nyújtott támogatást. Ilyen volt a központi óvoda is, amelynek a kivitelezése 2010 után fejeződött be. Ám további fejlesztésekre van szükség a városi óvodai intézményeknél, a bölcsődénél, különösen az energiahatékonyság növelése területén. A jászberényi óvónők jól képzettek, de a folyamatos továbbképzésre nekik is szükségük van. A Szövetség a változásért pályázati úton támogatja az óvónők továbbképzését! Régóta tudjuk, hogy szükség van Jászberényben egy átmeneti gyermekotthonra. A városvezetés azonban eddig nem lépett, pedig számos használaton kívül álló ingatlan szolgálhatná ezt a célt. A Szövetség a változásért összefogás támogatja, hogy ez az intézmény mielőbb jöjjön létre. Szomorú tény, hogy a képviselőtestület a gyermekétkeztetéstől vont el forrásokat. A Szövetség a változásért összefogás biztosítja a gyermekétkeztetéshez szükséges önkormányzati támogatást. &nbsp;<br><br>Lakás- és helyiséggazdálkodás <br>•&nbsp;&nbsp; &nbsp;Ingatlanértékesítések felülvizsgálata<br>•&nbsp;&nbsp; &nbsp;Támogatás a fiatal házasoknak<br>•&nbsp;&nbsp; &nbsp;Szociális bérlakások a nagycsaládos alacsony jövedelmű lakosoknak<br>2010-2014 között számos városi ingatlan jogilag aggályos körülmények között került értékesítésre, amelyek nem szolgálták a város érdekét, sőt a hűtlen kezelés gyanúját vetik fel. Ezen ingatlanügyeket felülvizsgáljuk.&nbsp;&nbsp; A Fideszes városvezetés szűkítette a lakástámogatás a szociális bérlakáshoz jutás lehetőségeit. Céljuk a keveseknek adni sokat, ahelyett hogy sokaknak adnának érdemi támogatást. Ráadásul azokat részesítették előnyben, akik támogatták a Fidesz helyi politikáját. A „Szövetség a változásért” összefogás egyenlőbb elosztást valósít meg. Valamennyi jászberényi fiatal házaspár számára kölcsönt és vissza nem térítendő támogatást nyújt a lakáshoz jutásnál azzal a kikötéssel, hogy helyben vállaljanak munkát meghatározott ideig.&nbsp; &nbsp;<br>A Szövetség a változásért összefogás növeli a szociális bérlakás állományt, és olyan bérlői kör számára is elérhetővé teszi, akik szociális alapon még nem jogosultak, de gyermekeik száma ezt indokolttá teszi. <br><br>Sport <br>•&nbsp;&nbsp; &nbsp;„Életmódsportoló” város<br>•&nbsp;&nbsp; &nbsp;A sportturizmus fejlesztése<br>•&nbsp;&nbsp; &nbsp;Regionális sportközpont<br>•&nbsp;&nbsp; &nbsp;Jégcsarnok<br>A város sportstratégája a tömegsportot részesíti előnyben. A városvezetés mégis a versenysportokat támogatja. A Szövetség a változásért átalakítja a helyi sporttámogatási rendszert. A tömegsporton belül azoknak a szervezeteknek ad kiemelt támogatást, akik megfelelő szakmai alapon, a jászberényiek széles körének biztosítják a mozgás lehetőségét, ezzel az egészségük megőrzését, a betegségek megelőzését. Biztató jelenség, hogy egyre többen érkeznek városunkba, az itt szervezett sporteseményekre. Az állatkert és a Csángó fesztivál mellett a sportturizmus lehet az a terület, amellyel városunkba több ezer látogatót lehet vonzani. Szövetség a változásért támogatja azokat a sportrendezvényeket, amelyek vendégeket hoznak Jászberénybe. Támogatja azokat a törekvéseket, amelyek Jászberény regionális sportközponti szerepét erősítik, sportcélú szálláslehetőséget, edzőtábori helyszín kialakítását célozzák.<br>Hiba volt a jégpályát az eredeti, hűtőgépgyári helyszínről elvinni. A főiskola melletti üzemeltetés számos problémát vet fel. Ám ennél is nagyobb probléma, hogy az elmúlt négy évben nem végezték el a jégpálya befedését, holott a tartóelemek rendelkezésre álltak. A késlekedés ártott a szabadban tárolt faelemeknek, élettartamuk csökkent. A jégpálya befedését haladéktalanul be kell fejezni. Biztosítani kell a korszerű működéshez szükséges eszközöket.<br><br>Közbiztonság<br>•&nbsp;&nbsp; &nbsp;Áldozatvédelem – segítség a bűncselekmények sértettjeinek<br>•&nbsp;&nbsp; &nbsp;Ügyeleti szolgálat Jászberényben<br>•&nbsp;&nbsp; &nbsp;A közrendet óvó civil erők támogatása<br>•&nbsp;&nbsp; &nbsp;Közterület-felügyeletet a külvárosba is<br>•&nbsp;&nbsp; &nbsp;Állampolgári panasz ne maradjon válasz nélkül<br>Jászberény bűnügyi fertőzöttsége 2010 után romlott. Növekedett az erőszakos bűncselekmények száma. Csökkent a jászberényiek biztonságérzete. A lakosságtól érkeznek olyan jelzések, hogy a rendőrség passzív, érdektelen a nyomozásban. Ha el is indul egy nyomozati eljárás, a sértettnek legtöbbször esélye sincs arra, hogy az elcsalt, ellopott vagyonát visszaszerezze. <br>Megszűnt az ügyeleti szolgálat a Jászberényi Rendőrkapitányságon. A Szövetség a változásért összefogás kezdeményezi újbóli felállítását. A bűncselekmények kivizsgálása, az elkövető kilétének megállapítása a rendőrhatóság feladata. A közbiztonság viszont közügy, önkormányzatunknak is van dolga benne. Olyan civil erőket kell önkormányzati forrásokból támogatni, amelyek valóságosan és mérhetően óvják a közrendet. A közterület-felügyelet erősítése jó irány, de működését a város külső területeire is ki kell terjeszteni. Egyre gyakoribb eset, hogy egy helyi lakos „segítség kiáltására” nem érkezik válasz. Az önkormányzatnak közre kell működnie abban, hogy a bűncselekménnyel összefüggő állampolgári panaszokra az illetékes hatóságok válaszoljanak. A Szövetség a változásért megvizsgálja, hogy milyen további segítséget nyújthat önkormányzatunk, az áldozatvédelem keretében, a bűncselekmények jászberényi sértettjeinek.<br><br>Neszűr <br>•&nbsp;&nbsp; &nbsp;Szociális térkép<br>•&nbsp;&nbsp; &nbsp;Értelmes mezőgazdasági közmunkaprogram a Neszűrben, geotermikus energia hasznosításával<br>•&nbsp;&nbsp; &nbsp;Buszjáratok sűrítése<br><br>Jászberényben a Neszűr ügyét leegyszerűsítve és tévesen kizárólag cigányügyként kezelik. Politikai haszonszerzés céljából azt állítják, hogy néhány garázdálkodó elfogásával a Neszűr felvirágzik. Ám ez nem igaz. Jelentős előrelépést az önkormányzat hathatós közreműködése nélkül, itt nem lehet elérni. Sajnos Jászberény nem rendelkezik a területet is érintő, aktuális szociális térképpel, amely képet adna az ott élőkről. Ugyanígy nincs világos fejlesztési stratégia sem a Neszűrre. A városvezetés hol területet vásárol, hol területet ad el. A homoktövis telepítése önmagában, nem elégséges. Arra van szükség, hogy értelmes közmunkaprogram keretében a terület mezőgazdasági rehabilitációja megkezdődjön. Az EU támogatásával lehetőséget kell teremteni olyan üvegházak telepítésére, amelyeket a közelben lévő geotermikus energia fűthetne. A Neszűrben lakók nehezen tudnak bejutni a városba. Számukra sűríteni kell a buszjáratokat.&nbsp; A fenti lépések erősítik a Neszűr közbiztonságát, az ott lakók helyes életvitelét, a ténylegesen rászorultak megfelelő támogatását, a munkaképeseknek a munka világába való bekapcsolását.&nbsp;&nbsp; &nbsp;<br><br><br>', '', '', '', '', '2014-03-29 17:09:25', 0),
(11, 0, 62, 'media/62_1395259750_804.jpg', 'Mond Te kit válsztanál?', 'Október 12.-én újra nagy felelősség hárul ránk. El kell döntenünk hogy a következő öt évben ki vezesse Jászberényt.Mi a legjobb döntés? És  miért pont a Szövetség a változásért az?', '', '<br>Alapvetően 3 dolgot kell mérlegelnünk.<br>-Az első és legfontosabb hogy a jelöltek alkalmasak-e a feladat ellátására.Ezzel szerintem eggyik jelölő szervezetnél sincs gond. A jelöltek nagy többsége jól el tudná látni a feladatát. Kérdés hogy mit tekint feladatának, és hogy akarja-e. Ennél a pontnál már a FIDESZ-el szemben erős kételyek merülhetnek fel. Látjuk hogy a parlamentben milyen gombnyomkodó automataként működnek. Ne legyen kétségünk hogy itt is ezt csinálnák illetve eddig is ezt csinálták. Ők elsősorban FIDESZ-esek és csak másodsorban Jászberényiek. Ha nem így lenne nem volnának a FIDESZ jelöltjei.<br>-Milyen a háttér vagyis jelölő szervezetek szakmai támogatása, tapasztalata és hogy mennyire lehet azonosulni a mögötte álló eszmei tartalommal. A háttér támogatást illetően egyértelműen a kis pártok véreznek el, míg az eszmeiséggel sajnos mindenhol gondok vannak. Itt most nem elsősorban a programokra gondolok. ott minden szép és jó, mindenki ponrosan látja kijavítandó hibákat elvégzendő feladatokat. Hanem arra az eszmeiségre ami az őket támogató embereket összeköti. ez teljesen szubjektív döntés. Kinek mi szimpatikus. Nekem személy szerint legnagyobb problémám a kormány pártokkal és a jobbikkal van. <br>-És végül de nem utolsósorban ami ellen nagyon berzenkedek de sajnos nálunk ezt is figyelembe kell venni: milyen eséllyel nyernek. Ez elsősorban a kis pártoknak rossz hír. És nekem sem tetszik , mert hiába lenne jó ha minál több színű lenne a képviselet, sajnos a kis pártokra leadott szavazatt elveszett szavazat. <br><br>', 'vegyes', '', '', '', '2014-09-30 01:10:04', 0),
(13, 0, 62, 'media/62_1395259751_840.jpg', 'A zöld értékek', 'Az ökologikus ''zöld'' gondolkodás nem véletlenül lett a szövetség egyik vezérfonala.\r\nSokan ugyan elég furának és egyfajta elméleti hókuszpókusznak gondolják,de valójában az a fura, hogy úgy viselkedünk, mintha lenne egy másik Föld is,', '', '&nbsp;\r\nahova majd elköltözhetünk ha ezt tönkre tettük.    Ne essünk tévedésbe, nem a Földet kell megmentenünk! Ahogy George\r\n    Carlin mondta: a Föld nagyobb csapást is túlélt már ... Vágjuk ki\r\n    nyugodtan az esőerdőket, néhány tízezer év és újra kinől. Pusztítsuk\r\n    ki a legtöbb fajt, néhány millió év és újak lesznek. A Földnek ez\r\n    semmi! De mi ki tudjuk várni?<br>\r\n    Lehet, hogy egy kicsit erősnek tűnik egy önkormányzati választás\r\n    programjában az esőerdőkért aggódni. Azonban az ökologikus\r\n    gondolkodásban minden mindennel összefügg. <br>\r\n    GONDOLKODJ GLOBÁLISAN, CSELEKEDJ LOKÁLISAN! <br>\r\n    Mit jelent ez Jászberény vonatkozásában? Miért jó nekünk, ha\r\n    próbálunk harmóniában élni a természettel? Nézzük a tényeket:\r\n    Európa, de talán a világ egyik legjobb termőterületén élünk. Olyan\r\n    jászok kulturális örököseiként, akik már kétezer éve fejlett\r\n    mezőgazdasággal rendelkeztek. És a multik által ideszállított\r\n    szemetet esszük? Sokaknak még abból sem jut elég. Termőterületeinket\r\n    monokultúrás nagyipari módszerekkel zsákmányoljuk ki, erdeink már\r\n    csak telepített faültetvények, a kevés megmaradt "vad" területen\r\n    pedig a vadászok tenyésztenek fácánt, őzet és nyulat.Vizeinket\r\n    elmérgezzük, a levegőnk pedig csak azért jó még, mert az iparunk\r\n    haldoklik.<br>\r\n    Ez nemcsak a környezetnek nem jó, de gazdaságilag sem előnyös. A\r\n    monokultúrás növénytermesztés ugyan nagyon hatékony, néhány\r\n    traktorral több ezer hektárt lehet megművelni. Viszont a keletkezett\r\n    profit nagyon kevés embernek jelent megélhetést. A sebezhetőségéről\r\n    nem is beszélve. Egy rosszkor jött esőzés vagy egy aszályos időszak\r\n    tönkreteheti az egész ágazatot. És mi mégis ezt támogatjuk?&nbsp; Ha\r\n    munkaigényesebb termelési módokat (bio, biointenzív,permakultúra\r\n    stb.) és növényeket (zöldségek,gyümölcsök) részesítenénk előnyben,\r\n    nemcsak jóval nagyobb hozzáadott érték keletkezne, hanem sokkal több\r\n    embernek is tudnánk munkát adni . Elsősorban képzetlen vagy alacsony\r\n    képzettségű embereknek, akik most a legnagyobb bajban vannak.\r\n    Persze, akkor szükség lenne feldolgozó üzemekre is. És&nbsp; úgy mondjuk,\r\n    mintha ez baj lenne? Pedig újabb munkalehetőség, újabb profit\r\n    lehetőség... És&nbsp; ezeknek a feldolgozó üzemeknek&nbsp; szüksége van háttér\r\n    iparra is. Újabb lehetőségek... És itt már nemcsak alacsony\r\n    képzettségűeknek... Aztán ezek az ágazatok húznák magukkal a\r\n    kereskedelmet és a szolgáltatásokat is...<br>\r\n    &nbsp;De ne szaladjunk ennyire előre! Nem kell mindjárt a legnagyobb\r\n    falattal kezdeni! Van nekünk egy neszűrünk.<br>\r\n    &nbsp;Csak egy jól működő rendőrőrs kellene oda. Néhány elhivatott,\r\n    hozzáértő ember, akik példát mutatnának, és tanítanának, mert sajnos\r\n    már lassan feledésbe merül az a tudás, ami hajdanán aranybányává\r\n    változtatta ezt a területet. Továbbá kellene még egy közösségi,\r\n    nonprofit piac, természetesen internetes támogatással, és már el is\r\n    indulna valami, ami Jászberényt sokkal élhetőbbé tenné...', 'vegyes', '', '', '', '2014-10-04 11:25:43', 0);
INSERT INTO `cikk` (`id`, `sorrend`, `user_id`, `media`, `cim`, `intro`, `og_intro`, `szoveg`, `kat`, `cimke`, `meta`, `jog`, `datum`, `pub`) VALUES
(14, 5, 62, 'media/62_1396034234_808.jpg', 'Szögek a demokrácia koporsójába', 'Ezt a cikket 2009-ben tettem közzé az azóta megszűnt  virtuson. Sajnos azóta csak aktuálisabb lett. Bár már sokkal mélyebb összefüggéseiben látom a dolgokat, egy általános áttekintésnek még mindig megállja a helyét', '', 'A demokrácia haldoklik. hogy ez a folyamat milyen hosszú és milyen fájdalmas lesz még nem tudni. Ahogy azt sem hogy mi követi majd, vagy hogy egyáltalán követi-e valami. Az azonban egyértelmű hogy az agónia elkezdődött. Nem a kommunizmus vagy a fasizmus pusztítja el. A nagy ellenségeket legyőzte. Hóhérai annak a tőkésosztálynak elkorcsosult utódai lesznek akik az izmusoktól való félelmükben létrehozták és kivirágoztatták.<br><br>De hogy megértsük mi is játszódik le tulajdonképpen, tekintsük át hogyan is jutottunk idáig.<br>Kezdetben vala a káosz és az úr lelke lebegett a vizek felett.....<br>Na jó azért ennyire ne menjünk vissza. Kezdjük ott hogy az ősember első kezdetleges eszközeivel elindult a technika és a társadalom és egyre gyorsuló fejlődése. Míg valamikor a XIX. század végén a XX. század elején egy olyan szintre ért, ami három kedvező gazdasági feltétellel párosulva szédítő távlatokat nyitott emberi civilizációnak.<br>1., A népszaporulat elérte azt a szintet, ahol már milliós nagyságrendű embert lehetett bevonni egy-egy feladat megoldásába. És nemcsak a népesség nőt, hanem a népesség aktív létszáma növekedett. Egyre több lett a megélhetésért mindent bevállaló, tettre kész ember. Még tanulni is hajlandóak voltak. Nem iskolába járni és fölösleges információkkal tömni az agyukat, hanem valóban tanulni. Megtanulták hogyan kell egy vállalkozást hatékonyan működtetni. Hogyan kell a tudomány és a technika eredményeit minél jobban hasznosítani. Sőt, hogyan kell a tudományban és a technikában eredményt elérni. Egyre több és több újítás, találmány és elmélet született , ami újabb fejlődést generált A gazdaságban, a tudományban és a technikában egyre több lett a jól képzett gondolkodó ember. Sőt ezekből az élet más területeire is jutott.<br>2., az olcsó energia a technológiai újításokkal karöltve, lehetővé tette hogy ennek a rengeteg embernek a teljesítménye megsokszorozódjon.<br>3., A kapitalista termelésmód ,a jelenleg egyetlen működő fejlődési módszer az evolúció másolásával, hatékonnyá tette ezt a hatalmas termelési potenciált. A jól működő vállalkozás terjeszkedett a rossz becsődölt. A szabad verseny soha nem látott távlatokat nyitott az emberiség előtt. Ugyanakkor kegyetlenebb volt még az önkényeskedő feudális nagyuraknál is. Irdatlan vagyonok keletkeztek, ugyanakkor soha nem látott nyomor és embertelenség alakult ki a másik oldalon.<br>Akkor még természetes volt, hogy a gondolkodó emberek megpróbálták ezt a problémát is megoldani. A rengeteg elméletből a gyakorlatban végül két kísérlet valósult meg. Mindkettő a kapitalista rendszer rémévé vált. A fasizmus saját csemetéjük volt. Viszonylag gyorsan végeztek vele. És bár ez a győzelem nagy véráldozatokkal járt , mégsem volt annyira félelmetes mint a kommunizmus. A kommunizmus egy olyan periferiális birodalomban alakult ki, ahol a nyugatnak szinte semmi befolyása nem volt. A régi orosz birodalomban gyakorlatilag még feudalizmus volt. Ez sem volt egy leányálom de kiszámítható stabil államformát biztosított polgárai számára, és ami fontos: a nyugatnak igazából nem volt vetélytárs. Azonban a nyugati elméletek és a technológiai fejlődés ezen a táptalajon egy olyan borzalmas államformát eredményezett. Amitől már komolyan megrettentek az akkori világ urai. A kommunizmussal mint külső ellenséggel még fel tudták volna venni a harcot, de a kommunizmus belülről is támadott. A nyomorgó megalázott tömegek alig várták hogy végre eljöjjön az ő idejük. Ők voltak az igazi ellenség. Ahhoz hogy a kommunizmussal szembe tudjanak szállni, ezt a nyomorgó tömeget meg kellett semmisíteni. A fizikai megsemmisítés azon felül hogy reménytelen vállalkozás, még ostobaság is lett volna, hisz saját aranytojást tojó tyúkjaikkal kellett volna végezniük. Ilyen ostobaságot csak néhány nagyon elmaradott ország próbált meg. Oroszország, Kína, kuba és Európa butábbik fele. Köztük mi is. Az okosabbik fele tudta hogy a nyomort csak egyvalamivel lehet megszüntetni: pénzel. Abból meg nekik sok volt. Adtak hát egy kicsit a melósoknak is. És hogy legyen hab a tortán megerősítették a demokratikus intézményrendszereket is. Kialakult az úgynevezett szabad világ. Gondolom az eredeti terv az volt hogy miután legyőzték a kommunizmust folytatódik a szabad rablás. Ez két ok miatt húzódott el. Az egyik hogy a kommunizmust nem volt olyan egyszerű legyőzni. A másik hogy közben rájöttek, hogy a jól megfizetett dolgozó sokkal jobban dolgozik és sokkal nagyobb profitot termel. A nyugati demokrácia virág korát élte. De aztán eljött a XXI. század.....<br><br>Nézzük mi történik most a fejlett demokráciákban:<br><br><br><font color="#0066FF">Első szög a koporsóban:</font><br>A népesség csökken. Ez önmagában nem volna baj, ha nem járna együtt a társadalom elöregedésével. De együtt jár. Ráadásul, hála az orvostudománynak ezeket az öregeket egyre tovább és egyre költségesebben kel eltartani. " Bónuszként" a szaporulat minősége is hagy némi kívánni valót maga után. A környezet szennyezés, a természetellenes életmód , és a szaporodás teljes kontrolálatlansága miatt egyre több a gyenge egészségű esetleg fogyatékokos önálló életre képtelen egyén. Akit nem elég hogy el kell tartani hanem egyre drágábban kell eltartani. Egyre többe kerül az orvosi ellátás, egyre többet kell áldozni az akadálymentesítésre stb..stb. Már önmagában az hogy egyre kevesebb embernek kell egyre többet eltartani, ráadásul egyre drágábban és mindezt egyre csökkenő gazdasági potenciál mellet, szóval ez a lehetetlen helyzet már önmagában is elég volna egy birodalom bukásához. Ráadásul a probléma megoldására rövid távon semmi esély nincs hisz olyan drasztikus sőt embertelen lépéseket kívánna amiket egyetlen törvényhozó sem vállalhat fel. Persze ha a gazdaság úgy megerősödne hogy képes lenne vállalni ezt a terhet..... Vagy ha az ufók segítenének....<br><br><br><font color="#0066FF">A második szög:</font><br><br><br>Az olcsó energia, a kapitalizmus egyik motorja megszűnt. Egyrészt fogynak a készletek. Másrészt akkora pénzek vannak az energia iparban, hogy a legnagyobb pénzügyi cápákat és hiénákat vonzotta magához. Akik sikeresen tornázzák egyre magasabbra és magasabbra az árakat. Minden az olaj és a gáz körül forog. Még a terrorizmus elleni harcok is mindig ott törnek ki ahol olaj van...<br>Ráadásul az állam is rájött, hogy az üzemanyag adóztatása a legtutibb bevételi forma. Mi itt siránkozunk hogy drága benzin, pedig a benzin tulajdonképpen még mindig nem volna drága. Ami igazán drágává teszi az az adó. De tegyük hozzá, ha adó nem volna, a folyamat akkor is feltartóztathatatlan lenne, csak később érne az elviselhetetlen szintre. Elvileg ugyan elképzelhető alternatív energia források kifejlesztése, de a problémát ez sem oldja meg. A cápák és hiénák hadai erre is rátelepszenek majd. Tulajdonképpen ha az energiát ingyen tudnánk előállítani, hozzájutni akkor is csak drágán lehetne.<br><br><br><font color="#0066FF">A harmadik szög</font> tulajdonképpen egy jó hír:<br>A kommunizmus réme megszűnt. Ennek persze örül minden volt kommunista ország, sőt még a nem kommunista múltúak is. De.... és megint jön az a fránya de. De ezzel bebizonyosodott hogy a kapitalizmusnak jelenleg nincs alternatívája. Szemét egy rendszer de nincs jobb. A kapitalisták gyakorlatilag azt csinálnak amit akarnak. És csak egyvalamit akarnak: pénzt. Minél többet minél gyorsabban. Sok pénz gyors csinálására az egyik legősibb módszer, ha elvesszük onnan ahol már van. Nos ahol sok pénz van, az álltában alaposan le is van védve. A tulajdonosa féltve, és hatékonyan őrzi a maga szemét dombját. Egyetlen egy hely van ahol nagy pénz van és nincs kellőn védve, ez pedig a közös, az állam pénze. Az állam rossz gazda. És ezért a rossz gazdaságáért most súlyos árat fizetünk. Elvileg az államnak kellene korlátozni a tőkések pénzéhségét, gyakorlatilag viszont épp most bizonyosodik be hogy az állam erre képtelen. Sőt segédkezik a polgárai kifosztásában. Remek példa erre a mostani válság nyitánya a bankcsőd hullám. A bankok ész nélkül osztogatták a pénzeket, amiből egy csomóan nagyon jól éltek, néhány ember pedig hatalmas vagyonra tett szert. Az ingatlanok ára irreális mértékre nőtt, amiből megint sokan jól megéltek néhányan pedig mocskos módon meggazdagodtak. Aztán mikor összeomlott a rendszer, válásmenedzselés címén állami pénzekből pótolták a hiányt. Ehhez tudni kell hogy az államnak nincs pénze. Amit mi állami pénznek hívunk, azt tulajdonképpen az állam erőfölényével visszaélve, esetenként erőszakkal vette el az állampolgáraitól. Ő ezt úgy hívja hogy adóztatás. Szóval az állami segédlettel, emberektől elvett pénzt, a bankokon keresztül néhány kiválasztott zsebébe szivattyúzták. És ezért a résztvevő politikusokat és gazdasági szakembereket, nem hogy nem húzgálták fel a villanyoszlopokra, hanem hátraveregették, hogy sikeresen megoldották ezt a súlyos válságot. Persze azóta jelentkezett a gazdasági válság is. Mamutcégek amik, eddig bődületes profitot termeltek, most egymást taposva tülekednek az állami pénzekért. Az állam pedig csak fizet... csak fizet... csak fizet.....<br><br><br>Megveszi a<font color="#0066FF"> negyedik szög</font> et a koporsóba:<br>Megszünik a gazdaság evolúciós elven való működése. A szabad világ fejlődésének egyik legfontosabb mozgatórugója volt hogy a jobb maradt talpon. Azért írom hogy volt, mert ma már sajnos nem így van. Ma már a gazdaság. az állami EU-s világbanki stb. pénzek körül forog. Az a jó üzletember aki sok támogatást vagy sok állami megrendelést tud szerezni. Egyiknek sem feltétele a hatékony működés. Kiköhögik aki arra alapoz egy vállalkozást, hogy olcsóbban gyorsabban jobb minőségben dolgozik a versenytársainál. Nem azok gazdagok akiknek a klasszikus kapitalizmusban gazdagoknak kéne lennie. Én ismerek nem egy milliárdos cégtulajdonost aki normális gazdaságban még portásnak sem kerülhetne be azokhoz a cégekhez amiknek most tulajdonosa, és ami még csúfosabb ügyvezető igazgatója. De nem akarok túlzottan elmenni a helyi jelenségek felé ez megér egy külön esettanulmányt. Ugyanis általános jelenségről van szó. A világ kasztosodik. A gazdasági és a politikai elit megtalálta a módját hogy bebetonozza magát sőt még az utódait is a hatalomba és ezzel együtt a gazdagságba. Persze még nem teljes a folyamat. Még előfordulhat hogy valaki tehetséges szorgalmas meg egy kis szerencséje is van és a nulláról indulva a csúcsra jut. De az esélye egyre kevesebb. Amerikában egyenlőre egy kicsit több, nyugateurópában egy kicsit kevesebb, Magyarországon a nullához közelít. Mi élharcosai vagyunk ennek a folyamatnak. Meg is látszik a gazdaságunkon...<br>Ez a bürokrácián és jogi kiskapukon nevelkedett vezetői réteg egyvalamihez ért nagyon, a többi ember ellehetetlenítéséhez. Hogy akinek nincs semmije annak ne is lehessen. Ne veszélyeztesse senki az ő pozíciójukat. Körülbástyázzák magukat értelmetlen logikátlan Túlbonyolított és jórészt fölösleges jogszabályokkal. amiket csak az ő ügyvédjeik képesek átlátni. Számtalan engedélyező, ellenőrző és minősítő intézetet hoznak létre melyeknek egy funkciója működik jól: a kezdő vállalkozó ellehetetlenítése. Olyan korrupción alapuló kapcsolati rendszert alakítanak ki amelybe az újaknak beépülni szinte lehetetlen. Ehhez a részhez nagyon értenek.<br>Amihez nem értenek az a gazdaság. A legegyszerűbb törvényszerűségeket sem ismerik.<br>Hiába bizonyosodott be hogy a jól fizetett alkalmazott sokkal jobban dolgozik, és sokkal több profitot termel, ez valahogy olyan virtuális, több lépcsős dolog nekik. Ami biztos, az az hogy amit nem fizet ki a dolgozóinak az megmarad neki. Aztán a megspórolt pénzt aranyba műtárgyba ingatlanba fekteti tehát kivonja a gazdaságból. Konkrétan a fizetőképes keresletet csökkenti. A dolgozó ugyanis nemcsak költség hanem a másik oldalról fogyasztó is. aztán kereslet hiányában csökkenteni kell a termelést. Ami profit csökkenést eredményez. Ezt persze valamivel ellensúlyozni kell. A legegyszerűbb módszer a bérek csökkentése. És már benne is vagyunk az ördögi körben.<br><br><br>Szóval a hagyományos demokrácia négy olyan súlyos válsággal néz szembe amiből egy is elég lenne hogy padlóra vigye. Az olyan könnyen megoldható problémák mint a környezetszennyezés már említést sem érdemelnek. A helyzet azért is reménytelen mert a hagyományos demokráciák híresen rossz válság megoldók.<br><br><br>Tulajdonképpen a válságmegoldási stratégiájuk kimerül a különféle pénzek szétosztogatásában.<br><br><br>Ezzel ideig óráig lehet is orvosolni a bajokat. Különösen ha van mit szétosztani. A baj ott kezdődik ha nincs. És nemsokára nem lesz. A fent felsorolt négy ok ezt garantáltan rövid időn belül elintézi. Pénz nélkül pedig jönnek a zavargások, kijárási tilalmak, válságkormányok, országmegmentők. Észbe sem kapunk és már újra diktatúrában élünk. Alapvető tévedés azt hinni hogy a jólét a demokrácia miatt van. A demokrácia egy lehetséges következménye és nem oka a jólétnek. Tulajdonképpen csak addig van míg a valódi döntés hozók úgy akarják hogy legyen. Félreértés ne essék, látszat demokrácia mint nálunk vagy oroszországban van, még nagyon sokáig lehet. A hatalom valódi gyakorlóit egyáltalán nem zavarja hogy a sok birka négyévenként választ magának egy kolomprázót.', 'vegyes', '', '', '', '2014-10-04 12:04:07', 0),
(15, 0, 62, 'media/62_1412417717_102.jpg', 'Újdemokrácia: Elektronikus mandátumrendszer', 'Ez szintén egy régi cikkem. 2006-ban publikáltam először, az alapelvek azóta sem sokat változtak.', '', 'A négyévenkénti választás bár harmatgyenge eszköz a politikai elit kordában tartására, mégis szinte élhető világot volt képes teremteni. Nem kellene továbbfejleszteni?<br><br>A jelenlegi demokrácia alapelvei jók, csak a választó polgárok kezében lévő érdekérvényesítő, és felügyeleti eszközök nagyon primitívek. Ez persze érthető, hiszen amikor ez a típusú demokrácia kialakult, még csak a papír alapú ügyrendeket ismerték. Ma a számítógépes hálózatok lehetőséget kínálnak, egy olyan rendszer kialakítására, melyben az állam valóban szolgálja az embereket ,és nem uralkodik rajtuk. A választók munkaadóik a képviselőiknek és nem eltartóik. Munkaadóként egyértelmű feladatokat tudnak számukra meghatározni, és azt bármikor számon is kérhetik. Dönthetnek fizetésükről, és alkalmazási feltételeikről egyaránt. Egy ilyen rendszernek a működtetése, még akár húsz évvel ezelőtt is elképzelhetetlen lett volna. Ma az adóbázis kezelő alkalmazások már biztonságosan képesek nyilvántartani az összes szükséges adatot. Ki tudják szűrni a visszaéléseket és szabályozni tudják a különféle jogosultságokat. Ha valakinek kétsége lenne hogy erre képesek, az gondoljon a banki rendszerekre. Ezek után, szinte nevetségesnek tűnik, hogy mi még mindig cetliket tologatunk, és x-ekkel nyilvánítunk akaratot.<br>Négyévente egyszer.<br>Egyetlen igen behatárolt kérdésben.<br>Szóval ideje továbblépni. Az elképzelésem a következő:<br><br>1 Az állampolgárok a hatalmat elektronikus mandátumrendszerben is gyakorolhatják. Közvetlenül vagy képviselőik utján tetszésük szerint. Aki idegenkedik a számítóképektől, vagy a rendszer kezelésekor agyi akadályokba ütközik, az hagyományos papír alapú megbízást is adhat a mandátumai kezelésére. Például rábízza kedvenc pártjára, így részéről marad minden a régiben. Olyan mintha rájuk szavazott volna. Sajnos így nem tudja kihasználni a rendszer nagyfokú rugalmasságát. Például nem tud közvetlenül részt venni a törvényalkotásban. Nehézkesebb a mandátum átruházás stb.<br><br>2 Minden választó polgárnak adott számú mandátuma van( mindenkinek ugyanannyi) amit felhasználhat ő vagy átruházhat másra.(Képviselői rendszer).Az átruházott mandátumot bármikor vissza lehet vonni, és másra átruházni.<br><br>3 Bárki átruházhatja bárkire a mandátumát.Magánszemélyre vagy szervezetre egyaránt.<br><br>4 Az átruházás lehet teljes jogú, tehát a mandátumot bármire használhatja a képviselő, vagy korlátozott: csak bizonyos célra használható.Például gazdasági téren teljesen megbízunk a képviselőben de külpolitikai kérdésekben nem. A feltételeket a mandátum átadásakor rögzíteni kell.A rendelkezésre álló mandátum számot havonta egyszer állapítják meg.<br><br>5 Bárki benyújthat törvényjavaslatot vagy törvény módosítási javaslatot amit az álltala birtokolt mandátumokkal támogathat. A képviselők a rájuk bízott mandátumokkal is.<br><br>6 Bárki támogathatja bármelyik törvényjavaslatot a mandátumaival.<br><br>7 Mindig a legtöbb mandátummal támogatott törvényjavaslat kerül a törvényhozás elé.<br><br>8 A törvényhozás elé került törvényjavaslatot legalább két szakértői bizottságnak kell véleményezni, hatáselemzést,és ha kell módosító indítványt tenni.Szakértői bizottságot bárki jelölhet de javadalmazást csak a legjobbak kaphatnak.A szakértői bizottságok munkájának minősítésére olyan rendszert kell kidolgozni melynek meghatározó tényezője a választópolgárok véleménye, elégedettsége.A minősítést nyilvánossá kell tenni az elektronikus mandátumrendszeren keresztül, és a bizottság tiszteletdíját ez alapján kell megállapítani. Nyilvánosnak kell lenni annak is, hogy kik és milyen indokkal jelölték a szakértői bizottságot,illetve annak tagjait.<br><br>9 A parlamentbe a legtöbb mandátumokkal rendelkező emberek kerülnek be. Ők az országgyűlési képviselők.Fizetést az általuk birtokolt mandátumok alapján kapnak.Ők látják el az országgyűlés egyéb feladatait és gyakorolják az országgyűlés egyéb jogait.Közérdeklődés hiányában ők szavaznak a törvényjavaslatokról.és módosító indítványokról.Őket illeti meg a kormányalakítás joga.A legtöbb mandátummal rendelkező ember vállaszthat először tisztséget majd utána mandátumszám szerint a többiek.<br><br>10 A törvényjavaslatokról bárki szavazhat az elektronikus mandátumrendszeren keresztül az általa birtokolt. Mandátumok számának megfelelő szavazattal.<br><br>11 Bárki kaphat fizetést az általa birtokolt mandátumok arányában bizonyos mandátumszám felett.(Főállású képviselő)<br>Hogy egy mandátumért mennyit azt törvényben kell rögzíteni.<br><br>12 Minden képviselő minden döntését és a hozzájuk kapcsolódó magyarázatot elképzeléseit a további munkáról valamint a rájuk bízott mandátumok tulajdonosainak értékelését a munkájáról.Köteles nyilvánossá és bárki számára elérhetővé tenni az elektronikus mandátum rendszeren keresztül.', 'vegyes', '', '', '', '2014-10-04 12:25:10', 0);
INSERT INTO `cikk` (`id`, `sorrend`, `user_id`, `media`, `cim`, `intro`, `og_intro`, `szoveg`, `kat`, `cimke`, `meta`, `jog`, `datum`, `pub`) VALUES
(16, 0, 62, 'media/62_1412417722_248.jpg', ' Zöld fenntarthatóság gazdasági programja', 'Reisz Tamás barátom írása.', '', '<p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">1. </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Fenntartható „fejlődés”</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A\r\n szociális és a környezeti problémák fontosságának, e problémák, illetve\r\n megoldási lehetőségeik és a gazdasági fejlődés közötti sokrétű \r\nösszefüggések felismerésével egyre inkább teret nyertek azok a nézetek, \r\namelyek szerint e három területet együtt kell vizsgálni, s sajátosan a \r\nkörnyezet és fejlesztés kérdéseinek együttes megközelítése szükséges. </span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A\r\n nyolcvanas évek elején jelent meg a "fenntarthatóság" vagy a \r\n"fenntartható fejlődés" kifejezés a nemzetközi szakirodalomban. \r\nÁltalános ismertségét </span><span style="font-family:Calibri; font-size:11pt">Lester</span><span style="font-family:Calibri; font-size:11pt">\r\n R. Brown a fenntartható társadalom kialakításával foglalkozó műve \r\nváltotta ki, amely 1981-ben jelent meg. A szerző összekapcsolta a \r\nnépesség növekedését a természeti erőforrások hasznosításával és mindezt\r\n úgy kívánta megoldani, hogy a lehető legkisebb legyen a természeti \r\nkörnyezet mennyiségi és minőségi romlása.</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">1983-ban az ENSZ Közgyűlés határozata alapján megkezdte munkáját az ENSZ Környezet és Fejlődés Világbizottsága, amelyet </span><span style="font-family:Calibri; font-size:11pt">Gro</span><span style="font-family:Calibri; font-size:11pt"> Harlem </span><span style="font-family:Calibri; font-size:11pt">Brundtland</span><span style="font-family:Calibri; font-size:11pt"> norvég miniszterelnöknő vezetett. (E huszonkét tagú bizottságnak tagja volt Láng István akadémikus is.) A Bizottság </span><span style="font-family:Calibri; font-size:11pt">1987-ben ,</span><span style="font-family:Calibri; font-size:11pt">,Közös\r\n jövőnk'''' címmel kiadott jelentésében a gazdasági növekedés olyan új \r\nkorszakának lehetőségét vázolta fel, amely a fenntartható fejlődés \r\nglobális megvalósítására épít, megőrzi a természeti erőforrásokat, s \r\namely megoldás lehetne a fejlődő országok nagy részében elhatalmasodó \r\nszegénység leküzdésére is. </span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A jelentés nagyon röviden és tömören határozta meg a fenntartható fejlődés fogalmát: </span><span style="font-family:Calibri; font-size:11pt; font-style:italic; font-weight:bold">"a\r\n fenntartható fejlődés olyan fejlődés, amely kielégíti a jelen \r\nszükségleteit, anélkül, hogy veszélyeztetné a jövő nemzedékek esélyét \r\narra, hogy ők is kielégíthessék szükségleteiket".</span><br><span style="font-family:Calibri; font-size:11pt">A\r\n fenntartható fejlődés három alappilléren nyugszik: a szociális, a \r\ngazdasági és a környezeti és mindhármat együttesen, kölcsönhatásaik \r\nfigyelembevételével mérlegelni kell a különböző fejlesztési stratégiák, \r\nprogramok kidolgozása során, illetve a konkrét intézkedésekben, \r\ncselekvésekben. A fenntartható fejlődés, mint általános stratégiai cél \r\n"bevonult" a nemzetközi konferenciák, szervezetek dokumentumaiba és a \r\nnemzeti kormányok cselekvési programjaiba.</span><br><span style="font-family:Calibri; font-size:11pt">A fenntartható fejlődés fogalmáról, lényegéről számos elemzés, vitairat látott napvilágot. Herman </span><span style="font-family:Calibri; font-size:11pt">Daly</span><span style="font-family:Calibri; font-size:11pt"> megfogalmazása szerint </span><span style="font-family:Calibri; font-size:11pt; font-style:italic; font-weight:bold">"a\r\n fenntartható fejlődés a folytonos szociális jólét elérése, anélkül, \r\nhogy az ökológiai eltartó-képességet meghaladó módon növekednénk". </span><br><span style="font-family:Calibri; font-size:11pt">A\r\n fejlődés alapvető célja tehát a szociális jólét, a méltányos \r\néletfeltételek lehetőségének biztosítása mindenki és egyaránt a \r\njelenlegi és a jövőbeli nemzedékek számára, ami csak úgy lehetséges, ha \r\nközben fenntartható módon hasznosítjuk a természeti erőforrásokat, \r\nelkerüljük a káros hatásokat, s különösen a környezet állapotában \r\nbekövetkező visszafordíthatatlan változásokat.</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A Világ Tudományos Akadémiáinak Nyilatkozata megfogalmazásában: </span><span style="font-family:Calibri; font-size:11pt; font-style:italic; font-weight:bold">"A\r\n fenntarthatóság az emberiség jelen szükségleteinek kielégítése, a \r\nkörnyezet és a természeti erőforrások jövő generációk számára történő \r\nmegőrzésével egyidejűleg." </span><span style="font-family:Calibri; font-size:11pt">(Átmenet a fenntarthatóság felé; Világ Tudományos Akadémiáinak Nyilatkozata, Tokió, 2000).</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt"><img style="max-height:500px; max-width:500px; margin:20px;" src="/media/62_1412426470_848.png" align="left"></span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:5pt 0pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline"><br></span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline"><br></span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">Helyi szintre lebontva</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">:</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">Egy olyan </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">zöld </span><span style="font-family:Calibri; font-size:14pt; font-weight:bold">oktatási, nevelési, sport és </span><span style="font-family:Calibri; font-size:14pt; font-weight:bold">tudás</span><span style="font-family:Calibri; font-size:14pt; font-weight:bold"> </span><span style="font-family:Calibri; font-size:14pt; font-weight:bold">központ</span><span style="font-family:Calibri; font-size:14pt; font-weight:bold"> </span><span style="background-color:#00ff00; font-family:Calibri; font-size:11pt">(kultúra)</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> létrehozása</span><span style="font-family:Calibri; font-size:11pt"> ahol a </span><span style="font-family:Calibri; font-size:11pt">megúju</span><span style="font-family:Calibri; font-size:11pt">ló energiák, az újra hasznosított elemek </span><span style="font-family:Calibri; font-size:11pt">helyet kapnak.&nbsp; E</span><span style="font-family:Calibri; font-size:11pt">zzel egyidejűleg (akár helyileg is) </span><span style="font-family:Calibri; font-size:11pt">egy olyan új </span><span style="font-family:Calibri; font-size:11pt">„</span><span style="font-family:Calibri; font-size:11pt; font-style:italic">zöld, fenntartható, megújuló</span><span style="font-family:Calibri; font-size:11pt">” </span><span style="font-family:Calibri; font-size:14pt; font-weight:bold">„szilícium” völgy</span><span style="font-family:Calibri; font-size:14pt; font-weight:bold"> </span><span style="background-color:#00ff00; font-family:Calibri; font-size:11pt">(zöld ipar)</span><span style="font-family:Calibri; font-size:11pt"> kialakítása</span><span style="font-family:Calibri; font-size:11pt"> Jászerényben</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">(K</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">+F, műszaki termelő tevékenység, oktatás, képzés, konferenciák szervezése),</span><span style="font-family:Calibri; font-size:11pt"> amit Európa is meg fog irigyelni.&nbsp; Maga az épület </span><span style="font-family:Calibri; font-size:11pt">megépítése, </span><span style="font-family:Calibri; font-size:11pt">kialakítása is a lehető legki</span><span style="font-family:Calibri; font-size:11pt">sebb környezeti terhelés jelentse</span><span style="font-family:Calibri; font-size:11pt"> a környezetre.</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Megvalósíthatóság:</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">Részvevők, szereplők:</span></p><ul style="margin:0pt; padding-left:0pt" type="disc"><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Ennek megvalósítása során elsődlegesen a helyi és környékbeli kis – és közepes vállalkozókra fogunk számítani</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> (megnéznénk, ki mit tud bele adni)</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">, és csak ezután, illetve a feladat nehézségétől függően nagyobb hazai vagy nemzetközi cégekre. </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Magában a zöld ipari parkban, pedig </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">elsősorban </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">a hazai </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">kis és közepes </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">szektornak adnánk teret (akár átképzéssel is</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">,</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> ha szükséges)</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">. </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">A nagyokat nem kizárva, de semmiképp sem előrébb tolva.</span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">A helyi nagyvállalkozókat a szükség erejéig (és „teljes” felügyelet alatt, extra kiváltságok mellőzése mellett) vonnánk csak be</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">pl</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">: kivitelezés stb.. </span></li></ul><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">Pénzügyi nagyságrend: </span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">Az épület nagyságától, a területtől a felhasznált anyagoktól stb.. </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">függően 5 – 10 </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">milliárd forint között</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">.</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Megtérülési idő 10 – 15 év (hosszú távú)</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">Pénzügyi forrás:</span></p><ul style="margin:0pt; padding-left:0pt" type="disc"><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Város saját forrásai átcsoportosítással. </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">A város polgárai </span><span style="font-family:Calibri; font-size:11pt">pl</span><span style="font-family:Calibri; font-size:11pt">: „zöld” részvény.</span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Az Európai Unió közvetlenül lehívható pénzügyi forrásai a zöld kutatás - fejlesztés és innovációs alapból</span><span style="font-family:Calibri; font-size:11pt">.</span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Esetlegesen (ha és amennyiben szükséges) hazai és/vagy külföldi befektetők bevonása</span><span style="font-family:Calibri; font-size:11pt">.</span></li></ul><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">Akkor már mindehhez kapcsolódik a </span><span style="background-color:#00ff00; font-family:Calibri; font-size:11pt">sport és a turizmus.</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Wingdings; font-size:11pt"></span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Turisztikai </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Desztináció</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> Menedzsment</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A turisztikai termékeit és egyéb szolgáltatásait</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">egységesen</span><span style="font-family:Calibri; font-size:11pt">, komplex módon kezelő partnerek: vállalkozások, szakmai és civil szervezetek, </span><span style="font-family:Calibri; font-size:11pt">önkormányzat (</span><span style="font-family:Calibri; font-size:11pt">ok) hosszú távú, szervezett együttműködésben végzett tevékenységeinek összességét jelenti, melyeket annak érdekében fejtenek </span><span style="font-family:Calibri; font-size:11pt">ki</span><span style="font-family:Calibri; font-size:11pt">, </span><span style="font-family:Calibri; font-size:11pt">hogy</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">minél</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">vonzóbbá</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">tegyék</span><span style="font-family:Calibri; font-size:11pt">,</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">az</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">adott</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">földrajzi</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">fogadóte</span><span style="font-family:Calibri; font-size:11pt">rületet</span><span style="font-family:Calibri; font-size:11pt"> (</span><span style="font-family:Calibri; font-size:11pt">esetünkben</span><span style="font-family:Calibri; font-size:11pt"> a </span><span style="font-family:Calibri; font-size:11pt">Jászság</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">térségét</span><span style="font-family:Calibri; font-size:11pt">) a </span><span style="font-family:Calibri; font-size:11pt">vendégek</span><span style="font-family:Calibri; font-size:11pt"> (</span><span style="font-family:Calibri; font-size:11pt">látogatók</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">és</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">turisták</span><span style="font-family:Calibri; font-size:11pt">) </span><span style="font-family:Calibri; font-size:11pt">számára</span><span style="font-family:Calibri; font-size:11pt">.</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">A TDM szervezet</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">, </span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">az</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline"> </span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">alábbiak érdekében</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline"> </span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">kell</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">, hogy</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline"> tevékenykedjen</span><span style="font-family:Calibri; font-size:11pt; text-decoration:underline">:</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> vendégek számára ismertté és vonzóvá tegye a térséget,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> vendégek kellemes és hasznos élményekhez jussanak és tartózkodásukkal legyen elégedett,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> desztináció gazdasága fejlődjön,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> helyi közösség és kultúrája gazdagodjon,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> természetes és épített környezet részesüljön védelemben,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> helyi kultúra és hagyomány tovább éljen.</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> helyi közösség és kultúrája gazdagodjon,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> természetes és épített környezet részesüljön védelemben,</span></p><p style="margin:5pt 0pt"><span style="font-family:Calibri; font-size:11pt">•</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt">&nbsp;</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> helyi kultúra és hagyomány tovább éljen.</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">Jászberényi</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">„</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Green</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">”</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> Parknak lehetőséget kell biztosítania</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">arra, hogy programok résztvevői megismerkedhessenek </span><span style="font-family:Calibri; font-size:11pt">olyan </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">racionális környezettudatos önfenntartó modell</span><span style="font-family:Calibri; font-size:11pt">ekkel, </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">szemlélett</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">el, helyi természeti, és kulturális értékekkel</span><span style="font-family:Calibri; font-size:11pt">, amelyeket demonstráló jelleggel</span><span style="font-family:Calibri; font-size:11pt">,</span><span style="font-family:Calibri; font-size:11pt"> komplex szemléletformáló kampányokkal, kiállításokkal és előadásokkal tennénk értelmezhetővé</span><span style="font-family:Calibri; font-size:11pt"> a fenntarthatóságot</span><span style="font-family:Calibri; font-size:11pt">.</span><span style="font-family:Calibri; font-size:11pt"> </span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">Fenntartható Mezőgazdaság</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline"> </span><span style="background-color:#00ff00; font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">(zöld mezőgazdaság)</span><span style="background-color:#00ff00; font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">:</span></p><h2 style="background-color:#fafafa; font-weight:normal; margin:12pt 0pt 0pt; page-break-after:avoid"><span style="color:#333333; font-family:inherit; font-size:11pt">A fenntartható mezőgazdaság fogalma</span></h2><p style="background-color:#fafafa; margin:5pt 0pt; text-align:justify"><span style="color:#333333; font-family:Calibri; font-size:11pt">1.) </span><span style="color:#333333; font-family:Calibri; font-size:11pt; font-style:italic">A fenntartható fejlődés része, melyen olyan növénytermesztési és állattenyésztési gyakorlatot értünk, amely: </span></p><ul style="margin:0pt; padding-left:0pt" type="circle"><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">kielégíti az emberiség egészséges élelmiszer- és rostigényét,</span></li><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">megőrzi és növeli a környezet minőségét és a természeti erőforrásokat (talaj, víz, levegő),</span></li><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">hatékonyan\r\n és takarékosan használja a lassan megújuló energiaforrásokat (szén, \r\nolaj, gáz), ahol lehet, helyettesíti ezeket gyorsan megújítható és \r\ntermészeti energiákkal (biomassza, szél, napenergiák),</span></li><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">hasznosítja a farmon belüli erőforrásokat és természetes biológiai folyamatokat,</span></li><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">biztosítja a gazdálkodás gazdaságosságát,</span></li><li style="background-color:#fafafa; font-family:serif; font-size:11pt; margin:12pt 0pt 12pt 17.6pt; padding-left:6.4pt; text-indent:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">növeli a mezőgazdaságban dolgozók és a vidéki társadalom életminőségét. (Forrás: </span><a href="http://www.efgabi.extra.hu/6.felev/nov.term.szak/fenntart_mg.ppt."><span style="color:#0000ff; font-family:Calibri; font-size:11pt; text-decoration:underline">efgabi.extra.hu</span></a><span style="color:#333333; font-family:Calibri; font-size:11pt">)</span></li></ul><p style="background-color:#fafafa; margin:0pt"><span style="color:#333333; font-family:Calibri; font-size:11pt">2.) A mezőgazdaságban a</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">fenntarthatóság több termést</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">jelent kisebb földterületen, kevesebb víz és energia felhasználásával, a</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">gazdálkodás jövedelmezőségének megtartása mellett</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">– gondot fordítva a</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">környezet védelmére és</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">teljesítve a társadalom</span><span style="color:#333333; font-family:Calibri; font-size:11pt">&nbsp;</span><span style="color:#333333; font-family:Calibri; font-size:11pt">elvárásait. (Forrás: </span><a href="http://www.magyarmezogazdasaglap.hu/fenntarthato_mezogazdasag"><span style="color:#0000ff; font-family:Calibri; font-size:11pt; text-decoration:underline">Magyar Mezőgazdaság</span></a><span style="color:#333333; font-family:Calibri; font-size:11pt">) </span></p><p style="background-color:#fafafa; margin:5pt 0pt; text-align:justify"><span style="color:#333333; font-family:Calibri; font-size:11pt">3.)\r\n A természeti és a környezeti szempontok fontosságát előtérbe helyező, \r\nholisztikus szemléletű mezőgazdaság. A környezeti, társadalmi, gazdasági\r\n érdekeket egyforma súllyal mérlegeli. A fenntartható mezőgazdaság a \r\ntermészetes környezet meglévő erőforrásaira épít. (Forrás: </span><a href="http://www.agroinform.com/tags/fenntarthat%C3%B3%20mez%C5%91gazdas%C3%A1g"><span style="color:#0000ff; font-family:Calibri; font-size:11pt; text-decoration:underline">Agroinform</span></a><span style="color:#333333; font-family:Calibri; font-size:11pt">)</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:14pt; font-weight:bold; text-decoration:underline">Ki</span><span style="font-family:Calibri; font-size:14pt; font-weight:bold; text-decoration:underline">skert modell:</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">A</span><span style="font-family:Calibri; font-size:11pt"> kis</span><span style="font-family:Calibri; font-size:11pt">kert</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">modell alapvető stratégiai</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">célja</span><span style="font-family:Calibri; font-size:11pt"> a </span><span style="font-family:Calibri; font-size:11pt">Magyar</span><span style="font-family:Calibri; font-size:11pt"> emberek</span><span style="font-family:Calibri; font-size:11pt"> egészséges</span><span style="font-family:Calibri; font-size:11pt"> élelmiszerellátásának fenntartható módszerekkel</span><span style="font-family:Calibri; font-size:11pt">\r\n történő ellátása, a vidéki foglalkoztatottság problémáinak a megoldása,\r\n a városból kiábrándult fiatalok vidéken történő letelepedésének \r\nelősegítése, </span><span style="font-family:Calibri; font-size:11pt">a szabad művelhető kis kertek </span><span style="font-family:Calibri; font-size:11pt">az önfenntartó családi gazdaságok</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">és az élelmiszertermelő mikro gazdaságok létrehozásának megszervezése, </span><span style="font-family:Calibri; font-size:11pt">továbbképzése </span><span style="font-family:Calibri; font-size:11pt">és támogatása</span><span style="font-family:Calibri; font-size:11pt">, </span><span style="font-family:Calibri; font-size:11pt">érdekeiket</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">összefog</span><span style="font-family:Calibri; font-size:11pt">va</span><span style="font-family:Calibri; font-size:11pt">&nbsp; az</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">alapanyagok </span><span style="font-family:Calibri; font-size:11pt">termesztésére </span><span style="font-family:Calibri; font-size:11pt">feldolgozására, a termékek közös forgalmazására</span><span style="font-family:Calibri; font-size:11pt"> regionális szintekre osztva</span><span style="font-family:Calibri; font-size:11pt">. </span><span style="font-family:Calibri; font-size:11pt">AZ</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">értékesítési</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">csatornák</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">közül</span><span style="font-family:Calibri; font-size:11pt"> a</span><span style="font-family:Calibri; font-size:11pt"> kis termelő szövetkezeti helyi piac pontok kialakítása</span><span style="font-family:Calibri; font-size:11pt">,</span><span style="font-family:Calibri; font-size:11pt"> amely a </span><span style="font-family:Calibri; font-size:11pt">k</span><span style="font-family:Calibri; font-size:11pt">iváló</span><span style="font-family:Calibri; font-size:11pt"> minőségű</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">ökotermékek</span><span style="font-family:Calibri; font-size:11pt">\r\n forgalmazására nyújt lehetőséget teljes szezonális választékot \r\nbiztosítva a vásárlónak a pontosan kialakítható saját piaci felvétel \r\nrendszerében, </span><span style="font-family:Calibri; font-size:11pt">amely</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">országos</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">összefogás</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">esetén</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">nemzetközi</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">hálózattá</span><span style="font-family:Calibri; font-size:11pt"> is fejleszthető</span><span style="font-family:Calibri; font-size:11pt">.</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Projekt célja:</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">1.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Biztosítani</span><span style="font-family:Calibri; font-size:11pt"> a termelői és fogyasztói közösség számára </span><span style="font-family:Calibri; font-size:11pt">a helyi termesztésű</span><span style="font-family:Calibri; font-size:11pt"> bioélelmiszerek előnyeit</span><span style="font-family:Calibri; font-size:11pt">,</span><span style="font-family:Calibri; font-size:11pt"> és segít</span><span style="font-family:Calibri; font-size:11pt">eni</span><span style="font-family:Calibri; font-size:11pt"> annak </span><span style="font-family:Calibri; font-size:11pt">előállításában\r\n elméleti és gyakorlati képzések megszervezésével a tájba illő módon \r\nkialakított tankgazdaságokban és létesítményekben. </span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">2.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Élelmiszerrendszer\r\n és elektronikus tervező program létrehozása, amely az \r\nélelmiszerelőállítás teljes folyamatát és a felhasznált erőforrásokat \r\nfigyelemmel kiséri az élelmiszer</span><span style="font-family:Calibri; font-size:11pt"> megtermelésétől kezdve, annak </span><span style="font-family:Calibri; font-size:11pt">csomagolásán és szállításán keresztül beleértve a vásárlási, ételkészítési és fogyasztási módszereket is. </span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">1.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Megőrz</span><span style="font-family:Calibri; font-size:11pt">ni</span><span style="font-family:Calibri; font-size:11pt"> a talaj termőképességét és nem szennye</span><span style="font-family:Calibri; font-size:11pt">zni</span><span style="font-family:Calibri; font-size:11pt"> a</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">felszín alatti vízkészleteinket.</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">2.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Megőrz</span><span style="font-family:Calibri; font-size:11pt">ni </span><span style="font-family:Calibri; font-size:11pt">a</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">növénytermesztés</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">és</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">az</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">állattenyésztés</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">genetikai erőforrásait</span><span style="font-family:Calibri; font-size:11pt">, elősegítve a tájfajta és táhonos egyedek elterjedését</span><span style="font-family:Calibri; font-size:11pt">.</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">3.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Elősegít</span><span style="font-family:Calibri; font-size:11pt">eni</span><span style="font-family:Calibri; font-size:11pt"> a biológiai sokféleség és a biodiverzitás fenntartását.</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">4.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Elő állítani a h</span><span style="font-family:Calibri; font-size:11pt">umán táplálkozási lánc valamennyi szereplője számára az élő szervezetet nem károsító és megfelelő beltartalmi értékű termékeket</span><span style="font-family:Calibri; font-size:11pt">.</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">5.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">A vidéki népesség számára minél szélesebb körben biztosít</span><span style="font-family:Calibri; font-size:11pt">ani</span><span style="font-family:Calibri; font-size:11pt"> munkaalkalmat és meglehetést,</span><span style="font-family:Calibri; font-size:11pt"> </span><span style="font-family:Calibri; font-size:11pt">a termelés gazdaságosságának folyamatos fenntartásával.</span></p><p style="margin:0pt 0pt 10pt 36pt; text-align:justify; text-indent:-18pt"><span style="font-family:''Times New Roman''; font-size:11pt">6.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Támogatni a helyi élelmiszerrendszereket:</span></p><ul style="margin:0pt; padding-left:0pt" type="disc"><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Termel</span><span style="font-family:Calibri; font-size:11pt">ői piac </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Friss termék, zöldség- és gyümölcspiac </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Gazdasági bolt </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Mozgóboltok </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Bioélelmiszert árusító boltok</span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Helyi zöldséges boltok </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Dobozrendszer </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Fogyasztói társulás/szövetkezet </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Termelői társulás/szövetkezet </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Termelő-fogyasztó hálózat&nbsp; </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Fogyasztó által támogatott mezőgazdálkodás (CSA)&nbsp; </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Szedd magad </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Termeszd magad </span></li><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 44.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt">Helyi élelmiszerrendszerek összekötő szervezetei</span></li></ul><p style="margin:0pt 0pt 10pt 18pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">(A felsorolt lehetőségek vegyesek: egyrészt a bioélelmiszerek helyi piaci értékesítését, másrészt a helyi</span><span style="font-family:Calibri; font-size:11pt"> bioélelmiszer megtermelésének és fogyasztásának </span><span style="font-family:Calibri; font-size:11pt">rendszerbe szervezését</span><span style="font-family:Calibri; font-size:11pt">/</span><span style="font-family:Calibri; font-size:11pt">összekapcsolását jelentik</span><span style="font-family:Calibri; font-size:11pt">.&nbsp; A továbbiakban </span><span style="font-family:Calibri; font-size:11pt">ezért kétfelé</span><span style="font-family:Calibri; font-size:11pt"> választjuk</span><span style="font-family:Calibri; font-size:11pt"> a lehetséges megoldásokat: értékesítésre és rendszerekre</span><span style="font-family:Calibri; font-size:11pt">.&nbsp;\r\n A megkülönböztetés célja az, hogy felismerjük, melyek lehetnek az \r\n„egyszerű” értékesítés és melyek a helyi élelmiszerrendszer \r\nmegszervezésének elemei. A gyakorlatban persze ez a kétféleség gyakran \r\nátfedéssel, egyszerre jelenik meg.)</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt">&nbsp;</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">Javaslat helyben:</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">A neszűrben elkezdeni a „kiskert modellt”</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">.</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold"> Majd helyet biztosítani a termelők részére az értékesítésben.</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">P</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">énzügyi forrás:</span></p><ul style="margin:0pt; padding-left:0pt" type="disc"><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">város saját forrás (átcsoportosítás)</span></li></ul><ul style="margin:0pt; padding-left:0pt" type="disc"><li style="font-family:serif; font-size:11pt; margin:0pt 0pt 10pt 26.85pt; padding-left:9.15pt; text-align:justify; text-indent:0pt"><a href="http://www.portfolio.hu/redirect/megallapodtak_az_unios_agrarpolitika_uj_iranyvonalairol.185923.html"><span style="color:#0000ff; font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">http://www.portfolio.hu/redirect/megallapodtak_az_unios_agrarpolitika_uj_iranyvonalairol.185923.html</span></a></li></ul><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">B</span><span style="font-family:Calibri; font-size:11pt; font-weight:bold; text-decoration:underline">iztonság:</span></p><p style="margin:0pt 0pt 10pt; text-align:justify"><span style="font-family:Calibri; font-size:11pt; font-weight:bold">Polgárőrség </span><span style="font-family:Calibri; font-size:11pt; font-weight:bold">nagyobb bevonása, a rendőri szervek nagyobb jelenléte, valamint a becsületes és dolgozni akaró romák bevonása a polgárőrségbe. </span></p><p style="margin:0pt 0pt 10pt; text-align:center"><span style="color:#00cc00; font-family:Calibri; font-size:20pt; font-weight:bold">Zöld ipar, zöld mezőgazdaság</span><span style="color:#00cc00; font-family:Calibri; font-size:20pt; font-weight:bold">,</span><span style="color:#00cc00; font-family:Calibri; font-size:20pt; font-weight:bold"> zöld „kultúra”.</span></p><p style="margin:0pt 0pt 10pt"><span style="font-family:Calibri; font-size:11pt">Felhasznált irodalom:</span></p><p style="margin:0pt 0pt 17.25pt 103.5pt; text-indent:-18pt"><span style="font-family:Calibri; font-size:11pt">1.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><a href="http://www.ff3.hu/fejlodes.html"><span style="color:#0000ff; font-family:Arial; font-size:12pt; font-style:italic; text-decoration:underline">www.ff3.hu/</span><span style="color:#0000ff; font-family:Arial; font-size:12pt; font-style:italic; font-weight:bold; text-decoration:underline">fejlodes</span><span style="color:#0000ff; font-family:Arial; font-size:12pt; font-style:italic; text-decoration:underline">.html</span></a></p><p style="margin:0pt 0pt 17.25pt 103.5pt; text-indent:-18pt"><span style="font-family:Calibri; font-size:11pt">2.</span><span style="font:7.0pt ''Times New Roman''">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="font-family:Calibri; font-size:11pt">Nyitott Kert Alapítvány: Helyi </span><span style="font-family:Calibri; font-size:11pt">bio</span><span style="font-family:Calibri; font-size:11pt"> élelmiszer kézikönyv</span></p>', '', '', '', '', '2014-10-04 14:47:18', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dom_id` int(80) NOT NULL,
  `web_id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `ugyfelid` int(11) NOT NULL,
  `frommail` varchar(50) NOT NULL,
  `fromnev` varchar(50) NOT NULL,
  `targy` varchar(200) NOT NULL,
  `tomail` varchar(50) NOT NULL,
  `tonev` varchar(50) NOT NULL,
  `uzenet` text NOT NULL,
  `allapot` varchar(10) NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- A tábla adatainak kiíratása `email`
--

INSERT INTO `email` (`id`, `dom_id`, `web_id`, `userid`, `ugyfelid`, `frommail`, `fromnev`, `targy`, `tomail`, `tonev`, `uzenet`, `allapot`, `datum`) VALUES
(1, 0, 0, 0, 0, 'mddfe@gmail.com', 'fger', 'Üzenet', 'menkuotto@gmail.com', 'admin', 'fffffffffffffffffffff\r\n', 'hiba', '2014-10-01 01:05:36'),
(2, 0, 0, 0, 0, 'dmkle@hmm.hu', 'klsdflksaljkfcal', 'Üzenet', 'menkuotto@gmail.com', 'admin', '\r\nedwedwedwe', 'hiba', '2014-10-05 22:16:10');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `hibak`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `html`
--

CREATE TABLE IF NOT EXISTS `html` (
  `id` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `nyelv` varchar(50) NOT NULL,
  `html` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `katid` int(11) NOT NULL,
  `cimke` text NOT NULL,
  `foto` varchar(250) NOT NULL,
  `tipus` varchar(50) NOT NULL,
  `pub` tinyint(4) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- A tábla adatainak kiíratása `item`
--

INSERT INTO `item` (`id`, `userid`, `katid`, `cimke`, `foto`, `tipus`, `pub`, `time`) VALUES
(1, 247, 3, '', '', '', 0, '2015-01-04 23:33:48'),
(2, 62, 1, '', '', '', 0, '2015-01-04 23:33:49'),
(3, 247, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(4, 228, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(5, 247, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(6, 62, 1, '', '', '', 0, '2015-01-04 23:33:49'),
(7, 62, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(8, 62, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(9, 247, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(10, 62, 2, '', '', '', 0, '2015-01-04 23:33:49'),
(11, 62, 3, '', '', '', 0, '2015-01-04 23:33:50'),
(12, 62, 3, '', '', '', 0, '2015-01-04 23:33:50'),
(13, 228, 1, '', '', '', 0, '2015-01-04 23:33:50'),
(14, 228, 2, '', '', '', 0, '2015-01-04 23:33:50'),
(15, 228, 2, '', '', '', 0, '2015-01-04 23:33:50'),
(16, 62, 3, '', '', '', 0, '2015-01-04 23:33:50'),
(17, 228, 1, '', '', '', 0, '2015-01-04 23:33:50'),
(18, 247, 3, '', '', '', 0, '2015-01-04 23:33:50');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `item_lang`
--

CREATE TABLE IF NOT EXISTS `item_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `nyelv` varchar(20) NOT NULL,
  `cim` varchar(50) NOT NULL,
  `bev` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- A tábla adatainak kiíratása `item_lang`
--

INSERT INTO `item_lang` (`id`, `itemid`, `nyelv`, `cim`, `bev`) VALUES
(1, 1, 'en', 'enelső', 'en-első-második ............. első-második ............. első-második ............. első-második'),
(2, 1, 'de', 'de-első-második', 'de-első-második ............. első-második ............. első-második ............. első-második'),
(3, 1, 'fr', 'fr-első-második', 'fr-első-második ............. első-második ............. első-második ............. első-második'),
(4, 1, 'hu', 'hu-első-második', 'hu-első-második ............. első-második ............. első-második ............. első-második'),
(5, 2, 'hu', 'humásodik', 'hu-második-második ............. második-második ............. második-második ............. második-második'),
(6, 2, 'de', 'de-második-második', 'de-második-második ............. második-második ............. második-második ............. második-második'),
(7, 2, 'fr', 'fr-második-második', 'fr-második-második ............. második-második ............. második-második ............. második-második'),
(8, 3, 'en', 'enharmadik', 'en-harmadik-második ............. harmadik-második ............. harmadik-második ............. harmadik-második'),
(9, 3, 'hu', 'hu-harmadik-második', 'hu-harmadik-második ............. harmadik-második ............. harmadik-második ............. harmadik-második'),
(10, 3, 'cz', 'cz-harmadik-második', 'cz-harmadik-második ............. harmadik-második ............. harmadik-második ............. harmadik-második'),
(11, 3, 'pr', 'pr-harmadik-második', 'pr-harmadik-második ............. harmadik-második ............. harmadik-második ............. harmadik-második'),
(12, 4, 'de', 'denegyedik', 'de-negyedik-második ............. negyedik-második ............. negyedik-második ............. negyedik-második'),
(13, 5, 'cz', 'czötödik', 'cz-ötödik-második ............. ötödik-második ............. ötödik-második ............. ötödik-második'),
(14, 5, 'hu', 'hu-ötödik-második', 'hu-ötödik-második ............. ötödik-második ............. ötödik-második ............. ötödik-második'),
(15, 6, 'cz', 'czhatodik', 'cz-hatodik-második ............. hatodik-második ............. hatodik-második ............. hatodik-második'),
(16, 7, 'hu', 'hunyolcadik', 'hu-nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második'),
(17, 7, 'fr', 'fr-nyolcadik-második', 'fr-nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második'),
(18, 7, 'pr', 'pr-nyolcadik-második', 'pr-nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második ............. nyolcadik-második'),
(19, 8, 'pr', 'prkilencedik', 'pr-kilencedik-második ............. kilencedik-második ............. kilencedik-második ............. kilencedik-második'),
(20, 8, 'hu', 'hu-kilencedik-második', 'hu-kilencedik-második ............. kilencedik-második ............. kilencedik-második ............. kilencedik-második'),
(21, 8, 'fr', 'fr-kilencedik-második', 'fr-kilencedik-második ............. kilencedik-második ............. kilencedik-második ............. kilencedik-második'),
(22, 8, 'en', 'en-kilencedik-második', 'en-kilencedik-második ............. kilencedik-második ............. kilencedik-második ............. kilencedik-második'),
(23, 9, 'de', 'detizedik', 'de-tizedik-második ............. tizedik-második ............. tizedik-második ............. tizedik-második'),
(24, 9, 'pr', 'pr-tizedik-második', 'pr-tizedik-második ............. tizedik-második ............. tizedik-második ............. tizedik-második'),
(25, 9, 'hu', 'hu-tizedik-második', 'hu-tizedik-második ............. tizedik-második ............. tizedik-második ............. tizedik-második'),
(26, 10, 'fr', 'frelső', 'fr-első-harmadik ............. első-harmadik ............. első-harmadik ............. első-harmadik'),
(27, 10, 'hu', 'hu-első-harmadik', 'hu-első-harmadik ............. első-harmadik ............. első-harmadik ............. első-harmadik'),
(28, 10, 'de', 'de-első-harmadik', 'de-első-harmadik ............. első-harmadik ............. első-harmadik ............. első-harmadik'),
(29, 10, 'cz', 'cz-első-harmadik', 'cz-első-harmadik ............. első-harmadik ............. első-harmadik ............. első-harmadik'),
(30, 11, 'pr', 'prmásodik', 'pr-második-harmadik ............. második-harmadik ............. második-harmadik ............. második-harmadik'),
(31, 11, 'de', 'de-második-harmadik', 'de-második-harmadik ............. második-harmadik ............. második-harmadik ............. második-harmadik'),
(32, 11, 'hu', 'hu-második-harmadik', 'hu-második-harmadik ............. második-harmadik ............. második-harmadik ............. második-harmadik'),
(33, 11, 'en', 'en-második-harmadik', 'en-második-harmadik ............. második-harmadik ............. második-harmadik ............. második-harmadik'),
(34, 12, 'de', 'deharmadik', 'de-harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik'),
(35, 12, 'hu', 'hu-harmadik-harmadik', 'hu-harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik'),
(36, 12, 'cz', 'cz-harmadik-harmadik', 'cz-harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik'),
(37, 12, 'pr', 'pr-harmadik-harmadik', 'pr-harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik ............. harmadik-harmadik'),
(38, 13, 'cz', 'cznegyedik', 'cz-negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik'),
(39, 13, 'fr', 'fr-negyedik-harmadik', 'fr-negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik'),
(40, 13, 'de', 'de-negyedik-harmadik', 'de-negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik ............. negyedik-harmadik'),
(41, 14, 'en', 'enötödik', 'en-ötödik-harmadik ............. ötödik-harmadik ............. ötödik-harmadik ............. ötödik-harmadik'),
(42, 15, 'en', 'enhatodik', 'en-hatodik-harmadik ............. hatodik-harmadik ............. hatodik-harmadik ............. hatodik-harmadik'),
(43, 16, 'de', 'denyolcadik', 'de-nyolcadik-harmadik ............. nyolcadik-harmadik ............. nyolcadik-harmadik ............. nyolcadik-harmadik'),
(44, 16, 'hu', 'hu-nyolcadik-harmadik', 'hu-nyolcadik-harmadik ............. nyolcadik-harmadik ............. nyolcadik-harmadik ............. nyolcadik-harmadik'),
(45, 17, 'cz', 'czkilencedik', 'cz-kilencedik-harmadik ............. kilencedik-harmadik ............. kilencedik-harmadik ............. kilencedik-harmadik'),
(46, 17, 'de', 'de-kilencedik-harmadik', 'de-kilencedik-harmadik ............. kilencedik-harmadik ............. kilencedik-harmadik ............. kilencedik-harmadik'),
(47, 18, 'pr', 'prtizedik', 'pr-tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik'),
(48, 18, 'cz', 'cz-tizedik-harmadik', 'cz-tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik'),
(49, 18, 'de', 'de-tizedik-harmadik', 'de-tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik'),
(50, 18, 'en', 'en-tizedik-harmadik', 'en-tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik ............. tizedik-harmadik');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `item_lang_old`
--

CREATE TABLE IF NOT EXISTS `item_lang_old` (
  `itemid` int(11) NOT NULL,
  `nyelv` varchar(50) NOT NULL,
  `cim` varchar(100) NOT NULL,
  `intro` varchar(250) NOT NULL,
  PRIMARY KEY (`itemid`,`nyelv`),
  KEY `itemid` (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jog`
--

CREATE TABLE IF NOT EXISTS `jog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jog` varchar(10) NOT NULL,
  `targy` varchar(10) NOT NULL,
  `targy_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `datum` datetime NOT NULL,
  `ervenyes` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kapcsolatok`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `komment`
--

CREATE TABLE IF NOT EXISTS `komment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) NOT NULL,
  `menuid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `datum` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gal_id` int(11) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `tip` varchar(50) NOT NULL,
  `file_nev` varchar(50) NOT NULL,
  `jog` varchar(200) NOT NULL,
  `datum` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=47 ;

--
-- A tábla adatainak kiíratása `media`
--

INSERT INTO `media` (`id`, `user_id`, `gal_id`, `thumb`, `tip`, `file_nev`, `jog`, `datum`, `pub`) VALUES
(1, 62, 0, '', 'kep', '62_1395259750_804.jpg', '', '2014-03-19 21:09:10', 1),
(5, 62, 0, '', 'kep', '62_1395310381_151.png', '', '2014-03-20 11:13:01', 1),
(3, 62, 0, '', 'kep', '62_1395259751_840.jpg', '', '2014-03-19 21:09:11', 1),
(4, 62, 0, '', 'kep', '62_1395259754_192.jpg', '', '2014-03-19 21:09:14', 1),
(6, 62, 0, '', 'kep', '62_1395351810_631.jpg', '', '2014-03-20 22:43:30', 1),
(7, 62, 0, '', 'kep', '62_1395351810_235.jpg', '', '2014-03-20 22:43:30', 1),
(8, 62, 0, '', 'kep', '62_1395351811_972.jpg', '', '2014-03-20 22:43:31', 1),
(9, 62, 0, '', 'kep', '62_1395431062_230.jpg', '', '2014-03-21 20:44:23', 1),
(10, 62, 0, '', 'kep', '62_1395448003_298.jpg', '', '2014-03-22 01:26:44', 1),
(11, 62, 0, '', 'kep', '62_1395609067_85.jpg', '', '2014-03-23 22:11:07', 1),
(12, 62, 0, '', 'kep', '62_1396034234_808.jpg', '', '2014-03-28 20:17:14', 1),
(13, 62, 0, '', 'kep', '62_1396188973_524.jpg', '', '2014-03-30 16:16:13', 1),
(14, 62, 0, '', 'kep', '62_1412031773_723.jpg', '', '2014-09-30 01:02:53', 1),
(15, 62, 0, '', 'kep', '62_1412417715_879.jpg', '', '2014-10-04 12:15:16', 1),
(16, 62, 0, '', 'kep', '62_1412417716_659.jpg', '', '2014-10-04 12:15:17', 1),
(17, 62, 0, '', 'kep', '62_1412417717_102.jpg', '', '2014-10-04 12:15:17', 1),
(18, 62, 0, '', 'kep', '62_1412417718_538.jpg', '', '2014-10-04 12:15:18', 1),
(19, 62, 0, '', 'kep', '62_1412417719_312.jpg', '', '2014-10-04 12:15:19', 1),
(20, 62, 0, '', 'kep', '62_1412417720_73.jpg', '', '2014-10-04 12:15:20', 1),
(21, 62, 0, '', 'kep', '62_1412417720_878.jpg', '', '2014-10-04 12:15:20', 1),
(22, 62, 0, '', 'kep', '62_1412417722_128.jpg', '', '2014-10-04 12:15:22', 1),
(23, 62, 0, '', 'kep', '62_1412417722_248.jpg', '', '2014-10-04 12:15:22', 1),
(24, 62, 0, '', 'kep', '62_1412417722_299.jpg', '', '2014-10-04 12:15:22', 1),
(25, 62, 0, '', 'kep', '62_1412417723_619.jpg', '', '2014-10-04 12:15:23', 1),
(26, 62, 0, '', 'kep', '62_1412417725_156.jpg', '', '2014-10-04 12:15:25', 1),
(27, 62, 0, '', 'kep', '62_1412417726_593.jpg', '', '2014-10-04 12:15:26', 1),
(28, 62, 0, '', 'kep', '62_1412417726_762.jpg', '', '2014-10-04 12:15:26', 1),
(29, 62, 0, '', 'kep', '62_1412417727_897.jpg', '', '2014-10-04 12:15:27', 1),
(30, 62, 0, '', 'kep', '62_1412417728_223.jpg', '', '2014-10-04 12:15:28', 1),
(31, 62, 0, '', 'kep', '62_1412417728_37.jpg', '', '2014-10-04 12:15:28', 1),
(32, 62, 0, '', 'kep', '62_1412417729_182.jpg', '', '2014-10-04 12:15:29', 1),
(33, 62, 0, '', 'kep', '62_1412426470_848.png', '', '2014-10-04 14:41:10', 1),
(34, 62, 0, '', 'kep', '62_1412435833_117.jpg', '', '2014-10-04 17:17:13', 1),
(35, 62, 0, '', 'kep', '62_1412435833_859.jpg', '', '2014-10-04 17:17:13', 1),
(36, 62, 0, '', 'kep', '62_1412435835_85.jpg', '', '2014-10-04 17:17:15', 1),
(37, 62, 0, '', 'kep', '62_1412435836_171.jpg', '', '2014-10-04 17:17:16', 1),
(38, 62, 0, '', 'kep', '62_1412435837_662.jpg', '', '2014-10-04 17:17:17', 1),
(39, 62, 0, '', 'kep', '62_1412435837_822.jpg', '', '2014-10-04 17:17:17', 1),
(40, 62, 0, '', 'kep', '62_1412435838_420.jpg', '', '2014-10-04 17:17:18', 1),
(41, 62, 0, '', 'kep', '62_1412435839_592.jpg', '', '2014-10-04 17:17:19', 1),
(42, 62, 0, '', 'kep', '62_1412435839_298.jpg', '', '2014-10-04 17:17:19', 1),
(43, 62, 0, '', 'kep', '62_1412435839_400.jpg', '', '2014-10-04 17:17:19', 1),
(44, 62, 0, '', 'kep', '62_1412435840_600.jpg', '', '2014-10-04 17:17:20', 1),
(45, 62, 0, '', 'kep', '62_1412437163_904.jpg', '', '2014-10-04 17:39:23', 1),
(46, 62, 0, '', 'kep', '62_1412437168_636.jpg', '', '2014-10-04 17:39:29', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `media_lang`
--

CREATE TABLE IF NOT EXISTS `media_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `nyelv` varchar(50) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menuk`
--

CREATE TABLE IF NOT EXISTS `menuk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `webhely_id` int(11) NOT NULL,
  `pozicio` varchar(20) NOT NULL DEFAULT 'felsőmenü',
  `kategoria` varchar(50) NOT NULL,
  `sorrend` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `szulo_id` int(11) NOT NULL,
  `nev` varchar(200) NOT NULL,
  `link` varchar(250) NOT NULL,
  `pub` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `webhely_id` (`webhely_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- A tábla adatainak kiíratása `menuk`
--

INSERT INTO `menuk` (`id`, `user_id`, `webhely_id`, `pozicio`, `kategoria`, `sorrend`, `csid`, `szulo_id`, `nev`, `link`, `pub`) VALUES
(1, 0, 0, 'felsőmenü', '', 0, 0, 0, 'Nyitólap', 'index.php?com=cikk&id=10', 0),
(2, 0, 0, 'felsőmenü', '', 0, 0, 0, 'Program', 'index.php?com=cikk&mid=2&id=8', 0),
(3, 0, 0, 'felsőmenü', 'kitvalasszak', 0, 0, 0, 'Kit válasszak?', 'index.php?com=belep&mid=3', 1),
(5, 0, 0, 'felsőmenü', '', 5, 0, 0, 'Kapcsolat', 'index.php?com=mail&toid=62&mod=kapcs', 0),
(19, 0, 0, 'felsőmenü', 'vegyes', 4, 0, 0, 'Cikkek', 'index.php?com=cikk&mid=19&kat=vegyes&n=1', 0),
(20, 62, 0, 'felsőmenü', '', 6, 20, 0, 'Belépés', 'index.php?com=belep', 0),
(21, 0, 0, 'felsőmenü', '', 0, 0, 0, 'Fenntarthatóság', 'index.php?com=cikk&csid=1&id=16', 0),
(22, 0, 0, 'felsőmenü', '', 0, 0, 0, 'Játék', 'index.php?com=slot', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `menu_content`
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
-- Tábla szerkezet ehhez a táblához `modulok`
--

CREATE TABLE IF NOT EXISTS `modulok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `wid` int(11) NOT NULL,
  `nev` varchar(50) NOT NULL,
  `pozicio` varchar(50) NOT NULL DEFAULT 'felsőmenü',
  `sorrend` int(11) NOT NULL,
  `lathat_jog` varchar(200) NOT NULL,
  `param` text NOT NULL,
  `style` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- A tábla adatainak kiíratása `modulok`
--

INSERT INTO `modulok` (`id`, `userid`, `wid`, `nev`, `pozicio`, `sorrend`, `lathat_jog`, `param`, `style`) VALUES
(1, 62, 0, 'fomenu', 'felsomenu', 0, '', '', ''),
(2, 62, 0, 'login', 'balsav', 0, '', '', '');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `stat`
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=654 ;

--
-- A tábla adatainak kiíratása `stat`
--

INSERT INTO `stat` (`id`, `ip`, `url`, `ref`, `kliens`, `user_id`, `ido`) VALUES
(1, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&h=4&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:26:41'),
(2, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&h=4&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:32:54'),
(3, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&h=4&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:32:59'),
(4, '31.13.99.114', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-03 20:33:08'),
(5, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:36:43'),
(6, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:40:36'),
(7, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:40:42'),
(8, '31.13.99.116', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-03 20:40:44'),
(9, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:41:57'),
(10, '91.83.205.217', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-03 20:41:58'),
(11, '91.83.205.217', '/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:00:11'),
(12, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:00:12'),
(13, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:00:16'),
(14, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:00:27'),
(15, '91.83.205.217', '/index.php?com=admin', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:00:31'),
(16, '91.83.205.217', '/index.php?com=admin&task=szerk&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:00:38'),
(17, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media', 'http://menkuotto.infolapok.hu/index.php?com=admin&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:01:38'),
(18, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:02:16'),
(19, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:02:29'),
(20, '91.83.205.217', '/index.php?com=admin&task=szerk&id=', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:02:30'),
(21, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:02:31'),
(22, '91.83.205.217', '/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:02:40'),
(23, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:02:40'),
(24, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:02:43'),
(25, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:02:53'),
(26, '31.13.99.118', '/index.php?com=cikk&csid=19&mid=19&id=12', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 11:02:55'),
(27, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:03:13'),
(28, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:03:26'),
(29, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:06:45'),
(30, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:06:52'),
(31, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:18:21'),
(32, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12&f=1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:19:41'),
(33, '31.13.99.116', '/index.php?com=cikk&csid=19&mid=19&id=12&f=1', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 11:19:43'),
(34, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:20:09'),
(35, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:20:24'),
(36, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:20:32'),
(37, '31.13.99.114', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 11:20:35'),
(38, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:21:25'),
(39, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:22:42'),
(40, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:22:51'),
(41, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:23:08'),
(42, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:23:20'),
(43, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:23:24'),
(44, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:25:33'),
(45, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:25:43'),
(46, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=unpub&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:25:52'),
(47, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=unpub&id=12', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:25:59'),
(48, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:26:09'),
(49, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:26:20'),
(50, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:27:02'),
(51, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:28:45'),
(52, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=12&f=1', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 11:28:47'),
(53, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:31:55'),
(54, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:32:11'),
(55, '31.13.99.113', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 11:32:13'),
(56, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:32:37'),
(57, '31.13.102.116', '/index.php?com=cikk&mid=2&id=8&csid=2&fb_locale=en_GB', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 11:38:32'),
(58, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=unpub&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:56:58'),
(59, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 11:57:12'),
(60, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:04:07'),
(61, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:07:39'),
(62, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:08:03'),
(63, '31.13.99.119', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 12:08:04'),
(64, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=14', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:08:45'),
(65, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:11:33'),
(66, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:15'),
(67, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:16'),
(68, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:17'),
(69, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:18'),
(70, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:19'),
(71, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:20'),
(72, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:20'),
(73, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:22'),
(74, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:22'),
(75, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:22'),
(76, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:23'),
(77, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:24'),
(78, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:26'),
(79, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:26'),
(80, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:27'),
(81, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:27'),
(82, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:28'),
(83, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:28'),
(84, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:29'),
(85, '91.83.205.217', '/index.php?com=admin&ftask=cikkek', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:47'),
(86, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:15:49'),
(87, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:24:51'),
(88, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:25:10'),
(89, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=15', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:25:14'),
(90, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:25:31'),
(91, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:25:37'),
(92, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=15', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:26:14'),
(93, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:26:57'),
(94, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:27:05'),
(95, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=11', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 12:27:29'),
(96, '88.132.33.13', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=hAQFJBuZ3&enc=AZNinN2R3lp_0XXUr2BqQEMKLjkeB7DB1G1iEKum7BQEDH9lKYBcxAANC7QEmXe', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 13:15:40'),
(97, '88.132.33.13', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 13:15:49'),
(98, '88.132.33.13', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 13:15:55'),
(99, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 14:39:43'),
(100, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 14:40:06'),
(101, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 14:40:25'),
(102, '188.156.238.180', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 14:40:26'),
(103, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:40:39'),
(104, '91.83.205.217', '/index.php?com=admin', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:40:42'),
(105, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:40:51'),
(106, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:10'),
(107, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:10'),
(108, '91.83.205.217', '/index.php?com=admin&ftask=cikkek', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:15'),
(109, '91.83.205.217', '/index.php?com=admin&ftask=cikkek', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:16'),
(110, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:19'),
(111, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media&editor=szerkeszto', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:41:55'),
(112, '91.83.205.217', '/index.php?com=media&keret=0&beszur=media', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:46:24'),
(113, '91.83.205.217', '/index.php?com=admin&ftask=cikkek&task=ment&id=', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=szerk&id=', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:47:18'),
(114, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:49:41'),
(115, '91.83.205.217', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:50:52'),
(116, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:50:59'),
(117, '31.13.99.117', '/index.php?com=cikk&csid=21&id=16', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 14:51:01'),
(118, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:52:26'),
(119, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:53:42'),
(120, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:54:23'),
(121, '91.83.205.217', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=14', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:57:59'),
(122, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:59:19'),
(123, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:59:27'),
(124, '91.83.205.217', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 14:59:53'),
(125, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:00:24'),
(126, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:01:02'),
(127, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:13:45'),
(128, '65.52.242.216', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-04 15:15:11'),
(129, '31.13.110.116', '/index.php?com=cikk&mid=2&id=8&csid=2&fb_locale=hu_HU', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 15:16:09'),
(130, '91.83.205.217', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=dAQFD2eOCAQHLk3tMbTI4HlfJdZ_4Qtt-v7JTWyHTw8bVuw&enc=AZPPE3_gYVTBCja3kIukI54kU', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:16:09'),
(131, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:17:55'),
(132, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:18:58'),
(133, '65.52.242.216', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-04 15:19:54'),
(134, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=14', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:22:10'),
(135, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:22:32'),
(136, '65.52.242.216', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-04 15:23:34'),
(137, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:24:26'),
(138, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 15:24:40'),
(139, '31.13.99.112', '/index.php?com=cikk&csid=19&mid=19&id=15', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 15:24:44'),
(140, '91.82.7.239', '/index.php?com=cikk&mid=2&id=8&csid=2', 'https://www.facebook.com/', 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Dragon/33.1.0.0 Chrome/33.0.1750.152 Safari/537.36', 0, '2014-10-04 15:31:09'),
(141, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 15:49:41'),
(142, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 15:52:09'),
(143, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 15:58:38'),
(144, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:00:33'),
(145, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:01:09'),
(146, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:04:31'),
(147, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:05:12'),
(148, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:06:18'),
(149, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:08:43'),
(150, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:11:33'),
(151, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:13:06'),
(152, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:14:07'),
(153, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:16:59'),
(154, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:19:15'),
(155, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:19:51'),
(156, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:21:05'),
(157, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:21:36'),
(158, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:23:17'),
(159, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:26:08'),
(160, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:27:21'),
(161, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:27:48'),
(162, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:29:08'),
(163, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:31:29'),
(164, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:32:05'),
(165, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:32:11'),
(166, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:33:35'),
(167, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:34:43'),
(168, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:35:59'),
(169, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:36:46'),
(170, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:37:08'),
(171, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:38:19'),
(172, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:38:55'),
(173, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:39:01'),
(174, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:40:34'),
(175, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:41:32'),
(176, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:42:10'),
(177, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:42:40'),
(178, '31.13.102.121', '/index.php?com=cikk&csid=19&mid=19&id=14&fb_locale=hu_HU', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 16:43:11'),
(179, '87.242.43.34', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D14&h=kAQGcTD_D&enc=AZOCq2lvbU_kx4TUpg53uL8l_qdm4VyBh6IwAabEgmgRC-gmXKYaN_zItbJ-', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-04 16:43:11'),
(180, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:45:30'),
(181, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:46:59'),
(182, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:48:14'),
(183, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:48:36'),
(184, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:50:14'),
(185, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=slot', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:50:49'),
(186, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:55:49'),
(187, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:56:23'),
(188, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:57:39'),
(189, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:59:02'),
(190, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 16:59:23'),
(191, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:02:07'),
(192, '31.13.99.112', '/index.php?com=slot', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 17:02:12'),
(193, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:03:22'),
(194, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:08:49'),
(195, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=slot', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:09:01'),
(196, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:09:19'),
(197, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:09:28'),
(198, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:10:13'),
(199, '62.165.237.235', '/index.php?com=cikk&csid=19&mid=19&id=14', 'https://www.facebook.com/', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 0, '2014-10-04 17:17:05'),
(200, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:13'),
(201, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:13'),
(202, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:15'),
(203, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:16'),
(204, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:17'),
(205, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:17'),
(206, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:17'),
(207, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:19'),
(208, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:19'),
(209, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:19'),
(210, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:20'),
(211, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:17:20'),
(212, '91.83.142.233', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D14&h=LAQFW7up3&enc=AZNplEgIkNHQvHQj4aG5cgr5UVVGa8-Vz3rLlLrfJKr6eTna1ND8D-a5kI3C', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:25:48'),
(213, '91.83.198.211', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D14&h=fAQFCTA89AQG_nAf6QwgZm48R3MYliXK2CfP8iwk0dIlo5A&enc=AZPygPKQaAjeK1T3TAQ0Gd', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:38:46'),
(214, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:39:23'),
(215, '91.83.205.217', '/index.php?com=media&task=upload&keret=json', 'http://menkuotto.infolapok.hu/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:39:28'),
(216, '91.83.205.217', '/index.php?com=media&tmpl=admin', 'http://menkuotto.infolapok.hu/index.php?com=admin&ftask=cikkek&task=ment&id=15', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 62, '2014-10-04 17:39:29'),
(217, '91.83.205.217', '/index.php?com=belep&csid=20', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:42:11'),
(218, '91.83.205.217', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=belep&csid=20', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:43:52'),
(219, '91.83.205.217', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:44:09'),
(220, '31.13.99.115', '/index.php?com=slot&csid=22', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 17:44:11'),
(221, '91.83.205.217', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:46:26'),
(222, '91.83.205.217', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:46:57'),
(223, '91.83.205.217', '/index.php?com=slot', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:51:16'),
(224, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=slot', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 17:52:07'),
(225, '107.21.187.210', '/index.php?com=cikk&csid=19&id=14&mid=19', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-04 18:13:38'),
(226, '107.22.51.67', '/index.php?com=cikk&csid=19&id=14&mid=19', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-04 18:13:38'),
(227, '88.132.161.106', '/index.php?com=cikk&csid=19&mid=19&id=13', 'https://www.facebook.com/', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 0, '2014-10-04 19:26:56'),
(228, '31.13.110.121', '/index.php?com=cikk&csid=19&mid=19&id=13&fb_locale=hu_HU', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-04 19:26:56'),
(229, '91.82.251.229', '/index.php?com=cikk&mid=2&id=8&csid=2', 'https://www.facebook.com/', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 0, '2014-10-04 20:38:54'),
(230, '84.206.47.34', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D14&h=VAQFIibaC&enc=AZPUMVjQJ9fkbqNCELCwLFB5lrtoTw3IWl9cAPZmpRYwQme3A4F5IqtQJJqy', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 21:34:08'),
(231, '91.228.167.60', '/index.php?com=slot&csid=22', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-04 22:15:47'),
(232, '91.228.167.60', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-04 22:15:47'),
(233, '91.228.167.60', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-04 22:15:47'),
(234, '91.228.167.60', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-04 22:15:48'),
(235, '91.83.205.217', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 22:29:44'),
(236, '91.83.205.217', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=15', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 22:30:12'),
(237, '91.83.205.217', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 22:31:59'),
(238, '91.83.205.217', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-04 22:32:53'),
(239, '89.132.8.54', '/index.php?com=cikk&csid=21&id=16', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D21%26id%3D16&h=7AQGqMA5T&s=1', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:13:33');
INSERT INTO `stat` (`id`, `ip`, `url`, `ref`, `kliens`, `user_id`, `ido`) VALUES
(240, '31.13.99.112', '/index.php?com=cikk&csid=21&id=16&fb_locale=hu_HU', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-05 00:13:33'),
(241, '89.132.8.54', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=21&id=16', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:15:34'),
(242, '89.132.8.54', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:16:00'),
(243, '89.132.8.54', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:16:04'),
(244, '89.132.8.54', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:16:07'),
(245, '89.132.8.54', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:16:43'),
(246, '89.132.8.54', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:17:33'),
(247, '89.132.8.54', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:18:03'),
(248, '89.132.8.54', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:18:07'),
(249, '89.132.8.54', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', 0, '2014-10-05 00:28:46'),
(250, '91.83.33.249', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/lsr.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&ext=1412462088&hash=Acliipl35b2bCvwmQ0B85SK0KRlWew5BjwLondculCO94A', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 00:33:50'),
(251, '54.82.53.238', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'HTTP_Request2/2.2.0 (http://pear.php.net/package/http_request2) PHP/5.3.29', 0, '2014-10-05 05:11:12'),
(252, '184.73.67.63', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'jack', 0, '2014-10-05 08:00:27'),
(253, '54.205.75.31', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'jack', 0, '2014-10-05 08:00:27'),
(254, '184.73.67.63', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2008091620 Firefox/3.0.2', 0, '2014-10-05 08:00:27'),
(255, '54.205.75.31', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.0.8) Gecko/2008091620 Firefox/3.0.2', 0, '2014-10-05 08:00:28'),
(256, '54.237.140.223', '/index.php?com=cikk&csid=2&id=8&mid=2', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-05 08:17:38'),
(257, '54.237.140.223', '/index.php?com=cikk&csid=19&id=13&mid=19', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-05 08:17:38'),
(258, '54.167.105.141', '/index.php?com=cikk&csid=2&id=8&mid=2', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-05 08:17:38'),
(259, '54.166.104.46', '/index.php?com=cikk&csid=19&id=13&mid=19', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0 (FlipboardProxy/1.1; +http://flipboard.com/browserproxy)', 0, '2014-10-05 08:17:38'),
(260, '31.13.99.112', '/index.php?com=cikk&csid=19&mid=19&id=13&fb_locale=en_GB', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-05 09:22:29'),
(261, '87.242.43.226', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D15&h=fAQFU1Xvm&enc=AZMutqhzo70r2OYsg-D0gbkRW8GpKnxHhah-kPimL2LcAAy63aysRJfgkGDA', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 10:07:17'),
(262, '65.52.246.161', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-05 11:08:20'),
(263, '65.52.246.161', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-05 11:08:20'),
(264, '65.52.246.161', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)', 0, '2014-10-05 11:08:20'),
(265, '209.133.111.215', '/index.php?com=cikk&csid=19&id=14&mid=19', '', 'rogerbot/1.0 (http://moz.com/help/pro/what-is-rogerbot-, rogerbot-crawler+shiny@moz.com)', 0, '2014-10-05 12:24:44'),
(266, '87.242.28.31', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D15&h=WAQEMGtzb&enc=AZNLZQxBFkdcJTXrJl2XS2ov_Ve-zYyb1VCFSOAAd2wmfDOnWmFEjYf7_oKx', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:11:42'),
(267, '31.13.102.123', '/index.php?com=cikk&csid=19&mid=19&id=15&fb_locale=hu_HU', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-05 13:11:42'),
(268, '87.242.28.31', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=15', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:12:04'),
(269, '87.242.28.31', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:12:08'),
(270, '87.242.28.31', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:12:11'),
(271, '87.242.28.31', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:12:24'),
(272, '87.242.28.31', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 13:12:34'),
(273, '88.132.187.83', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=hAQGWnLztAQGvMon4iuE1tAolBu7vMS132oZOVpPm9bc8Dw&enc=AZOykdZYqRmCv65g_FaM9yFOf', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', 0, '2014-10-05 14:53:21'),
(274, '88.132.187.83', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 5.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2', 0, '2014-10-05 14:55:19'),
(275, '157.55.39.169', '/', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-05 16:37:03'),
(276, '157.55.39.169', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-05 16:37:04'),
(277, '54.160.150.206', '/index.php?com=cikk', '', 'HTTP_Request2/2.2.0 (http://pear.php.net/package/http_request2) PHP/5.3.29', 0, '2014-10-05 19:26:44'),
(278, '87.242.43.214', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=rAQFp4CVIAQFdYvW76WKnZSHvIMjxTxjp4d8GS14KBxUFMQ&enc=AZPGT8atYYI-g5baTMzyZmjlT', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 20:49:49'),
(279, '46.107.78.89', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=bAQG4LmAj&s=1', 'Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 20:50:45'),
(280, '91.228.167.130', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-05 21:21:40'),
(281, '91.228.167.130', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-05 21:21:40'),
(282, '91.228.167.130', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://www.facebook.com/Gertruda', 'Mozilla/4.0 (compatible; MSIE 6.1; Windows XP)', 0, '2014-10-05 21:21:41'),
(283, '91.82.66.145', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:10:24'),
(284, '91.82.66.145', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:10:37'),
(285, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:10:55'),
(286, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:11:06'),
(287, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:11:35'),
(288, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:11:46'),
(289, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:12:15'),
(290, '91.82.66.145', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:15:38'),
(291, '91.82.66.145', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'http://menkuotto.infolapok.hu/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:16:10'),
(292, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:25:18'),
(293, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-05 22:25:22'),
(294, '31.13.102.119', '/index.php?com=cikk&csid=19&mid=19&id=14&fb_locale=de_DE', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-05 22:27:35'),
(295, '173.252.73.112', '/index.php?com=cikk&csid=19&mid=19&id=13&fb_locale=es_LA', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-06 00:11:28'),
(296, '173.252.73.117', '/index.php?com=cikk&mid=2&id=8&csid=2&fb_locale=es_LA', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-06 00:11:28'),
(297, '157.55.39.169', '/', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-06 04:13:10'),
(298, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-06 04:13:27'),
(299, '157.55.39.219', '/index.php?com=cikk&id=3&csid=1&rr=11', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-06 04:13:27'),
(300, '173.252.73.119', '/index.php?com=cikk&csid=19&mid=19&id=14&fb_locale=ko_KR', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-06 05:38:39'),
(301, '54.87.124.189', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.43 Safari/536.11', 0, '2014-10-06 07:04:04'),
(302, '54.87.124.189', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_4) AppleWebKit/536.11 (KHTML, like Gecko) Chrome/20.0.1132.43 Safari/536.11', 0, '2014-10-06 07:04:04'),
(303, '91.82.66.145', '/', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:12:49'),
(304, '91.82.66.145', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:12:49'),
(305, '31.13.99.114', '/index.php?com=cikk&csid=1&id=10', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-06 19:12:52'),
(306, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:13:09'),
(307, '91.82.66.145', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:13:28'),
(308, '91.82.66.145', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:13:44'),
(309, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:14:17'),
(310, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:14:30'),
(311, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=14', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:15:00'),
(312, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=11', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:15:08'),
(313, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:15:19'),
(314, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:15:29'),
(315, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:15:55'),
(316, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 19:16:05'),
(317, '91.82.7.239', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://l.facebook.com/lsr.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D15&ext=1412617699&hash=AckdANDbusCIev4Gs_2yZ_T5KTPXORgYxTvku8cxRE0Ryw', 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.36 (KHTML, like Gecko) Dragon/33.1.0.0 Chrome/33.0.1750.152 Safari/537.36', 0, '2014-10-06 19:47:19'),
(318, '5.187.143.149', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26mid%3D2%26id%3D8%26csid%3D2&h=vAQFDwyn8&enc=AZMLVqrD-4Nug0EvzUNVSUQdxXqpeJ2jwziufq1pjaI_h9pegPZ74fQbrIiLT2K', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-06 23:34:17'),
(319, '207.46.13.97', '/index.php?com=cikk&csid=19&mid=19&id=14', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 02:08:29'),
(320, '207.46.13.97', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 02:08:30'),
(321, '157.55.39.219', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 02:12:22'),
(322, '207.46.13.97', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 04:09:03'),
(323, '207.46.13.97', '/index.php?com=cikk&csid=1&id=16&csid=21', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 04:09:03'),
(324, '207.46.13.97', '/index.php?com=slot&csid=22', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 04:09:04'),
(325, '207.46.13.119', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 04:09:53'),
(326, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:12:25'),
(327, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:12:27'),
(328, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:12:27'),
(329, '157.55.39.185', '/index.php?com=cikk&csid=1&id=16&csid=21', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:37:16'),
(330, '157.55.39.185', '/index.php?com=cikk&csid=1&id=16&csid=21', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:37:16'),
(331, '157.55.39.185', '/index.php?com=slot&csid=22', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:37:18'),
(332, '157.55.39.185', '/index.php?com=slot&csid=22', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:37:18'),
(333, '157.55.39.219', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:51:08'),
(334, '157.55.39.219', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:54:59'),
(335, '157.55.39.219', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 06:55:00'),
(336, '157.55.39.185', '/index.php?com=cikk&csid=19&mid=19&id=13', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 07:51:01'),
(337, '207.46.13.119', '/index.php?com=cikk&id=10&csid=1', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 08:05:57'),
(338, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 08:59:50'),
(339, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 09:48:23'),
(340, '157.55.39.219', '/index.php?com=belep&csid=20', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 09:48:23'),
(341, '207.46.13.119', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 11:24:30'),
(342, '207.46.13.119', '/index.php?com=cikk&id=10&csid=1', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 11:24:30'),
(343, '207.46.13.119', '/index.php?com=cikk&id=10&csid=1', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 11:24:32'),
(344, '207.46.13.119', '/index.php?com=cikk&id=10&csid=1', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 11:24:32'),
(345, '207.46.13.119', '/index.php?com=cikk&id=10&csid=1', '', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 0, '2014-10-07 18:06:49'),
(346, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 22:55:40'),
(347, '91.82.66.145', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=15', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:11:41'),
(348, '31.13.99.116', '/index.php?com=cikk&id=10&csid=1', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-07 23:11:46'),
(349, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&id=10&csid=1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:11:59'),
(350, '91.82.66.145', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:12:16'),
(351, '91.82.66.145', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:12:32'),
(352, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:12:45'),
(353, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:12:45'),
(354, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=14', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:12:54'),
(355, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=14', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:13:07'),
(356, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=13', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:13:17'),
(357, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-07 23:13:28'),
(358, '88.150.209.18', '/index.php?com=cikk&csid=1&id=3', '', 'Mozilla/4.0 (compatible; Synapse)', 0, '2014-10-08 17:16:22'),
(359, '37.214.10.36', '/index.php?com=cikk&csid=1&id=3', '', 'Mozilla/4.0 (compatible; Synapse)', 0, '2014-10-08 17:16:27'),
(360, '91.82.66.145', '/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=13', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-08 18:39:13'),
(361, '91.82.66.145', '/index.php?com=cikk&id=10&csid=1', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=19&kat=vegyes&n=1&csid=19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-08 18:39:33'),
(362, '184.168.46.82', '/index.php?option=com_fabrik&c=import&view=import&filetype=csv&table=1', '', 'curl/7.19.7 (i386-redhat-linux-gnu) libcurl/7.19.7 NSS/3.13.1.0 zlib/1.2.3 libidn/1.18 libssh2/1.2.2', 0, '2014-10-09 12:58:04'),
(363, '144.76.104.40', '/index.php?option=com_fabrik&c=import&view=import&filetype=csv&table=1', '', 'curl/7.22.0 (x86_64-pc-linux-gnu) libcurl/7.22.0 OpenSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3', 0, '2014-10-10 19:38:31'),
(364, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-10 22:15:27'),
(365, '91.82.66.145', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=19&mid=19&id=12&f=3', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-10 22:31:13'),
(366, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-10 22:31:29'),
(367, '31.13.99.119', '/index.php?com=cikk&mid=2&id=8&csid=2', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-10 22:31:31'),
(368, '85.214.121.183', '/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&action=upload', '', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0)', 0, '2014-10-11 05:19:56'),
(369, '85.214.121.183', '/index.php?option=com_media&view=images&tmpl=component&e_name=jform_articletext&asset=com_content&author=', '', 'curl/7.19.7 (i486-pc-linux-gnu) libcurl/7.19.7 OpenSSL/0.9.8k zlib/1.2.3.3 libidn/1.15', 0, '2014-10-11 05:19:56'),
(370, '85.214.121.183', '/index.php?option=com_jdownloads&Itemid=0&view=upload', '', 'Mozilla/5.0 (Windows; U; Windows NT 5.1; de-LI; rv:1.9.0.16) Gecko/2009120208 Firefox/3.0.16 (.NET CLR 3.5.30729)', 0, '2014-10-11 05:19:56'),
(371, '66.249.93.48', '/index.php?com=cikk&csid=1&id=10', 'http://www.google.com/search', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/27.0.1453 Safari/537.36', 0, '2014-10-11 08:58:28'),
(372, '66.249.81.48', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 0, '2014-10-11 08:58:28'),
(373, '193.225.34.17', '/', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-11 18:00:22'),
(374, '193.225.34.17', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-11 18:00:23'),
(375, '31.13.110.116', '/index.php?com=cikk&csid=19&mid=19&id=15', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-12 21:55:09'),
(376, '79.120.249.86', '/index.php?com=cikk&csid=19&mid=19&id=15', 'http://l.facebook.com/l.php?u=http%3A%2F%2Fmenkuotto.infolapok.hu%2Findex.php%3Fcom%3Dcikk%26csid%3D19%26mid%3D19%26id%3D15&h=4AQGemG0o&enc=AZMHsTFm_hKj-lRctvVW22iZzpOJD-uDibEcUIVQV14b8qK7WU2DmE7AAz0c', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-12 21:55:09'),
(377, '91.82.66.145', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-13 18:40:22'),
(378, '31.13.110.123', '/index.php?com=cikk&csid=19&mid=19&id=12&f=3', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-13 18:40:24'),
(379, '66.249.81.48', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 0, '2014-10-15 10:59:27'),
(380, '142.4.209.182', '/index.php?com=cikk&csid=1&id=3', '', 'Mozilla/5.0 (compatible; MJ12bot/v1.4.5; http://www.majestic12.co.uk/bot.php?+)', 0, '2014-10-15 11:26:34'),
(381, '91.82.66.145', '/index.php?com=cikk&csid=1&id=10', '', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-15 17:43:38'),
(382, '31.13.110.116', '/index.php?com=cikk&csid=1&id=10', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-15 17:43:40'),
(383, '91.82.66.145', '/index.php?com=cikk&mid=2&id=8&csid=2', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=10', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-15 17:43:55'),
(384, '91.82.66.145', '/index.php?com=cikk&csid=1&id=16&csid=21', 'http://menkuotto.infolapok.hu/index.php?com=cikk&mid=2&id=8&csid=2', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-15 17:43:57'),
(385, '31.13.110.116', '/index.php?com=cikk&csid=21&id=16', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-15 17:43:58'),
(386, '91.82.66.145', '/index.php?com=slot&csid=22', 'http://menkuotto.infolapok.hu/index.php?com=cikk&csid=1&id=16&csid=21', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-15 17:44:00'),
(387, '31.13.110.120', '/index.php?com=slot&csid=22', '', 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)', 0, '2014-10-15 17:44:01'),
(388, '91.82.66.145', '/index.php?com=mail&toid=62&mod=kapcs&csid=5', 'http://menkuotto.infolapok.hu/index.php?com=slot&csid=22', 'Mozilla/5.0 (Windows NT 6.1; rv:32.0) Gecko/20100101 Firefox/32.0', 0, '2014-10-15 17:44:13'),
(389, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:22:04'),
(390, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:22:04'),
(391, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:22:52'),
(392, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:27:27'),
(393, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:27:27'),
(394, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:27:53'),
(395, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:27:53'),
(396, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:33:35'),
(397, '127.0.0.1', '/fejleszt/index.php?com=cikk&csid=19&mid=19&id=10', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:34:32'),
(398, '127.0.0.1', '/fejleszt/index.php?com=cikk&csid=19&mid=19&id=10', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:34:42'),
(399, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:36:11'),
(400, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:36:58'),
(401, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:38:21'),
(402, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-13 23:40:11'),
(403, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:21:27'),
(404, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:22:14'),
(405, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:23:38'),
(406, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:25:16'),
(407, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:25:18'),
(408, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:25:27'),
(409, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:26:12'),
(410, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:27:08'),
(411, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:27:49'),
(412, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:30:38'),
(413, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:31:13'),
(414, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:33:36'),
(415, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:34:02'),
(416, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:34:32'),
(417, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:37:18'),
(418, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:38:24'),
(419, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:50:15'),
(420, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:51:24'),
(421, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:53:25'),
(422, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=10&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:53:27'),
(423, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:53:44'),
(424, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:55:00'),
(425, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=10&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:55:02'),
(426, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:55:27'),
(427, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=10&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:57:16'),
(428, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:58:25'),
(429, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 22:58:27'),
(430, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:00:14'),
(431, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=10&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:00:16'),
(432, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:00:20'),
(433, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=16&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:00:37'),
(434, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=7&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:01:04'),
(435, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=10&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:01:11'),
(436, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:01:46'),
(437, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:01:47'),
(438, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:02:00'),
(439, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=8&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:03:55'),
(440, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:04:09'),
(441, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:04:11'),
(442, '127.0.0.1', '/fejleszt/index.php?com=cikk&id=16&tmpl=no', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:04:14'),
(443, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:22:21'),
(444, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:26:51'),
(445, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:28:00'),
(446, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:30:06'),
(447, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:32:12'),
(448, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:33:29'),
(449, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:34:37'),
(450, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:35:58'),
(451, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:38:41'),
(452, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:44:40'),
(453, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:45:14'),
(454, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:45:45'),
(455, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-15 23:45:56'),
(456, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:00:36'),
(457, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:02:04'),
(458, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:02:27'),
(459, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:02:48'),
(460, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:02:50'),
(461, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:03:54'),
(462, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:06:11'),
(463, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:06:47'),
(464, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:07:36'),
(465, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:08:27'),
(466, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:10:21'),
(467, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:11:30'),
(468, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:12:16'),
(469, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:12:46'),
(470, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:13:06'),
(471, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:13:12'),
(472, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:13:32'),
(473, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:13:40'),
(474, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 00:14:29'),
(475, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 20:49:13'),
(476, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 20:49:32'),
(477, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:02:30'),
(478, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:02:46'),
(479, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:03:41'),
(480, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:03:57'),
(481, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:04:36'),
(482, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:05:25'),
(483, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:05:33'),
(484, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:09:21'),
(485, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:10:57'),
(486, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:14:03'),
(487, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:16:49'),
(488, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:17:24'),
(489, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:19:01'),
(490, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:19:32'),
(491, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:19:35'),
(492, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:20:37'),
(493, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:23:57'),
(494, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:24:06'),
(495, '127.0.0.1', '/fejleszt/index.php?com=belep&task=valt&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:24:08'),
(496, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=belep&task=valt&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:24:11'),
(497, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek', 'http://localhost/fejleszt/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:24:15'),
(498, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:25:16'),
(499, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=3', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:25:45'),
(500, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=9', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=3', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:26:12'),
(501, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=7', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=9', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:26:17'),
(502, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=7', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:26:28'),
(503, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:27:50'),
(504, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:28:19'),
(505, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:29:26'),
(506, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:38:12'),
(507, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:39:47'),
(508, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:42:05');
INSERT INTO `stat` (`id`, `ip`, `url`, `ref`, `kliens`, `user_id`, `ido`) VALUES
(509, '127.0.0.1', '/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=szerk&id=', 'http://localhost/fejleszt/index.php?com=admin&ftask=cikkek&rmezo=cim&rir=desc&task=del&id=12', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-16 21:44:28'),
(510, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 21:58:51'),
(511, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 21:59:24'),
(512, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:34:43'),
(513, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:38:33'),
(514, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:42:31'),
(515, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:44:04'),
(516, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:45:29'),
(517, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:47:38'),
(518, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:55:39'),
(519, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:56:18'),
(520, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:57:34'),
(521, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:58:08'),
(522, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 22:59:53'),
(523, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:01:43'),
(524, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:03:09'),
(525, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:04:02'),
(526, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:07:23'),
(527, '127.0.0.1', '/fejleszt/', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:07:23'),
(528, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:08:19'),
(529, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:09:55'),
(530, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-20 23:10:13'),
(531, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:08:29'),
(532, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:10:04'),
(533, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:10:28'),
(534, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:12:06'),
(535, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:14:03'),
(536, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:14:27'),
(537, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:16:59'),
(538, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:17:26'),
(539, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:21:45'),
(540, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:22:13'),
(541, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:29:07'),
(542, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:30:02'),
(543, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:33:31'),
(544, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-21 10:34:06'),
(545, '127.0.0.1', '/fejleszt/', '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)', 0, '2014-11-21 10:36:12'),
(546, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:08:47'),
(547, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:09:03'),
(548, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:09:22'),
(549, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:16:26'),
(550, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:17:11'),
(551, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:18:14'),
(552, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:19:04'),
(553, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:24:43'),
(554, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:25:42'),
(555, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:26:45'),
(556, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:29:31'),
(557, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:31:59'),
(558, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:32:33'),
(559, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:38:18'),
(560, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:38:49'),
(561, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:39:39'),
(562, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:41:42'),
(563, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:44:32'),
(564, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:44:37'),
(565, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:45:18'),
(566, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:46:20'),
(567, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:46:26'),
(568, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:49:01'),
(569, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:49:44'),
(570, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:51:46'),
(571, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:52:36'),
(572, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:53:18'),
(573, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:54:36'),
(574, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:55:04'),
(575, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:55:24'),
(576, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:55:47'),
(577, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:56:08'),
(578, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 04:56:32'),
(579, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', 0, '2014-11-22 05:01:40'),
(580, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', 0, '2014-11-22 05:02:00'),
(581, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:02:39'),
(582, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:06:50'),
(583, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:10:07'),
(584, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:10:42'),
(585, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:11:14'),
(586, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:13:46'),
(587, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:14:22'),
(588, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:14:39'),
(589, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:19:57'),
(590, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:20:26'),
(591, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:22:19'),
(592, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:28:20'),
(593, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:28:48'),
(594, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:31:01'),
(595, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 05:31:59'),
(596, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 23:19:25'),
(597, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 23:40:05'),
(598, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-22 23:53:14'),
(599, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 13:27:44'),
(600, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36', 0, '2014-11-23 13:29:59'),
(601, '127.0.0.1', '/fejleszt/', '', 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)', 0, '2014-11-23 13:30:33'),
(602, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 13:45:50'),
(603, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 13:45:58'),
(604, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:08:29'),
(605, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:10:37'),
(606, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:14:44'),
(607, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:17:11'),
(608, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:18:59'),
(609, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:20:50'),
(610, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:22:45'),
(611, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:24:32'),
(612, '127.0.0.1', '/fejleszt/index.php?com=admin&task=szerk&id=6', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 14:25:39'),
(613, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 18:37:36'),
(614, '127.0.0.1', '/fejleszt/index.php?com=media', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 18:38:22'),
(615, '127.0.0.1', '/fejleszt/index.php?com=amin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:22:52'),
(616, '127.0.0.1', '/fejleszt/index.php?com=slot&csid=22', 'http://localhost/fejleszt/index.php?com=amin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:24:09'),
(617, '127.0.0.1', '/fejleszt/index.php?com=amin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:24:18'),
(618, '127.0.0.1', '/fejleszt/index.php?com=admin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:25:58'),
(619, '127.0.0.1', '/fejleszt/', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:58:07'),
(620, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:58:11'),
(621, '127.0.0.1', '/fejleszt/index.php?com=amin', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:58:35'),
(622, '127.0.0.1', '/fejleszt/index.php', '', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 20:58:44'),
(623, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 21:53:12'),
(624, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:01:50'),
(625, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:01:55'),
(626, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:10:55'),
(627, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:18:03'),
(628, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:19:21'),
(629, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:22:07'),
(630, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:23:59'),
(631, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:24:09'),
(632, '127.0.0.1', '/fejleszt/index.php?com=admin', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:24:18'),
(633, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:24:21'),
(634, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:24:23'),
(635, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:24:29'),
(636, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:27:22'),
(637, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:27:24'),
(638, '127.0.0.1', '/fejleszt/index.php', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:27:26'),
(639, '127.0.0.1', '/fejleszt/index.php?com=media&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:39:32'),
(640, '127.0.0.1', '/fejleszt/index.php?com=media&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:41:05'),
(641, '127.0.0.1', '/fejleszt/index.php?com=media&csid=', 'http://localhost/fejleszt/index.php', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:44:49'),
(642, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php?com=media&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:45:14'),
(643, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/index.php?com=media&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:48:32'),
(644, '127.0.0.1', '/fejleszt/index.php?com=admin&csid=', 'http://localhost/fejleszt/', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:48:41'),
(645, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:48:45'),
(646, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:54:51'),
(647, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:54:53'),
(648, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:56:26'),
(649, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin', 'http://localhost/fejleszt/index.php?com=admin&csid=', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:56:53'),
(650, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin&task=szerk&tip=kep&id=8', 'http://localhost/fejleszt/index.php?com=media&tmpl=admin', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:57:18'),
(651, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin&tip=kep&task=ment&id=8', 'http://localhost/fejleszt/index.php?com=media&tmpl=admin&task=szerk&tip=kep&id=8', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:57:54'),
(652, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin&task=szerk&tip=kep&id=8', 'http://localhost/fejleszt/index.php?com=media&tmpl=admin&tip=kep&task=ment&id=8', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:58:11'),
(653, '127.0.0.1', '/fejleszt/index.php?com=media&tmpl=admin&tip=kep&task=ment&id=8', 'http://localhost/fejleszt/index.php?com=media&tmpl=admin&task=szerk&tip=kep&id=8', 'Mozilla/5.0 (Windows NT 6.1; rv:33.0) Gecko/20100101 Firefox/33.0', 0, '2014-11-23 22:58:20');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userek`
--

CREATE TABLE IF NOT EXISTS `userek` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `registerdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pubnev` varchar(200) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `ellenorzott` varchar(11) NOT NULL DEFAULT 'nem',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=285 ;

--
-- A tábla adatainak kiíratása `userek`
--

INSERT INTO `userek` (`id`, `name`, `username`, `email`, `password`, `registerdate`, `pubnev`, `foto`, `ellenorzott`) VALUES
(62, 'Administrator', 'admin', 'motto001@gmail.com', '2c3c03d184949261d6dc8656b46b308a', '2011-08-02 10:49:04', '', '/userek/62/kepek/62_1392492694_325.jpg', 'nem'),
(228, 'Neo Shin', 'neoshin', 'lazado001@gmail.com', '2c3c03d184949261d6dc8656b46b308a', '2011-12-21 21:29:38', '', '', 'nem'),
(247, 'Petro Tibor', 'tibi', 'petro1.tibor@gmail.com', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', '2012-06-05 18:18:22', '', '', 'nem'),
(257, 'Illés Anita', 'admin2', 'illesanita1980@gmail.com', '6ed927f16dc8a0d51b0e7c30326e3a4f', '2014-04-04 10:00:07', '', '', 'nem'),
(256, '', 'csnagyne', 'csnagyne@gmail.com', 'dc3dbf5bfe37a506aa6687c338c4ac13', '2014-03-29 19:01:55', '', '', 'nem'),
(254, '', 'tkoffice', 'tkoffice@tkoffice.hu', '72668093e18ce1c0a73172e597b24073', '2014-03-17 10:49:17', '', '', 'nem');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `userek_lang`
--

CREATE TABLE IF NOT EXISTS `userek_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `nyelv` varchar(50) NOT NULL,
  `intro` varchar(250) NOT NULL,
  `html` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
