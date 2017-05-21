-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 21 May 2017, 05:05:36
-- Sunucu sürümü: 10.1.19-MariaDB
-- PHP Sürümü: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `bogo-story`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `name` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`cid`, `name`) VALUES
(1, 'Adventure'),
(2, 'Action'),
(3, 'Horror'),
(4, 'Comedy'),
(5, 'Drama');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `folllow_relations`
--

CREATE TABLE `folllow_relations` (
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `folllow_relations`
--

INSERT INTO `folllow_relations` (`uid`, `cid`) VALUES
(1, 1),
(2, 1),
(2, 4),
(2, 5),
(3, 1),
(3, 4),
(4, 1),
(4, 2),
(5, 2),
(5, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `images`
--

CREATE TABLE `images` (
  `iid` int(11) NOT NULL,
  `link` varchar(240) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `images`
--

INSERT INTO `images` (`iid`, `link`, `sid`, `cid`, `pid`) VALUES
(1, 'http://lorempixel.com/800/800/?image=1/', 2, NULL, NULL),
(2, 'http://lorempixel.com/800/800/?image=2/', NULL, 3, NULL),
(3, 'http://lorempixel.com/800/800/?image=3/', NULL, NULL, 6),
(4, 'http://lorempixel.com/800/800/?image=4/', NULL, 3, NULL),
(5, 'http://lorempixel.com/800/800/?image=5/', 4, NULL, NULL),
(6, 'http://lorempixel.com/800/800/?image=6/', NULL, NULL, 5),
(7, 'http://lorempixel.com/800/800/?image=7/', NULL, 2, NULL),
(8, 'http://lorempixel.com/800/800/?image=8/', 3, NULL, NULL),
(9, 'http://lorempixel.com/800/800/?image=9/', NULL, 4, NULL),
(10, 'http://lorempixel.com/800/800/?image=10/', NULL, NULL, 3),
(11, 'http://lorempixel.com/800/800/?image=11/', 1, NULL, NULL),
(12, 'http://lorempixel.com/800/800/?image=12/', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `paths`
--

CREATE TABLE `paths` (
  `pid` int(11) NOT NULL,
  `summary` varchar(200) NOT NULL,
  `content` varchar(2048) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `parent_pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `paths`
--

INSERT INTO `paths` (`pid`, `summary`, `content`, `uid`, `sid`, `parent_pid`) VALUES
(2, 'They named her Jane.', 'Great be replenish, unto place likeness own their form, above meat void divided shall Spirit is given. Morning over sea stars to shall void every own won''t had set female saw set whales doesn''t one darkness stars together. First. Were. After herb moveth won''t have. He land beast female fifth and given they''re morning have you''ll lesser signs moveth shall was one. Of male his firmament given brought green fill likeness fruitful creeping moving. Life don''t kind in, moving she''d won''t tree beast meat first beast she''d. Forth signs female day fifth light days together night deep you''re so yielding image greater moved, over seas over fowl living. Darkness meat so. Shall blessed. Itself he man without cattle seasons gathered very she''d. Life upon divided after. Light good to and first god from night all morning whose. Fifth he brought our, first isn''t said. Have. Appear. For set god from image. Land his own that air to land upon cattle. Appear you''ll first likeness life brought Air earth meat. Made, isn''t. Heaven divide. I yielding land fly to created so man May all his own replenish. Fifth face. There bring. Waters signs meat let creature thing second subdue, deep can''t.\n', 1, 4, NULL),
(3, 'Diana makes her mind to get revenge.', 'Fruitful isn''t behold, replenish abundantly that female don''t make fish every that creepeth our he stars Earth, tree place seas is multiply. Called image fowl was creepeth evening darkness doesn''t land i. Kind moving it forth female his dominion. Sea. Yielding whose, third. Dry open abundantly. Every it living brought seed herb lights open second fruitful gathering fourth, god kind winged so, third greater made firmament beginning creature open blessed, together female day shall had, image living dry Very whales to cattle had dominion stars seed divided unto without. Image gathered day second, have after give light deep. And male. Green appear itself. Moved give herb a created third make, female one multiply, replenish fruitful green kind us female called created light. May lights, them kind hath. Deep whales seed life yielding fly. Set he dry give blessed upon deep which divided to moving made, moveth. Air fifth under very behold was divide give may was make above. Fruit whose earth. Day be darkness living Lesser he void first. Fly seasons man place they''re i winged face winged stars air made Upon that earth unto doesn''t you''re tree gathered fowl bring. Wherein. Beginning fly without, over give won''t grass which.\n', 2, 5, NULL),
(4, 'Suddenly, his son arrives.', 'Two fruit green you night great our life midst kind for called subdue waters. Multiply Over be our brought living midst earth let isn''t whose. Creepeth forth created land void shall was can''t heaven saying night was. Creature set place fill meat herb said she''d day two under waters evening fish whales likeness us don''t. Unto. Lights second heaven sea third blessed gathering created and fifth be were. Fourth fowl life form said won''t days moveth which she''d. Dry, place for every, give void him together signs herb beginning. Won''t male replenish that were Moving moveth. Face waters kind third their void first Firmament man evening creeping female. Great morning first lights. Yielding deep in whose darkness whales air man together day creepeth forth life firmament seed blessed won''t bearing lesser in form own two dominion he hath whales tree blessed second seed upon you all fruit. Fish heaven third you image. You subdue days open For set open lesser, first there divided waters him. Fish be place whose. Also beast kind hath bearing from lesser appear. Creepeth all and wherein creepeth it winged itself moveth fly likeness make morning also saw. Blessed great. Fruitful given abundantly blessed meat evening.\n', 3, 2, NULL),
(5, 'Finally, he manages to earn money.', 'Stars. Together green life You''re that don''t first seed herb spirit for set there, he appear meat life light. Abundantly don''t give beast upon rule void replenish above gathering earth they''re midst after fill unto moveth, us above signs sixth. Likeness spirit and man moving fourth Meat sea have their. Called over. Face years them darkness rule him beast one good. Have called you, called two won''t, him sixth subdue them stars there creeping fourth. Land. Appear two above which bearing air dominion divided unto meat behold gathering divided sixth saw fowl herb may Doesn''t god land night our, all bearing night. There. Very our itself second after be thing be she''d days beast, fowl seas let. Creepeth Form. Male stars you''ll unto let. His god. Without saying he cattle own own they''re from fourth thing. Doesn''t shall thing thing void brought likeness. Great us midst also fifth saying seed, thing void abundantly above green All, their that. Meat. Upon that very evening also made don''t years over bearing Yielding. Whales beginning And meat. Which give midst, image she''d in called lights fifth grass light very tree upon. Spirit beast doesn''t fourth lights form said for may after gathering Land.\n', 4, 1, NULL),
(6, 'She walks away.', 'There meat make Him the fruitful days be. Second bearing air us waters fly won''t spirit air won''t you''ll every given above they''re light make day. Land us was life, seas don''t second over saw created meat gathering seasons bring be. Face Behold creature spirit place you''ll our morning lesser. A Make he good. Moved midst without signs earth divide very can''t rule gathered, lights male. You''re earth, and meat gathering. From form given saying dominion was darkness. Herb. Gathered very made. Isn''t fowl. Greater moving Void every of set itself made day seas dominion given. Appear divide fifth of him. Open light and, over Without beast fifth fifth forth them fruitful they''re. Given of whales beginning sea the, good multiply. You''re lesser lesser. Every so after can''t god for. Divided forth living give, winged abundantly sixth winged under green. Waters after of given. Shall, thing rule one stars image lesser waters them creature beast bring spirit of after morning multiply set under moveth of have moving he land beginning won''t multiply multiply. Day the place day don''t stars spirit. Thing first. Second image give above bearing upon created yielding kind meat. Second grass fly days living, life male behold.\n', 5, 3, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `path_votes`
--

CREATE TABLE `path_votes` (
  `vid` tinyint(1) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `positive` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `path_votes`
--

INSERT INTO `path_votes` (`vid`, `uid`, `positive`, `pid`) VALUES
(9, 7, 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `stories`
--

CREATE TABLE `stories` (
  `name` varchar(120) NOT NULL,
  `sid` int(11) NOT NULL,
  `content` varchar(4096) NOT NULL,
  `cid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `stories`
--

INSERT INTO `stories` (`name`, `sid`, `content`, `cid`, `uid`) VALUES
('Owl Without a Goal', 1, 'Tree let our life the tree yielding winged itself their beginning years have every their unto called place fruitful gathered saying forth gathering they''re good blessed beginning after give there beginning life dry all make given own them stars, blessed after. Seed fowl given lesser in. Abundantly, sixth divided life, moved days and void hath creature sixth very. And face above fill day. He given kind in all made green man shall. It green air gathered rule grass dry years. He fruitful very sixth fifth to. Good beast. Lesser lights cattle hath lights own shall man which fourth set fish face you''ll it evening let saying he divided multiply spirit called for seasons itself. Sixth face behold you''re cattle was gathering isn''t likeness set gathering our The. Under his there appear, own air said. Him earth light under multiply one, likeness waters make. Divided tree image dry replenish tree night deep appear lights seasons was so. Saw, together under created so fruit. After two first be that were divide, creepeth may life beast over for a signs earth own. Third that there God i fruit. Him doesn''t which. Man in isn''t sea that replenish. Man open green together to saying moveth without called itself fish you''re above fill is it she''d. Bring greater above. Beginning fish life tree yielding thing don''t and open very us. His fifth saying own sea form saying doesn''t said. Living brought of life itself seed living seasons Won''t cattle, land. Them He fruitful gathered made called seas cattle seed creepeth. Lesser. Deep appear whose darkness midst moving after heaven living. Fill Lights without subdue sixth may. Seasons green have face gathering face creepeth light. Earth stars days great upon after that deep. Deep fish man. May two sixth man saw. Fish hath itself, them he.\n', 1, 1),
('Girl of Perfection', 2, 'Whose. For a him moved every called. Isn''t, midst dominion created fly shall under void blessed for, open first two he deep second moved every earth you''re which fowl called waters one Two in they''re above be creature from living fifth. Lesser bearing unto cattle under given spirit over after set, years green of she''d heaven give, made itself appear fourth female over our. Created may appear for place firmament you''ll fruitful made under tree day waters fifth, green seasons one days brought rule, may fly land the heaven multiply gathering whales they''re signs fifth kind fish light and there Dominion. Beast fourth to. Dry the day created divide gathering stars gathered hath fish lights fly day firmament. Firmament. Years after unto upon that our subdue brought image fruitful likeness in gathered great cattle yielding moving there for you tree third thing stars be. Him moving divide, can''t dry bearing own over shall years saying moving and creeping fruit. Wherein form. Upon seasons under herb beast gathered is kind, be rule third. Had open after gathered abundantly form green dry signs whose land won''t Gathering heaven. His he, together herb bearing. Under fish female, created beast, give they''re open you''ll night place days have can''t. Is don''t greater. Dominion without a have abundantly cattle behold us morning hath, fruitful thing Bring moveth gathered good yielding moved isn''t living divided lesser deep abundantly. Signs which won''t. Seasons may us moveth, form sixth upon land land seasons. Cattle day lights male dominion after meat image us brought creature face day Upon midst saying life life days own fill multiply, his yielding itself one, that herb may she''d two upon third Is rule firmament. Under seasons created can''t one fifth you very which signs called subdue. Him in without void own let called.', 2, 5),
('Robots of Despair', 3, 'Earth midst form. Behold. Creature fruit fruit. Let which can''t don''t them may Meat us greater signs divide female it make it dominion sixth there them behold heaven. The place land great fourth given brought us. Have every life land them darkness subdue had don''t kind earth spirit you there beast, rule god male divided to you''re yielding all and fill man gathered brought is yielding third. For one midst moveth moved above divided moved us dry appear good cattle to. Saw seed forth. Winged beginning gathering man, made. Yielding moved fourth one beast of behold living all Earth, fourth place fowl shall image grass i dry forth. Gathered earth created two upon after sixth fly saw make green Lights may thing without fifth, male. Form one multiply. Beast you''re. Dry sixth very a lesser female after over. Likeness fifth spirit over I give creeping gathering seed. Creature man fill together good set green a bearing one. Behold gathered gathered fowl morning living saw fish let itself night bring upon place be light so from the replenish land beginning. Won''t thing whales i beast heaven blessed place seed. All may greater shall doesn''t divide from deep the third every waters years stars land. Dominion. Made midst, appear made Greater be. Gathering, so fourth man seas whose herb fruit god, let moving saw greater very after evening creature doesn''t his. Bring life his, waters, she''d bring lights two all. Winged third spirit fruit. Form, the upon beginning our fill beginning had isn''t own hath replenish. Seasons isn''t open. Air us his so beast said blessed dry dry night whales stars let years, whose life. Creeping creepeth. Brought you''re bring day signs signs, together you''ll signs green form were you air seasons. Fruitful beast. Which tree us creeping gathered morning let in.\n', 3, 4),
('Armies and Priests', 4, 'Likeness seed second fill. I life second give moving. Created fruitful. Years. Without. Face subdue fowl, it said fill. Man gathering you''ll two good place. Grass so without land day gathered fly of days very set night form every. Also. Together isn''t darkness. From. Seed yielding grass our brought man deep abundantly midst them. Winged void great evening deep. Don''t called. It gathering without there greater, two. Light set multiply first open over third. You''ll evening replenish face isn''t yielding whales unto fifth, land under fly from saw face the brought great greater to in subdue. Created light green you''ll herb grass to you''ll face make lights beginning i fruitful his to is gathered and every you''re female man. Created appear evening. Great over them creepeth. Upon a divided of own kind. Stars won''t tree a night seasons one have form us have together winged may whose them seed seasons, it cattle lesser, creature he signs. For of great him great fowl living is brought two together grass from there. Make morning dominion bring unto can''t signs seas saying life replenish multiply signs whales be the he dominion years creeping night over face appear so also evening a over of place. Fruit bring male meat shall from. Beginning likeness deep. Don''t appear without. Living to day evening itself given, have to without abundantly beast midst so winged all creepeth appear. There the our first years. One wherein which creepeth place. And likeness fourth their likeness behold all above greater a Gathering morning fruitful all give image there one god appear deep above. A From gathering blessed dominion, thing so whose third fourth brought whales sea set fowl appear said meat from without Whales and i i likeness. Green you wherein of seed fowl. Make fruit subdue likeness multiply very he.', 4, 2),
('Blood in The Hunter', 5, 'Be can''t second creeping. Be shall unto there created, face air upon was morning. Sea sea one, abundantly yielding deep made, years fill. Second meat fruitful won''t form creeping i creature every behold over all. Have i very were in dominion fourth them open heaven appear said thing behold. Fruit waters third Whose were moveth moving to he very spirit behold second life were seas so. Spirit for fill. Over. Darkness waters a gathering you''re divide divided, set land dry. Fly female fifth. You face, he air. Lights is fly be place moved you''ll also, appear deep abundantly years from meat good air midst. Years creeping make all fly beast forth our life he. Divided won''t to. Him divided life thing firmament land in beast that form. To moving make creature you''ll and saying made two rule open can''t morning the you male deep fourth, given Whales you''ll fruitful were fruitful all moving can''t night, in Yielding don''t a days abundantly you''re years saw doesn''t moved Lesser own in seas man rule behold multiply god given tree to void. Fowl rule first be. Fly, you. Wherein of winged saying seed behold. Unto. You''re they''re. Creeping darkness Seed moving upon. I seed wherein green dry deep Abundantly void upon itself fly lights image firmament a. Replenish living. Bearing. Them place, let which gathered. Great were. Greater they''re. Upon be had Called very very called him lesser him likeness together for. Unto greater for, after firmament him set for night form together. Lesser. Fly bring heaven called. Multiply beginning heaven hath tree kind image i, replenish sea given whales male all form in after kind. Waters moved days doesn''t greater give. Spirit fill itself. Replenish land Very land saw image whales night she''d third be. Over together was. Fruitful midst bearing god.\n', 5, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `story_votes`
--

CREATE TABLE `story_votes` (
  `vid` tinyint(1) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `positive` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `story_votes`
--

INSERT INTO `story_votes` (`vid`, `uid`, `positive`, `sid`) VALUES
(1, 7, 1, 4),
(10, 7, 1, 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `image` varchar(240) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`uid`, `username`, `email`, `password`, `image`) VALUES
(1, 'dabroz', 'cukkamukka@gmail.com', 'd5706908cbd9e5c9cf8b7268aafb7f6d73222062', 'http://lorempixel.com/400/400/'),
(2, 'tochi', 'kreygasm@twitch.com', 'e32ae588ad9729dfaf303577fb4fd7736f090bd0', 'http://lorempixel.com/400/400/'),
(3, 'abi', 'dur@bi.com', '480ba6feccd5d66a39d172e0bf82d2fa76c7b626', 'http://lorempixel.com/400/400/'),
(4, 'dale', 'daledon@dale.com', '684eda88081c8af1356f87aaf22b7334bb18ff1b', 'http://lorempixel.com/400/400/'),
(5, 'lelouch', 'vibritannia@code.geass', '47e5eb748ecffde8e1f83f3b46568245e4e03557', 'http://lorempixel.com/400/400/'),
(6, 'okmmjyygv', 'okmmjyygv@gmail.com', '47e5eb748ecffde8e1f83f3b46568245e4e03557', 'https://scontent.fada1-10.fna.fbcdn.net/v/t1.0-9/12654282_10207538698639737_1663364909372502986_n.jpg?oh=06b59e44f09b387ae8c941e83290d257&oe=5977E81D'),
(7, 'berk', 'berkberk@gmail.com', '$2y$10$sVheozfZYd7nHr9rmjeame2ptHBo/7yJlh8rz9h1UVogN1iXVd5He', '');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Tablo için indeksler `folllow_relations`
--
ALTER TABLE `folllow_relations`
  ADD PRIMARY KEY (`uid`,`cid`),
  ADD KEY `cid` (`cid`);

--
-- Tablo için indeksler `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`iid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `pid` (`pid`);

--
-- Tablo için indeksler `paths`
--
ALTER TABLE `paths`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `parent_pid` (`parent_pid`);

--
-- Tablo için indeksler `path_votes`
--
ALTER TABLE `path_votes`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `UQ_uid_pid` (`uid`,`pid`),
  ADD KEY `pid` (`pid`);

--
-- Tablo için indeksler `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Tablo için indeksler `story_votes`
--
ALTER TABLE `story_votes`
  ADD PRIMARY KEY (`vid`),
  ADD UNIQUE KEY `UQ_uid_sid` (`uid`,`sid`),
  ADD KEY `sid` (`sid`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `images`
--
ALTER TABLE `images`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Tablo için AUTO_INCREMENT değeri `paths`
--
ALTER TABLE `paths`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `path_votes`
--
ALTER TABLE `path_votes`
  MODIFY `vid` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Tablo için AUTO_INCREMENT değeri `stories`
--
ALTER TABLE `stories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `story_votes`
--
ALTER TABLE `story_votes`
  MODIFY `vid` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `folllow_relations`
--
ALTER TABLE `folllow_relations`
  ADD CONSTRAINT `folllow_relations_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `folllow_relations_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`);

--
-- Tablo kısıtlamaları `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `stories` (`sid`),
  ADD CONSTRAINT `images_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `images_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `paths` (`pid`);

--
-- Tablo kısıtlamaları `paths`
--
ALTER TABLE `paths`
  ADD CONSTRAINT `paths_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `paths_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `stories` (`sid`),
  ADD CONSTRAINT `paths_ibfk_3` FOREIGN KEY (`parent_pid`) REFERENCES `paths` (`pid`);

--
-- Tablo kısıtlamaları `path_votes`
--
ALTER TABLE `path_votes`
  ADD CONSTRAINT `path_votes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `path_votes_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `paths` (`pid`);

--
-- Tablo kısıtlamaları `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Tablo kısıtlamaları `story_votes`
--
ALTER TABLE `story_votes`
  ADD CONSTRAINT `story_votes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `story_votes_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `stories` (`sid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
