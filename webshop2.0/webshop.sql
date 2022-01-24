-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2020. Nov 24. 23:02
-- Kiszolgáló verziója: 10.4.14-MariaDB
-- PHP verzió: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adatok`
--

CREATE TABLE `adatok` (
  `id` int(9) NOT NULL,
  `user` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `adatok`
--

INSERT INTO `adatok` (`id`, `user`, `email`, `pwd`) VALUES
(3, 'test1', 'test@test-test.co.uk', '510d2bb8bde23f3e90af4592ba799f407afeb6b3'),
(4, 'mukodj', 'aaa@aaa.hu', '6b0dec1671fa81525a447f0f0c1476ead554e3c4'),
(5, 'finaletest', 'final@gmail.com', '510d2bb8bde23f3e90af4592ba799f407afeb6b3');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `admin`
--

CREATE TABLE `admin` (
  `id` int(9) NOT NULL,
  `admin` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `pwd` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `admin`
--

INSERT INTO `admin` (`id`, `admin`, `pwd`) VALUES
(1, 'admin1', '123');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

CREATE TABLE `kategoriak` (
  `id` int(2) NOT NULL,
  `katnev` varchar(255) NOT NULL,
  `katsorrend` int(2) NOT NULL,
  `logo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`id`, `katnev`, `katsorrend`, `logo`) VALUES
(1, 'Adidas', 1, 'logo/1.png'),
(2, 'Nike', 2, 'logo/2.png'),
(3, 'Puma', 3, 'logo/3.png'),
(4, 'Reebok', 4, 'logo/4.png'),
(5, 'Umbro', 5, 'logo/5.png'),
(6, 'Lotto', 6, 'logo/6.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelesek`
--

CREATE TABLE `rendelesek` (
  `id` int(5) NOT NULL,
  `vevoid` int(4) NOT NULL,
  `szallitas` varchar(20) NOT NULL,
  `fizmod` varchar(50) NOT NULL,
  `datum` date NOT NULL,
  `statusz` varchar(50) NOT NULL,
  `bosszeg` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rendelesek`
--

INSERT INTO `rendelesek` (`id`, `vevoid`, `szallitas`, `fizmod`, `datum`, `statusz`, `bosszeg`) VALUES
(12, 3, 'posta-utanvet', 'utanvet', '2020-11-23', 'függőben', '59997');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rend_term`
--

CREATE TABLE `rend_term` (
  `id` int(5) NOT NULL,
  `rendelesid` int(5) NOT NULL,
  `termekid` int(5) NOT NULL,
  `db` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rend_term`
--

INSERT INTO `rend_term` (`id`, `rendelesid`, `termekid`, `db`) VALUES
(11, 12, 11, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `tajekoztato`
--

CREATE TABLE `tajekoztato` (
  `id` int(2) NOT NULL,
  `cim` varchar(255) COLLATE utf8_hungarian_ci NOT NULL,
  `content` mediumtext COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `tajekoztato`
--

INSERT INTO `tajekoztato` (`id`, `cim`, `content`) VALUES
(2, 'Vásárlói Tájékoztató', 'ÁLTALÁNOS SZERZŐDÉSI FELTÉTELEK\r\n1. Szerződéskötés:\r\n\r\nAz áruk internetes áruházban történő megjelenítése jogilag kötelező erejű ajánlatnak nem, csupán nem kötelező erejű, internetes katalógusnak minősül. Az áruk a kosár használatával rendelhetők meg. A kiválasztott árut a „kosárba teszem” gombra kattintva helyezheti el a kosárban. A jobb felső sarokban található, kosarat jelképező piktogramra kattintva a kosárban elhelyezett árukat megtekintheti, módosíthatja a mennyiségüket, és törölheti őket. A vásárlás befejezésekor kattintson a „tovább a pénztárhoz” gombra; a rendelését a regisztráció, majd belépés után adhatja le. Facebook-fiókjával vagy e-mail-címével tud regisztrálni. A belépést követően válassza ki a szállítási és fizetési módot. A megrendelés véglegesítése előtt a „megrendelés áttekintése” gomb segítségével ellenőrizheti, hogy nincs-e hibás adat a megrendelésben, és ha van, akkor azt ki is tudja javítani. Végül a „fizetési kötelezettséggel járó megrendelés” gombra kattintva adhatja le a kosárban elhelyezett termékekre vonatkozó megrendelését. A megrendelés beérkezését követően Ön azonnal kap egy visszaigazolást a megrendelésről, amely azonban a részünkről nem minősül a szerződés elfogadásának. A megrendelés akkor minősül elfogadottnak, ha arról e-mailben visszaigazolást küldünk, vagy ha két napon belül feladjuk az árukat.\r\n2. Elállással kapcsolatos tájákoztató\r\n\r\nElállási jog\r\n\r\nÖn 14 napon belül jogosult indokolás nélkül elállni e szerződéstől.\r\n\r\nAz elállási határidő attól a naptól számított 14 nap elteltével jár le, amelyen Ön vagy az Ön által megjelölt, a fuvarozótól eltérő harmadik személy a terméket átveszi.\r\n\r\nHa Ön élni kíván az elállási jogával, elállási szándékát tartalmazó egyértelmű nyilatkozatát köteles eljuttatni (például postán, telefaxon vagy elektronikus úton küldött levél útján) az alábbi címre: Sport GmbH, Domstraße 10, 20095 Hamburg, Németország, telefonszám: 06 80 021-482, faxszám: +49 (40) 638-569-445, e-mail: ugyfelszolgalat@jolallasport.hu Ebből a célból felhasználhatja a mellékelt elállásinyilatkozat-mintát is.\r\n\r\nÖn határidőben gyakorolja elállási jogát, ha a fent megjelölt határidő lejárta előtt elküldi elállási nyilatkozatát.\r\n\r\nAz elállás joghatásai\r\n\r\nHa Ön eláll ettől a szerződéstől, haladéktalanul, de legkésőbb az Ön elállási nyilatkozatának kézhezvételétől számított 14 napon belül visszatérítjük az Ön által teljesített valamennyi ellenszolgáltatást, ideértve a fuvarozási költséget is (kivéve azokat a többletköltségeket, amelyek amiatt merültek fel, hogy Ön az általunk felkínált, legolcsóbb szokásos fuvarozási módtól eltérő fuvarozási módot választott.) A visszatérítés során az eredeti ügylet során alkalmazott fizetési móddal egyező fizetési módot alkalmazunk, kivéve, ha Ön más fizetési mód igénybevételéhez kifejezetten a hozzájárulását adja; e visszatérítési mód alkalmazásából kifolyólag Önt semmilyen többletköltség nem terheli. A visszatérítést mindaddig visszatarthatjuk, amíg vissza nem kaptuk a terméket, vagy Ön nem igazolta, hogy azt visszaküldte: a kettő közül a korábbi időpontot kell figyelembe venni.\r\n\r\nÖn köteles számunkra vagy a GLS számára a terméket indokolatlan késedelem nélkül, de legkésőbb elállási nyilatkozatának közlésétől számított 14 napon belül visszaküldeni vagy átadni. A határidő betartottnak minősül, ha a 14 napos határidő letelte előtt elküldi a terméket.\r\n\r\nA termék visszaküldésének költségeit mi viseljük.\r\n\r\nÖn kizárólag akkor vonható felelősségre a termékben bekövetkezett értékcsökkenésért, ha az a termék jellegének, tulajdonságainak és működésének megállapításához szükséges használatot meghaladó használat miatt következett be.\r\n\r\nElállással kapcsolatos tájékoztató vége\r\n\r\nElállásinyilatkozat-minta\r\n\r\nA jelen nyomtatványt csak akkor töltse ki és juttassa vissza, ha szeretne elállni a szerződéstől:\r\nAlulírott/ak* kijelentem/kijelentjük*, hogy gyakorlom/gyakoroljuk* elállási jogomat/jogunkat*\r\nden az alábbi termék/ek* adásvételére:\r\naz alábbi szolgáltatás* nyújtására irányuló szerződés tekintetében:\r\nszerződéskötés időpontja*/átvétel időpontja*:\r\nA fogyasztó(k) neve:\r\nA fogyasztó(k) címe:\r\nA fogyasztó(k) aláírása (kizárólag papíron tett nyilatkozat esetén):\r\nKelt\r\n\r\n\r\n\r\n________________________________\r\n\r\n* Szükség szerint törlendő.\r\n\r\n3. Az elállási jog kizárása/lejárata:\r\n\r\nA szerződéssel kapcsolatos elállási jog nem gyakorolható olyan nem előre gyártott termék esetében, amelyet a fogyasztó utasítása alapján vagy kifejezett kérésére állítottak elő, vagy olyan termék esetében, amelyet egyértelműen a fogyasztó személyére szabtak, romlandó vagy minőségét rövid ideig megőrző termék tekintetében, olyan zárt csomagolású termék tekintetében, amely egészségvédelmi vagy higiéniai okokból az átadást követő felbontása után nem küldhető vissza.\r\n4. Az áru kézhezvételét követő 90 napon belüli visszaküldéshez fűződő, önként vállalt jog:\r\n\r\nA fentiekben hivatkozott, jogszabályokban előírt elállási jogon túlmenően önként vállalt visszaküldési garanciát biztosítunk Önnek az áruk kézhezvételét követő 90 napos időszakban. A 14 napos elállási idő leteltét követően, az átvételt követő 90 napban (amely időszak az áru kézhezvételét követő napon kezdődik) a szerződéstől úgy is elállhat, ha az árut, amelyet nem kifejezetten a fogyasztó kérésére állítottak elő, vagy amelyet egyértelműen nem a fogyasztó személyére szabtak, hiánytalanul, az eredeti csomagolásában, használatlan vagy sértetlen állapodban visszaküldi. Elég, ha a feladás a határidőn belül történik meg.\r\n\r\nAz árut a következő címre küldheti vissza: Magyar Posta, Fehérakác u. 3. , HU-1097 Budapest.\r\n\r\nA szerződésben kikötött, önként vállalt visszaküldési garancia nem érinti az Ön jogszabályok alapján fennálló jogait és követeléseit, különös tekintettel a jogszabályban biztosított elállási és szavatossági jogra, amelyet Ön továbbra is gyakorolhat.\r\n5. Szállítás:\r\n\r\nKizárólag Magyarország területén vállaljuk az áruk kiszállítását. A kiszállítást általában a GLS végzi. Áruinkat kizárólag kiskereskedelmi mennyiségben és kizárólag a végfelhasználók részére áll módunkban értékesíteni.\r\n6. Szavatosság:\r\n\r\nAbban az esetben, ha a kiszállított terméknek látható anyag- vagy gyártási hibája van, ideértve a szállítás során keletkezett sérüléseket, kérjük, hogy a hibát annak felfedezése után haladéktalanul, de nem később, mint a hiba felfedezésétől számított 2 hónapon belül közölje velünk az ugyfelszolgalat címre küldött e-mailben vagy az alábbi 16. pontban meghatározott címre küldött levélben, vagy pedig az áru átvételekor a GLS munkatársának. Ugyanakkor felhívjuk a figyelmét, hogy a szerződés teljesítésétől számított kétéves elévülési határidőn túl kellékszavatossági jogait már nem érvényesítheti. Kellékszavatossági jogai alapján Ön választása szerint kérhet kijavítást vagy kicserélést, kivéve, ha a választott kellékszavatossági jog teljesítése lehetetlen, vagy ha az a vállalkozás számára – másik kellékszavatossági igény teljesítésével összehasonlítva – aránytalan többletköltséggel járna. Ha a kijavítást vagy a kicserélést nem kérte, illetve nem kérhette, úgy igényelheti az ellenszolgáltatás arányos leszállítását, vagy a hibát a vállalkozás költségére Ön is kijavíthatja, illetve mással kijavíttathatja, vagy – végső esetben – a szerződéstől is elállhat. Jelentéktelen hiba esetén Ön nem jogosult a szerződéstől elállni. Választott kellékszavatossági jogáról egy másikra is áttérhet, az áttérés költségét azonban Ön viseli, kivéve, ha az indokolt volt, vagy arra a vállalkozás adott okot. A teljesítéstől számított hat hónapon belül a kellékszavatossági igénye érvényesítésének a hiba közlésén túl nincs egyéb feltétele. A teljesítéstől számított hat hónap eltelte után azonban már Ön köteles bizonyítani, hogy az Ön által felismert hiba már a teljesítés időpontjában is megvolt.\r\n\r\nAz áru hibája esetén Ön – választása szerint – a fent meghatározott kellékszavatossági jogát vagy termékszavatossági igényt érvényesíthet. Termékszavatossági igényként Ön kizárólag a hibás termék kijavítását vagy kicserélését kérheti. A termék akkor hibás, ha az nem felel meg a forgalomba hozatalakor hatályos minőségi követelményeknek vagy pedig, ha nem rendelkezik a gyártó által adott leírásban szereplő tulajdonságokkal. Termékszavatossági igényét Ön a termék gyártó általi forgalomba hozatalától számított két éven belül érvényesítheti. Termékszavatossági igényét kizárólag az ingó dolog gyártójával vagy forgalmazójával szemben gyakorolhatja. A termék hibáját termékszavatossági igény érvényesítése esetén Önnek kell bizonyítania. A gyártó (forgalmazó) kizárólag akkor mentesül termékszavatossági kötelezettsége alól, ha bizonyítani tudja, hogy:\r\n\r\n    a terméket nem üzleti tevékenysége körében gyártotta, illetve hozta forgalomba; vagy\r\n    a hiba a tudomány és a technika állása szerint a forgalomba hozatal időpontjában nem volt felismerhető; vagy\r\n    a termék hibája jogszabály vagy kötelező hatósági előírás alkalmazásából ered.\r\n\r\nFelhívjuk figyelmét, hogy ugyanazon hiba miatt kellékszavatossági és termékszavatossági igényt egyszerre, egymással párhuzamosan nem érvényesíthet. Termékszavatossági igényének eredményes érvényesítése esetén azonban a kicserélt termékre, illetve kijavított részre vonatkozó kellékszavatossági igényét a gyártóval szemben érvényesítheti.\r\n7. Szállítási költség:\r\n\r\n8. Fizetés:\r\n\r\nA fizetés alapvetően PayPalon keresztül, (MasterCard és Visa) bankkártyával vagy utánvéttel történik. Előrefizetés esetén nem biztosítunk kedvezményt.\r\n\r\nFizetés PayPalon keresztül\r\nFizethet a saját PayPal-számláján keresztül. A megrendelés leadását követően oldalunk átirányítja Önt a PayPal oldalára, ahol kifizetheti a megrendelés értékét. Amint PayPal-számlánkra megérkezik az Ön által adott engedélyről az értesítés, az árukra vonatkozóan meghatározott szállítási határidőtől függően megkezdjük a kiszállítást. A szállításkor PayPal-számláját az esetleges kedvezmények, például kuponok stb., levonása után megterheljük a ténylegesen kiszámlázott összeggel. A megrendelő kérésére előállított vagy egyértelműen a megrendelő személyére szabott áruk esetében PayPal-számláját a kedvezmények, kuponok stb. levonását követően haladéktalanul megterheljük a ténylegesen kiszámlázott összeggel.\r\n\r\nFizetés bankkártyával\r\nA megrendelési folyamat során azonnal tud fizetni, ha megadja bankkártyája adatait. A szállításkor bankkártyáját az esetleges kedvezmények, például kuponok stb., levonása után megterheljük a ténylegesen kiszámlázott összeggel. A megrendelő kérésére előállított vagy egyértelműen a megrendelő személyére szabott áruk esetében bankkártyáját a kedvezmények, kuponok stb. levonását követően haladéktalanul megterheljük a ténylegesen kiszámlázott összeggel.\r\n\r\nFizetés utánvéttel\r\nAz áruk utánvétes fizetése esetén Ön a számlán szereplő összeget készpénzben fizeti ki a csomag átvételekor. A 2. pont szerinti elállás esetén a visszafizetés banki átutalással történik. Ehhez szükségünk van bankszámlája adataira, amelyeket fogyasztói fiókjában könnyen, biztonságosan megadhat. Fenntartjuk a jogot, hogy a visszaküldött áru értékének megfelelő utalványt bocsássunk ki, amennyiben többszöri emlékeztető után sem érhetők el a bankszámlája adatai.\r\n\r\n9. Árak:\r\n\r\nAz áraink forintban értendők, és tartalmazzák a jogszabályokban előírt áfát (bruttó árak). Minden tőlünk telhetőt megteszünk annak érdekében, hogy internetes áruházunk árai pontosak legyenek, ha azonban ennek ellenére hibás árak jelennének meg, nem vagyunk kötelesek az árut a hibás áron értékesíteni. Ilyen esetben a terméket felkínálhatjuk Önnek a helyes áron, Ön pedig jogosult a fenti 2. pontban meghatározottak szerint a szerződéstől elállni. Hibás különösen az az ár többek között, amely nyilvánvalóan hibás vagy aránytalan.\r\n10. A tulajdonjog fenntartása\r\n\r\nA teljes összeg kifizetéséig az áruk a mi tulajdonunkat képezik.\r\n11. Alternatív vitarendezés/Online vitarendezés (ODR)\r\n\r\nAmennyiben valamely határon átnyúló, internetes vásárlásával bármilyen gond merül fel, amelyet nem tud velünk rendezni, panaszát a jóváhagyott vitarendezési testülethez az alábbi felületen keresztül küldheti el (online vitarendezés – ODR: Online Dispute Resolution): https://webgate.acceptance.ec.europa.eu/odr/main/?event=main.home2.show&lng=HU Magyarországon ezenkívül a Budapesti Békéltető Testület jogosult határon átnyúló jogvitákban eljárni (1016 Budapest, Krisztina krt. 99. III. em. 310.; e-mail: bekelteto.testulet@bkik.hu). A fogyasztói békéltető testületek előtt folyó vitarendezési eljárásokban azonban nem vagyunk kötelesek és nem is áll szándékunkban részt venni.\r\n12. A harmadik személyek hivatkozásaival kapcsolatos felelősség kizárása\r\n\r\nOldalainkon vannak olyan hivatkozások, amelyek más internetes oldalakra mutatnak. Ezekre a hivatkozásokra az alábbiak vonatkoznak: Kifejezetten kijelentjük, hogy nincs semmilyen ráhatásunk a hivatkozott oldalak stílusára és tartalmára. Ezért kifejezetten elhatároljuk magunkat a harmadik személyek hivatkozott oldalainak tartalmától, és ezen tartalmakat nem ismerjük el magunkénak. A jelen nyilatkozat minden megjelenő hivatkozásra és a hivatkozásokon keresztül elérhető oldalak minden tartalmára vonatkozik.\r\n13. A szerződés nyelve/a szerződés formája/a megrendelés szövegének tárolása/irányadó jogszabályok:\r\n\r\nA szerződés magyar nyelven jön létre. A szerződés nem minősül a felek között létrejött írásbeli szerződésnek. A megrendelés szövegét nem tároljuk, ezért azok a megrendelés teljesítését követően már nem elérhetőek. Ön azonban jogosult a megrendelés szövegét közvetlenül a megrendelés leadását követően kinyomtatni. A szerződésre a Német Szövetségi Köztársaság jogszabályai az irányadók, azzal azonban, hogy az Egyesült Nemzetek Szövetségének Egyezménye az áruk nemzetközi adásvételi szerződéseiről (Bécsi Vételi Egyezmény) és a kollíziós szabályok alkalmazása kizárt. Ez nem vonatkozik a fogyasztó állandó lakhelye szerinti uniós tagállam kötelezően alkalmazandó fogyasztóvédelmi jogszabályaira. A joghatóság helye Hamburg (Németország), azzal, hogy a fogyasztó jogosult az állandó lakhelye szerinti uniós tagállamban a szerződéssel kapcsolatos bármilyen követelést benyújtani.\r\n');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termekek`
--

CREATE TABLE `termekek` (
  `id` int(5) NOT NULL,
  `kategoria` varchar(100) NOT NULL,
  `nev` varchar(255) NOT NULL,
  `cikkszam` decimal(10,0) NOT NULL,
  `ar` decimal(10,0) NOT NULL,
  `rleiras` varchar(255) NOT NULL,
  `hleiras` mediumtext NOT NULL,
  `kep` varchar(255) NOT NULL,
  `keszlet` int(3) NOT NULL,
  `aktiv` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `termekek`
--

INSERT INTO `termekek` (`id`, `kategoria`, `nev`, `cikkszam`, `ar`, `rleiras`, `hleiras`, `kep`, `keszlet`, `aktiv`) VALUES
(1, '1', 'Adidas ONE M', '1', '23999', 'Férfi melegítő', 'Férfi melegítő, mely tökéletes kényelmet biztosít szabadidő tevlkenységek során.\r\n\r\nAnyag: 100% poliészter\r\n', 'img/adidas-Adidas-ONE-M-HW18-melegito-2376341-00-207292.jpg', 4, 1),
(2, '1', 'Adidas Basics', '2', '19999', 'Férfi melegítő', 'Ez az Adidas melegítő kialakításának köszönhetően optimális kényelmet biztosít.\r\n\r\nAnyag: 100% újrahasznosított poliészter tricot\r\n\r\nKialakítás:\r\nFelső: elöl végig cipzár, álló gallér, oldalzsebek, \r\nNadrág: elasztikus derékrész, Adidas felirat\r\n', 'img/adidas-MTS-BASICS-2421517-00-171462.jpg', 6, 1),
(3, '1', 'Adidas Linear Trainingsanzug', '3', '24999', 'Férfi melegítő', 'Ez az Adidas melegítő kiváló választás sportoláshoz és egyéb szabadtéri tevékenységekhez egyaránt.\r\n\r\nAnyag: French Terry poliészter\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, kapucni behúzózsinórral, kenguruzseb, bordázott mandzsetta és derékrész, \r\nNadrág: elasztikus ferékrész behúzózsinórral, nagy Adidas felirat hátul a nadrágszáron\r\n', 'img/adidas-MTS-LIN-FT-HOOD-2532138-00-201565.jpg', 1, 1),
(4, '1', 'Adidas Back 2 Basics 3-Streifen', '4', '22999', 'Férfi melegítő', 'Kényelmes és strapabíró férfi melegítő lefelé szűkülő nadrágszárral.\r\n\r\nAnyag: 100% poliészter\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, bordázott szegélyek, oldalzsebek, \r\nNadrág: szűkülő nadrágszár, elasztikus derékrész\r\n', 'img/adidas-Pa.souprava-MTS-modra-1-19-2457840-00-175418.jpg', 3, 1),
(5, '6', 'Lotto Triple', '5', '19999', 'Férfi melegítő', 'Kényelmes és divatos Lotto férfi melegítő szabadidős tevékenységekhez.\r\n\r\nAnyag: 90% pamut, 10% viszkóz\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, álló gallér, oldalzsebek, Lotto logó mellrészen, \r\nNadrág: elasztikus derékrész, Lotto logó felül\r\n', 'img/Lotto-Triple-2695019-00-228550.jpg', 6, 1),
(6, '2', 'Nike Dry Academy', '6', '21999', 'Férfi melegítő', 'A Nike Academy melegítő Dri-FIT technológiájának köszönhetően kiváló választás sportoláshoz.\r\n\r\nAnyag: 100% poliészter\r\n\r\nKialakítás:\r\nFelső: elöl végig cipzár, oldalzsebek, Swoosh logó mellrészen, Nadrág: elasztikus derékrész, szűkebb nadrágszár, Swoosh logó\r\n\r\nTechnológia:\r\nDri-FIT: mely kiválóan elvezeti a nedvességet a bőr felszínéről és szárazon tart\r\n', 'img/Nike-Dry-Academy-2437642-00-172558.jpg', 4, 1),
(7, '2', 'Nike Tracksuit Basic', '7', '21999', 'Férfi melegítő', 'Klasszikus Nike melegítő, mely egyszerre sportos és kényelmes viselet.\r\n\r\nAnyag: 100% poliészter\r\n\r\nKialakítás:\r\nFelső: kényelmes, elasztikus derékrész behúzózsinórral, elöl végig cipzár, Nadrág: elasztikus derékrész behúzózsinórral, oldalzsebek, bordázott nadrágszárvég\r\n', 'img/Nike-M-NSW-CE-TRK-SUIT-PK-BASIC-2613430-00-207302.jpg', 5, 1),
(8, '2', 'Nike Tracksuit Basic', '8', '21999', 'Férfi melegítő', 'Klasszikus férfi Nike melegítő, mely egyszerre sportos és kényelmes viselet.\r\n\r\nAnyag:100% poliészter\r\n\r\nKialakítás:\r\nFelső: kényelmes, elasztikus derékrész behúzózsinórral, elöl végig cipzár, \r\nNadrág: elasztikus derékrész behúzózsinórral, oldalzsebek, bordázott nadrágszárvég\r\n', 'img/Nike-M-Nsw-Ce-Trk-Suit-Pk-Basic-2651070-00-263234.jpg', 2, 1),
(9, '3', 'Puma Retro', '9', '17999', 'Férfi melegítő', 'Kényelmes férfi melegítő, mely ideális viselet hűvösebb napokon való sportoláshoz.\r\n\r\nAnyag:100% poliészter\r\n\r\nKialakítás:\r\nFelső: elöl végig cipzár, álló gallér, logó mellrészen, \r\nNadrág: elasztikus derékrész behúzózsinórral, logó nadrágszáron, oldalzsebek\r\n', 'img/Puma-CB-Retro-Tracksuit-Cl.-2554748-00-209184.jpg', 2, 1),
(10, '3', 'Puma Techstripe', '10', '17999', 'Férfi melegítő', 'Kényelmes férfi melegítő, mely ideális választás hűvös napokon való sportoláshoz.\r\n\r\nAnyag: 100% poliészter\r\n\r\nKialakítás nadrág:\r\nOldalzsebek, rugalmas szegély és mandzsetta, magas gallér, CAT logó a mellrészen\r\nKialakítás felső:\r\nOldalzsebek, rugalmas derékrész, Puma Cat logó combrészen\r\n\r\nBluesign® szabvány szerint előállított anyag\r\n', 'img/Puma-Techstripe-Tricot-2749332-00-253109.jpg', 3, 1),
(11, '4', 'Reebok Training Essentials Track Suit', '11', '19999', 'Férfi melegítő', 'Divatos Reebok férfi melegítő, mely ideális választás szabadidős tevékenységekhez.\r\n\r\nAnyag:80% pamut, 20% poliészter\r\n\r\nKialakítás\r\nFelső: elől végig cipzár, bordázott gallér, elasztikus mandzsetta és derékrész, oldalzsebek, Regular Fit, \r\nNadrág: elasztikus derékrész behúzózsinórral, oldalzsebek, elasztikus nadrágszárvég, Slim Fit\r\n', 'img/Reebok-Training-Essentials-Track-Suit-2679149-00-242175.jpg', 5, 1),
(12, '5', 'Umbro TAPED TRACKSUIT JNR', '12', '18290', 'Gyerek melegítő szett', 'Umbro TAPED TRACKSUIT JNR gyerek melegítő szett, mely könnyű, nem megterhelő sporttevékenységre, valamint szabadidőre nagyszerű választás. A kényelmes viselés érdekében a felső hosszú cipzárral készült. A nadrág két oldalzsebbel rendelkezik.', 'img/umbro-65940u-hmk-taped-tracksuit-jnr_0.jpg', 6, 1),
(13, '5', 'Umbro PETTER', '13', '16390', 'Fiú melegítő szett', 'Kellemes és minőségi anyagból készült Umbro PETTER gyerek melegítő szett. A teljes hosszában cipzáras felső névcímkével is el van látva, a nadrág elasztikus dereka pedig zsinórral szabályozható.', 'img/umbro-sokl082-b-petter-teplak-souprava_4.jpg', 3, 1),
(14, '1', 'Adidas New CO Mark', '14', '26999', 'Női melegítő', 'Kényelmes és strapabíró női melegítő lefelé szűkülő nadrágszárral.\r\n\r\nAnyag: 72% pamut, 28% poliészter\r\n\r\nKialakítás:\r\nFelső: elöl végig cipzáros, Adidas felirat a karon, \r\nAlsó: elasztikus derékrész behúzózsinórral, szűkített szár\r\n', 'img/adidas-New-CO-Mark-2532433-00-210116.jpg', 2, 1),
(15, '1', 'Adidas CO MARK', '15', '25999', 'Női melegítő', '\r\nNői Adidas melegítő, amely kiváló választás szabadtéri tevékenységekhez és sportoláshoz egyaránt.\r\n\r\nAnyag: 72% pamut, 28% poliészter\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, Adidas felirat a bal karon, oldalzsebek, álló gallér, \r\nNadrág: Adidas felirat a száron, rugalmas derékrészt húzózsinórral, szűkített szár\r\n', 'img/adidas-WTS-NEW-CO-MARK-2421203-00-171439.jpg', 5, 1),
(16, '6', 'Lotto Miata', '16', '24999', 'Női melegítő', 'Divatos és kényelmes Lotto melegítő szabadidős tevékenységekhez.\r\n\r\nAnyag: 95% pamut, 5% elasztán\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, kontrasztos betétek, behúzózsinórral állítható kapucni, Lotto logó mellrészen, \r\nNadrág: felül Lotto logó a nadrágszáron, elasztikus, kényelmes derékrész, bordázott szegély alul\r\n', 'img/Lotto-Miata-2845650-00-266435.jpg', 4, 1),
(17, '3', 'Puma Amplified Sweat Suit', '17', '22999', 'Női melegítő', 'Ez a Puma melegítő a sportos ruhatár alapdarabja, kényelmes, könnyű viseletet biztosít szabadidős tevékenységek közben.\r\n\r\nAnyag: 66% pamut, 34% poliészter\r\n\r\nKialakítás: \r\nNadrág:Oldalzsebek, bordázott szegély és mandzsetta, normál szabás, PUMA No. 1 logó az ujjrészen\r\nFelső:Oldalzsebek, elasztikus derékrész behúzózsinórral, Puma Cat logó combrészen, szűk szabás\r\n\r\nTechnológia\r\nOEKO-TEX® szabvány szerint előállított anyag\r\n', 'img/Puma-Amplified-Sweat-Suit-2756343-00-243581.jpg', 9, 1),
(18, '3', 'Puma Classic', '18', '21999', 'Női melegítő', '\r\nDivatos és kényelmes Puma női melegítő, mely kiváló választás szabadidős tevékenységekhez.\r\n\r\nAnyag:66% pamut, 34% poliészter\r\n\r\nKialakítás:\r\nFelső: elöl végig cipzár, oldalzsebek, hímzett CAT logó, kapucni behúzózsinórral \r\nNadrág: rugalmas derékrész behúzózsinórral, oldalzsebek, CAT logó\r\n', 'img/Puma-Classic-Sweat-Suit-2756325-00-243528.jpg', 3, 1),
(19, '3', 'Puma Classic', '19', '21999', 'Női melegítő', 'Divatos és kényelmes Puma női melegítő, mely kiváló választás szabadidős tevékenységekhez.\r\n\r\nAnyag: 66% pamut, 34% poliészter\r\n\r\nKialakítás\r\nFelső: elöl végig cipzár, oldalzsebek, hímzett CAT logó, kapucni behúzózsinórral \r\nNadrág: rugalmas derékrész behúzózsinórral, oldalzsebek, CAT logó\r\n', 'img/Puma-TRENIRKA-Z-Classic-Hd.-Sweat-S-2748884-00-237310.jpg', 8, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vevok`
--

CREATE TABLE `vevok` (
  `id` int(4) NOT NULL,
  `nev` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cim` varchar(255) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `pw` varchar(50) NOT NULL,
  `szcim` varchar(255) NOT NULL,
  `felh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `vevok`
--

INSERT INTO `vevok` (`id`, `nev`, `email`, `cim`, `telefon`, `pw`, `szcim`, `felh`) VALUES
(3, 'EZAZ UTOLSÓ', 'final@gmail.com', '123451245', '06232423423', '', '123451245', 'finaletest');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adatok`
--
ALTER TABLE `adatok`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rendelesek`
--
ALTER TABLE `rendelesek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `rend_term`
--
ALTER TABLE `rend_term`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `termekek`
--
ALTER TABLE `termekek`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `vevok`
--
ALTER TABLE `vevok`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adatok`
--
ALTER TABLE `adatok`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT a táblához `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `rendelesek`
--
ALTER TABLE `rendelesek`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT a táblához `rend_term`
--
ALTER TABLE `rend_term`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `termekek`
--
ALTER TABLE `termekek`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT a táblához `vevok`
--
ALTER TABLE `vevok`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
