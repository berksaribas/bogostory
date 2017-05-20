-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 May 2017, 20:51:06
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
(1, 'http://lorempixel.com/800/800/', 2, NULL, NULL),
(2, 'http://lorempixel.com/800/800/', NULL, 3, NULL),
(3, 'http://lorempixel.com/800/800/', NULL, NULL, 6),
(4, 'http://lorempixel.com/800/800/', NULL, 3, NULL),
(5, 'http://lorempixel.com/800/800/', 4, NULL, NULL),
(6, 'http://lorempixel.com/800/800/', NULL, NULL, 5),
(7, 'http://lorempixel.com/800/800/', NULL, 2, NULL),
(8, 'http://lorempixel.com/800/800/', 3, NULL, NULL),
(9, 'http://lorempixel.com/800/800/', NULL, 4, NULL),
(10, 'http://lorempixel.com/800/800/', NULL, NULL, 3),
(11, 'http://lorempixel.com/800/800/', 1, NULL, NULL),
(12, 'http://lorempixel.com/800/800/', 5, NULL, NULL);

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
(2, 'Alex chooses to take the book.', ' Aliquam eget lacinia diam. Mauris vitae iaculis orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum pharetra vitae ex vitae commodo. Duis ultricies, nulla et dignissim rhoncus, enim ligula hendrerit arcu, eu sagittis dui lectus auctor arcu. Duis vel diam vitae nulla fringilla rhoncus id vel mauris. Fusce rutrum laoreet mi, et tincidunt dui viverra consectetur. Aliquam ipsum justo, faucibus at laoreet eu, pharetra in risus. Aliquam erat volutpat. Etiam volutpat sapien quis metus posuere sodales. Cras mi diam, congue tempus risus sit amet, fermentum pulvinar quam. Praesent fermentum nec massa vel viverra. Proin ut consectetur lacus, nec tempor nibh. Ut at nulla eget odio mattis placerat a id est. Proin eu placerat mi, quis porttitor nisl. ', 1, 4, NULL),
(3, 'Diana makes her mind to get revenge.', ' Quisque id posuere lorem. Phasellus at ipsum interdum, suscipit mi suscipit, feugiat eros. Nunc sed hendrerit nibh. Sed imperdiet sollicitudin felis, a molestie justo cursus et. Duis dignissim ante eget tincidunt rutrum. Fusce et elementum neque. Suspendisse volutpat lacus nibh, at imperdiet dolor ornare ut. Vestibulum odio nibh, molestie id consequat et, bibendum ac orci. Donec euismod tortor enim. ', 2, 5, NULL),
(4, 'Suddenly, his son arrives.', ' Nulla tristique lacus vehicula neque eleifend, vitae convallis nibh vehicula. Donec consequat tortor non ex iaculis efficitur. Curabitur suscipit eget urna in consectetur. Cras porta urna eros, et fermentum enim efficitur et. Donec ut posuere nisl. In nunc justo, rutrum in leo non, euismod condimentum risus. Donec et erat tellus. Integer volutpat orci id erat maximus sodales. Vivamus quis interdum leo, faucibus lacinia est. Suspendisse magna erat, venenatis a dapibus eget, placerat id orci. Donec condimentum, ante facilisis aliquet sodales, leo arcu aliquam tortor, vitae sollicitudin arcu diam eget tortor. Mauris id tortor vel augue viverra lacinia nec nec est. Aenean sodales eleifend neque sed accumsan. Nullam sit amet sem dolor. Fusce varius quis libero at lobortis. Nam tempor velit enim. ', 3, 2, NULL),
(5, 'Finally, he manages to earn money.', ' Donec pellentesque mattis luctus. Morbi pulvinar neque vitae purus porta ultricies. Fusce eget pellentesque dolor, sed interdum nisi. Nunc hendrerit cursus odio nec tincidunt. Aliquam commodo justo vitae erat elementum varius. Integer eget commodo nulla. Nunc efficitur augue sit amet orci gravida, non porta felis ultrices. Etiam mollis lobortis ante sit amet maximus. Suspendisse id pellentesque quam. Etiam malesuada porta fringilla. Etiam elementum enim ut viverra tempus. Aenean ornare sapien ut neque efficitur, ut rutrum est condimentum. Integer sed ante quis leo pretium ullamcorper tristique sit amet lorem. Nullam ac dapibus nisl. Maecenas pretium augue eu turpis tincidunt, tincidunt imperdiet urna elementum. ', 4, 1, NULL),
(6, 'She walks away.', ' Sed placerat posuere velit, eget maximus purus tincidunt id. Integer in nisl euismod, consectetur nisi nec, ultricies dolor. Proin luctus arcu et est viverra, nec volutpat mi semper. Nunc efficitur in turpis eu condimentum. In pharetra fermentum est, eu gravida massa tristique et. Nunc est enim, aliquet a eros id, dignissim varius leo. Curabitur finibus et elit vel porta. Mauris a ipsum eu quam porta faucibus eu et magna. Nunc ultrices, quam eget ultrices consequat, tellus ex egestas nunc, a gravida erat velit ut nibh. Vivamus venenatis, lacus vitae tincidunt rutrum, neque mi tincidunt purus, ac pretium felis tortor eu est. Proin nec nisi nec sapien sagittis vestibulum. Sed sed egestas nulla. ', 5, 3, NULL);

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
('Neque Porro', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae ex nibh. Sed vel ipsum a dolor placerat tincidunt non mollis risus. Donec porta eget dolor quis facilisis. Vivamus lobortis lectus purus, a congue magna rutrum sed. Maecenas id velit pellentesque, pellentesque diam tempus, dapibus ipsum. Duis tincidunt velit ex, vitae posuere lacus aliquam non. Vestibulum a massa quis neque euismod molestie et non sapien. Curabitur ut eros dapibus ligula vulputate tristique eget vitae erat. Curabitur nisl nunc, luctus in massa id, volutpat pharetra nibh. Aenean eget ex odio. Quisque dictum est posuere sapien blandit pulvinar. Curabitur porta sollicitudin orci vel cursus. Phasellus mauris enim, dignissim a congue eu, tristique ac ligula. Sed augue orci, tincidunt eu massa ac, lacinia dapibus diam. Ut porta volutpat imperdiet. Cras id mi ipsum. ', 1, 1),
('Quisquam Est', 2, ' Aenean ultricies viverra interdum. Curabitur tristique massa posuere ipsum ullamcorper scelerisque. Vivamus nec ultricies dui. Donec consectetur lobortis nunc, id mollis mauris dapibus eget. Aliquam at purus euismod, pellentesque ex eget, hendrerit dolor. Sed ut mi sodales, sodales elit nec, mollis libero. Morbi id lectus eu lacus bibendum aliquam tempus eget magna. Mauris consectetur elit pharetra mi maximus hendrerit quis id quam. Vestibulum ultricies tortor vel sem tempor, a aliquet neque efficitur. Nam vel odio pretium, pellentesque lacus vitae, facilisis nunc. Nunc ultricies, felis a egestas laoreet, nunc turpis condimentum elit, in bibendum justo enim in arcu. Ut massa felis, pharetra sit amet ante ac, tempor porttitor est. ', 2, 5),
('Sit Amet', 3, ' Aliquam lobortis leo sed quam commodo, quis porttitor turpis suscipit. Nunc ac lorem et massa mollis scelerisque. Nunc dignissim, diam in viverra lobortis, sem nunc suscipit velit, vel suscipit risus urna eu elit. Sed ullamcorper, mi sit amet porttitor posuere, mi est dapibus nisi, quis ornare augue justo ut enim. Suspendisse tincidunt suscipit cursus. Proin tempor tortor eu justo molestie interdum. Duis quis dolor scelerisque magna viverra pulvinar in sed ligula. Sed ultricies placerat rutrum. Vivamus mattis cursus imperdiet. Aenean ultricies lacus elit, a mattis erat aliquet eu. Nam nec dui nec dui fermentum mollis id sit amet ex. ', 3, 4),
('Consectetur', 4, ' Aliquam lobortis leo sed quam commodo, quis porttitor turpis suscipit. Nunc ac lorem et massa mollis scelerisque. Nunc dignissim, diam in viverra lobortis, sem nunc suscipit velit, vel suscipit risus urna eu elit. Sed ullamcorper, mi sit amet porttitor posuere, mi est dapibus nisi, quis ornare augue justo ut enim. Suspendisse tincidunt suscipit cursus. Proin tempor tortor eu justo molestie interdum. Duis quis dolor scelerisque magna viverra pulvinar in sed ligula. Sed ultricies placerat rutrum. Vivamus mattis cursus imperdiet. Aenean ultricies lacus elit, a mattis erat aliquet eu. Nam nec dui nec dui fermentum mollis id sit amet ex. ', 4, 2),
('Non Tellus', 5, ' In tellus sapien, laoreet at purus ut, vulputate viverra nunc. Fusce malesuada faucibus nisl, ac ultrices enim. Praesent bibendum velit orci. Fusce nec odio at turpis luctus rhoncus at nec sapien. Sed hendrerit nulla vitae elit interdum molestie. Nullam euismod odio id lorem tincidunt, sit amet consectetur nibh mattis. Phasellus aliquam nisi sed bibendum dignissim. Proin porttitor risus non cursus condimentum. Donec mauris urna, scelerisque eget mauris a, finibus vulputate quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. ', 5, 5);

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
(6, 'okmmjyygv', 'okmmjyygv@gmail.com', '47e5eb748ecffde8e1f83f3b46568245e4e03557', 'https://scontent.fada1-10.fna.fbcdn.net/v/t1.0-9/12654282_10207538698639737_1663364909372502986_n.jpg?oh=06b59e44f09b387ae8c941e83290d257&oe=5977E81D');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `votes`
--

CREATE TABLE `votes` (
  `positive` tinyint(1) NOT NULL,
  `vid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `votes`
--

INSERT INTO `votes` (`positive`, `vid`, `uid`, `sid`, `pid`) VALUES
(1, 1, 2, 2, NULL),
(1, 2, 3, 4, NULL),
(1, 3, 2, 5, NULL),
(-1, 4, 1, 2, NULL),
(-1, 5, 2, NULL, 4),
(1, 6, 1, NULL, 2),
(1, 7, 2, NULL, 5),
(1, 8, 4, NULL, 3),
(-1, 9, 1, 2, NULL),
(1, 10, 4, NULL, 2);

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
-- Tablo için indeksler `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`vid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `sid` (`sid`),
  ADD KEY `pid` (`pid`);

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
-- Tablo için AUTO_INCREMENT değeri `stories`
--
ALTER TABLE `stories`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Tablo için AUTO_INCREMENT değeri `votes`
--
ALTER TABLE `votes`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
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
-- Tablo kısıtlamaları `stories`
--
ALTER TABLE `stories`
  ADD CONSTRAINT `stories_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `categories` (`cid`),
  ADD CONSTRAINT `stories_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Tablo kısıtlamaları `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `stories` (`sid`),
  ADD CONSTRAINT `votes_ibfk_3` FOREIGN KEY (`pid`) REFERENCES `paths` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
