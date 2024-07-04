-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 13 Cze 2024, 20:48
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `meble`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `carts`
--

CREATE TABLE `carts` (
  `id_cart` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `categories`
--

INSERT INTO `categories` (`id_category`, `name`) VALUES
(1, 'Łazienka'),
(2, 'Kuchnia'),
(3, 'Salon'),
(4, 'Garderoba'),
(5, 'Sypialnia'),
(6, 'Komoda');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `couriers`
--

CREATE TABLE `couriers` (
  `id_courier` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `couriers`
--

INSERT INTO `couriers` (`id_courier`, `name`, `price`) VALUES
(1, 'DHL', 25.6),
(2, 'DPD', 30.5),
(3, 'Inpost', 22.75);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `fur_list`
--

CREATE TABLE `fur_list` (
  `id_fur` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `id_mat` int(11) NOT NULL,
  `max_hight` float NOT NULL,
  `min_hight` float NOT NULL,
  `max_width` float NOT NULL,
  `min_width` float NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `fur_list`
--

INSERT INTO `fur_list` (`id_fur`, `name`, `id_mat`, `max_hight`, `min_hight`, `max_width`, `min_width`, `id_category`) VALUES
(1, 'Szafka', 5, 200, 80, 100, 80, 4),
(2, 'Drzwi', 1, 200, 180, 100, 80, 5),
(3, 'Drzwiczki', 2, 50, 40, 50, 40, 1),
(4, 'Uchwyt', 4, 6, 4, 10, 8, 3),
(5, 'Stół', 3, 100, 70, 200, 150, 2),
(6, 'Krzesło', 1, 100, 50, 60, 40, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `materials`
--

CREATE TABLE `materials` (
  `id_mat` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `price` float NOT NULL,
  `color` varchar(7) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `materials`
--

INSERT INTO `materials` (`id_mat`, `name`, `price`, `color`) VALUES
(1, 'Heban', 500, '#322D2D'),
(2, 'Mahoń', 50, '#8E243C'),
(3, 'Dąb', 70, '#8B6131'),
(4, 'Stal', 80, '#C4C4C4'),
(5, 'Buk', 120, '#987B5A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date` date NOT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `courier` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `payment_method` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL,
  `status` enum('zapłacono','oczekiwanie') CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id_order`, `id_user`, `date`, `address`, `courier`, `payment_method`, `status`) VALUES
(1, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'blik', 'zapłacono'),
(2, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'blik', 'zapłacono'),
(3, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'blik', 'zapłacono'),
(4, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'Inpost', 'blik', 'zapłacono'),
(5, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'blik', 'zapłacono'),
(6, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'blik', 'zapłacono'),
(7, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'Inpost', 'blik', 'zapłacono'),
(8, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'blik', 'zapłacono'),
(9, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'blik', 'zapłacono'),
(10, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'Inpost', 'blik', 'zapłacono'),
(11, 11, '2024-06-12', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'onShop', 'oczekiwanie'),
(12, 11, '2024-06-13', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'onShop', 'oczekiwanie'),
(13, 11, '2024-06-13', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'onShop', 'oczekiwanie'),
(14, 11, '2024-06-13', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'onShop', 'oczekiwanie'),
(15, 11, '2024-06-13', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DHL', 'onShop', 'oczekiwanie'),
(16, 11, '2024-06-13', 'Gdańsk ul. Księdza Tischnera Józefa 86', 'DPD', 'onShop', 'oczekiwanie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_ele`
--

CREATE TABLE `order_ele` (
  `id_order_ele` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `order_ele`
--

INSERT INTO `order_ele` (`id_order_ele`, `id_order`, `id_product`, `quantity`) VALUES
(1, 3, 2, 1),
(2, 4, 1, 1),
(3, 5, 1, 1),
(4, 6, 2, 1),
(5, 7, 4, 1),
(6, 8, 1, 1),
(7, 9, 4, 1),
(8, 10, 1, 1),
(9, 11, 11, 1),
(10, 12, 5, 1),
(11, 13, 5, 1),
(12, 14, 5, 1),
(13, 15, 5, 1),
(14, 16, 5, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_services`
--

CREATE TABLE `order_services` (
  `id_order_services` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `order_services`
--

INSERT INTO `order_services` (`id_order_services`, `id_order`, `id_service`) VALUES
(1, 11, 0),
(2, 11, 3),
(3, 13, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_polish_ci NOT NULL,
  `price` float DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `img_file` text COLLATE utf8mb4_polish_ci NOT NULL,
  `description` text COLLATE utf8mb4_polish_ci DEFAULT NULL,
  `qauntity` int(11) NOT NULL,
  `product_type` enum('simple','configurable') COLLATE utf8mb4_polish_ci NOT NULL,
  `hex_color` varchar(7) COLLATE utf8mb4_polish_ci NOT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `length` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `category_id`, `img_file`, `description`, `qauntity`, `product_type`, `hex_color`, `height`, `width`, `length`) VALUES
(1, 'Taboret hoker', 519, 3, 'hoker-green.png', 'Nie każdy lubi się opierać jak siedzi. Ty też nie możesz się oprzeć temu hookerowi. Cały stelaż został zaimpregnowany roztworem z nokii 3310, pewnie stąd wzięła się legenda, że naukowcy do teraz nie wiedzą co może go zniszczyć. ', 13, 'configurable', '', 70, 30, 30),
(2, 'Fotel uszak', 519, 3, 'fotel-blue.png', 'Fotel uszak to klasyczny i elegancki mebel, który doskonale łączy w sobie komfort i styl. Charakterystyczne wysokie oparcie z zaokrąglonymi \"uszami\" oraz głębokie siedzisko zapewniają wyjątkowe wsparcie dla pleców i głowy, co sprawia, że fotel ten jest idealnym miejscem do odpoczynku i relaksu. Dodatkowo, szerokie podłokietniki umożliwiają wygodne ułożenie rąk, a solidne nogi zapewniają stabilność. Tapicerka wykonana z miękkiego, przyjemnego w dotyku materiału dodaje przytulności i ciepła każdemu wnętrzu. Fotel uszak to nie tylko funkcjonalny, ale także dekoracyjny element wystroju, który wprowadzi do Twojego domu odrobinę luksusu i klasy.\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 114, 'configurable', '', 50, 40, 35),
(3, 'Fotel uszak, szary', 519, 3, '/fotel/fotel-gray.png', 'Fotel uszak to klasyczny i elegancki mebel, który doskonale łączy w sobie komfort i styl. Charakterystyczne wysokie oparcie z zaokrąglonymi \"uszami\" oraz głębokie siedzisko zapewniają wyjątkowe wsparcie dla pleców i głowy, co sprawia, że fotel ten jest idealnym miejscem do odpoczynku i relaksu. Dodatkowo, szerokie podłokietniki umożliwiają wygodne ułożenie rąk, a solidne nogi zapewniają stabilność. Tapicerka wykonana z miękkiego, przyjemnego w dotyku materiału dodaje przytulności i ciepła każdemu wnętrzu. Fotel uszak to nie tylko funkcjonalny, ale także dekoracyjny element wystroju, który wprowadzi do Twojego domu odrobinę luksusu i klasy.\n\n\n\n\n\n\n', 4, 'simple', '#999999', 50, 40, 35),
(4, 'Krzesło tulipan', 50, 2, 'krzeslo-tulipan-white.png', 'Krzesło tulipan to ikoniczny i nowoczesny mebel, który łączy w sobie elegancję i funkcjonalność. Zostało zaprojektowane z myślą o minimalistycznym, a jednocześnie wyrafinowanym wyglądzie, co czyni je idealnym dodatkiem do współczesnych wnętrz. Charakterystyczna konstrukcja krzesła tulipan obejmuje smukłą, jednolitą podstawę w kształcie kielicha, która przechodzi w delikatnie zaokrąglone siedzisko, tworząc harmonijną całość. Wykonane z wysokiej jakości materiałów, takich jak formowane tworzywo sztuczne i metal, krzesło tulipan jest nie tylko estetyczne, ale także trwałe i łatwe do utrzymania w czystości. Jego ergonomiczny kształt zapewnia wygodę siedzenia, a dostępność w różnych kolorach i wykończeniach pozwala na dopasowanie go do indywidualnych gustów i aranżacji wnętrz. Krzesło tulipan to doskonały wybór dla tych, którzy cenią sobie nowoczesny design i komfort.', 1, 'configurable', '', 55, 35, 30),
(5, 'Krzesło tulipan, biały', 50, 3, '/krzeslo-tulipan/krzeslo-tulipan-white.png', 'Krzesło tulipan to ikoniczny i nowoczesny mebel, który łączy w sobie elegancję i funkcjonalność. Zostało zaprojektowane z myślą o minimalistycznym, a jednocześnie wyrafinowanym wyglądzie, co czyni je idealnym dodatkiem do współczesnych wnętrz. Charakterystyczna konstrukcja krzesła tulipan obejmuje smukłą, jednolitą podstawę w kształcie kielicha, która przechodzi w delikatnie zaokrąglone siedzisko, tworząc harmonijną całość. Wykonane z wysokiej jakości materiałów, takich jak formowane tworzywo sztuczne i metal, krzesło tulipan jest nie tylko estetyczne, ale także trwałe i łatwe do utrzymania w czystości. Jego ergonomiczny kształt zapewnia wygodę siedzenia, a dostępność w różnych kolorach i wykończeniach pozwala na dopasowanie go do indywidualnych gustów i aranżacji wnętrz. Krzesło tulipan to doskonały wybór dla tych, którzy cenią sobie nowoczesny design i komfort.', 99, 'simple', '#cccccc', 55, 35, 30),
(6, 'Fotel skandynawski', 419, 3, 'fotel-skandynawski-green.png', 'Fotel skandynawski to esencja prostoty, funkcjonalności i elegancji, inspirowany ponadczasowym stylem skandynawskim. Charakteryzuje się minimalistycznym designem, który łączy w sobie naturalne materiały i neutralne kolory, tworząc atmosferę spokoju i harmonii. Wysokiej jakości drewno, z którego wykonana jest konstrukcja, oraz miękka tapicerka zapewniają komfort i trwałość. Dzięki ergonomicznemu kształtowi i wygodnym podłokietnikom, fotel ten jest idealnym miejscem do odpoczynku i relaksu. Skandynawski fotel doskonale wpasuje się zarówno w nowoczesne, jak i klasyczne wnętrza, dodając im ciepła i stylu. Usiądź, zrelaksuj się i podziwiaj skandynawską zorzę relaksu w zaciszu własnego domu.', 61, 'configurable', '', 60, 50, 40),
(7, 'Krzesło ergonomiczne', 1299, 3, 'krzeslo-ergonomiczne-gray.png', 'Rozsiądź się wygodnie i pracuj bez zmęczenia. Dzięki idealnemu profilowi twoje lędźwia odczują komfort, którego nigdy nie zaznały.', 42, 'configurable', '', 120, 35, 30),
(10, 'Komoda nowoczesna', 2499, 6, 'komoda-dark-wood-black.png', 'Dzięki tej komodzie żaden sezon na netflix nie będzie dla ciebie problemem. Problemem będzie jej wniesienie na czwarte piętro, dlatego pozwól, żeby nasi profesjonaliści pokazali czego się nauczyli na wakacjach w IKEI. ', 2, 'configurable', '', 110, 70, 200),
(11, 'Komoda modern', 2899, 6, 'komoda-modern-black-wood.png', 'Modernistyczna komoda. Im mniej tym lepiej. My się mniej staramy, a ty więcej płacisz. Konsumpcjonizm w najlepszym tego słowa znaczeniu. Krótkie zdanie z kropką na końcu.', 22, 'configurable', '', 110, 60, 180),
(14, 'Łóżko pikowane', 5699, 5, 'lozko-pikowane-creamy-white.png', 'Jak sama nazwa wskazuje - łóżko pikowane creamy, w nim osiągniesz peak relaksacji. Nie ważne, czy będziesz spał, oglądał serial czy nagrywał smutny filmik na youtube - warto wyłożyć na takie łoże. ', 87, 'configurable', '', 45, 160, 210),
(16, 'Stolik kawowy', 289, 3, 'stolik-kawowy-oak-wood-white.png', 'Niby stolik kawowy, a jednak jest drewniany. Najlepsi architekci pokazali kunszt i wydobyli z wysokiej jakości Dębu wszystko czego oczekuje twój kubek gorącej macchiato. ', 325, 'configurable', '', 50, 110, 90),
(18, 'Fotel uszak, zielony', 519, 3, '/fotel/fotel-green.png', 'Fotel uszak to klasyczny i elegancki mebel, który doskonale łączy w sobie komfort i styl. Charakterystyczne wysokie oparcie z zaokrąglonymi \"uszami\" oraz głębokie siedzisko zapewniają wyjątkowe wsparcie dla pleców i głowy, co sprawia, że fotel ten jest idealnym miejscem do odpoczynku i relaksu. Dodatkowo, szerokie podłokietniki umożliwiają wygodne ułożenie rąk, a solidne nogi zapewniają stabilność. Tapicerka wykonana z miękkiego, przyjemnego w dotyku materiału dodaje przytulności i ciepła każdemu wnętrzu. Fotel uszak to nie tylko funkcjonalny, ale także dekoracyjny element wystroju, który wprowadzi do Twojego domu odrobinę luksusu i klasy.', 12, 'simple', '#22ae0b', 50, 40, 35),
(20, 'Fotel skandynawski, niebieski', 419, 3, '/fotel-skandynawski/fotel-skandynawski-blue.png', 'Fotel skandynawski to esencja prostoty, funkcjonalności i elegancji, inspirowany ponadczasowym stylem skandynawskim. Charakteryzuje się minimalistycznym designem, który łączy w sobie naturalne materiały i neutralne kolory, tworząc atmosferę spokoju i harmonii. Wysokiej jakości drewno, z którego wykonana jest konstrukcja, oraz miękka tapicerka zapewniają komfort i trwałość. Dzięki ergonomicznemu kształtowi i wygodnym podłokietnikom, fotel ten jest idealnym miejscem do odpoczynku i relaksu. Skandynawski fotel doskonale wpasuje się zarówno w nowoczesne, jak i klasyczne wnętrza, dodając im ciepła i stylu. Usiądź, zrelaksuj się i podziwiaj skandynawską zorzę relaksu w zaciszu własnego domu.', 65, 'simple', '#358dcf', 60, 50, 40),
(21, 'Fotel skandynawski, szary', 419, 3, '/fotel-skandynawski/fotel-skandynawski-dark-grey.png', 'Fotel skandynawski to esencja prostoty, funkcjonalności i elegancji, inspirowany ponadczasowym stylem skandynawskim. Charakteryzuje się minimalistycznym designem, który łączy w sobie naturalne materiały i neutralne kolory, tworząc atmosferę spokoju i harmonii. Wysokiej jakości drewno, z którego wykonana jest konstrukcja, oraz miękka tapicerka zapewniają komfort i trwałość. Dzięki ergonomicznemu kształtowi i wygodnym podłokietnikom, fotel ten jest idealnym miejscem do odpoczynku i relaksu. Skandynawski fotel doskonale wpasuje się zarówno w nowoczesne, jak i klasyczne wnętrza, dodając im ciepła i stylu. Usiądź, zrelaksuj się i podziwiaj skandynawską zorzę relaksu w zaciszu własnego domu.', 34, 'simple', '#7c7c7c', 60, 50, 40),
(24, 'Fotel uszak, żółty', 519, 3, '/fotel/fotel-yellow.png', 'Fotel uszak to klasyczny i elegancki mebel, który doskonale łączy w sobie komfort i styl. Charakterystyczne wysokie oparcie z zaokrąglonymi \"uszami\" oraz głębokie siedzisko zapewniają wyjątkowe wsparcie dla pleców i głowy, co sprawia, że fotel ten jest idealnym miejscem do odpoczynku i relaksu. Dodatkowo, szerokie podłokietniki umożliwiają wygodne ułożenie rąk, a solidne nogi zapewniają stabilność. Tapicerka wykonana z miękkiego, przyjemnego w dotyku materiału dodaje przytulności i ciepła każdemu wnętrzu. Fotel uszak to nie tylko funkcjonalny, ale także dekoracyjny element wystroju, który wprowadzi do Twojego domu odrobinę luksusu i klasy.', 31, 'simple', '#ffd65b', 50, 40, 35),
(25, 'Taboret hoker, czarny', 519, 3, '/hoker/hoker-black.png', 'Nie każdy lubi się opierać jak siedzi. Ty też nie możesz się oprzeć temu hookerowi. Cały stelaż został zaimpregnowany roztworem z nokii 3310, pewnie stąd wzięła się legenda, że naukowcy do teraz nie wiedzą co może go zniszczyć.', 33, 'simple', '#033008', 70, 30, 30),
(28, 'Taboret hoker, czerwony', 519, 3, '/hoker/hoker-red.png', 'Nie każdy lubi się opierać jak siedzi. Ty też nie możesz się oprzeć temu hookerowi. Cały stelaż został zaimpregnowany roztworem z nokii 3310, pewnie stąd wzięła się legenda, że naukowcy do teraz nie wiedzą co może go zniszczyć.\n', 22, 'simple', '#D10A0A', 70, 30, 30),
(29, 'Krzesło ergonomiczne, zielony', 1299, 3, '/krzeslo-ergo/krzeslo-ergonomiczne-green.png', 'Krzesło ergonomiczne to idealne połączenie komfortu i zdrowia, zaprojektowane z myślą o tych, którzy spędzają wiele godzin przy biurku. Charakteryzuje się nowoczesnym designem oraz licznymi funkcjami, które wspierają prawidłową postawę i redukują zmęczenie. Wyprofilowane oparcie z regulacją wysokości oraz wsparciem lędźwiowym zapewnia optymalne dopasowanie do kształtu kręgosłupa, minimalizując ryzyko bólu pleców. Siedzisko krzesła Back jest wykonane z oddychającego materiału, co zapobiega przegrzewaniu się, a możliwość regulacji wysokości i głębokości siedziska pozwala na indywidualne dostosowanie do potrzeb użytkownika. Dodatkowo, regulowane podłokietniki odciążają ramiona i nadgarstki, a solidna, pięcioramienna podstawa z kółkami zapewnia stabilność i mobilność. Krzesło ergonomiczne Back to nie tylko inwestycja w zdrowie, ale także w wygodę, która przekłada się na większą produktywność i komfort pracy.', 27, 'simple', '#227828', 120, 35, 30),
(32, 'Krzesło ergonomiczne, zielony wojskowy', 1299, 3, '/krzeslo-ergo/krzeslo-ergonomiczne-moro.png', 'Krzesło ergonomiczne to idealne połączenie komfortu i zdrowia, zaprojektowane z myślą o tych, którzy spędzają wiele godzin przy biurku. Charakteryzuje się nowoczesnym designem oraz licznymi funkcjami, które wspierają prawidłową postawę i redukują zmęczenie. Wyprofilowane oparcie z regulacją wysokości oraz wsparciem lędźwiowym zapewnia optymalne dopasowanie do kształtu kręgosłupa, minimalizując ryzyko bólu pleców. Siedzisko krzesła Back jest wykonane z oddychającego materiału, co zapobiega przegrzewaniu się, a możliwość regulacji wysokości i głębokości siedziska pozwala na indywidualne dostosowanie do potrzeb użytkownika. Dodatkowo, regulowane podłokietniki odciążają ramiona i nadgarstki, a solidna, pięcioramienna podstawa z kółkami zapewnia stabilność i mobilność. Krzesło ergonomiczne Back to nie tylko inwestycja w zdrowie, ale także w wygodę, która przekłada się na większą produktywność i komfort pracy.', 94, 'simple', '#a4bc42', 120, 35, 30),
(33, 'Krzesło tulipan, zielony', 50, 3, '/krzeslo-tulipan/krzeslo-tulipan-green.png', 'Krzesło tulipan to ikoniczny i nowoczesny mebel, który łączy w sobie elegancję i funkcjonalność. Zostało zaprojektowane z myślą o minimalistycznym, a jednocześnie wyrafinowanym wyglądzie, co czyni je idealnym dodatkiem do współczesnych wnętrz. Charakterystyczna konstrukcja krzesła tulipan obejmuje smukłą, jednolitą podstawę w kształcie kielicha, która przechodzi w delikatnie zaokrąglone siedzisko, tworząc harmonijną całość. Wykonane z wysokiej jakości materiałów, takich jak formowane tworzywo sztuczne i metal, krzesło tulipan jest nie tylko estetyczne, ale także trwałe i łatwe do utrzymania w czystości. Jego ergonomiczny kształt zapewnia wygodę siedzenia, a dostępność w różnych kolorach i wykończeniach pozwala na dopasowanie go do indywidualnych gustów i aranżacji wnętrz. Krzesło tulipan to doskonały wybór dla tych, którzy cenią sobie nowoczesny design i komfort.', 44, 'simple', '#42bc5c', 55, 35, 30),
(36, 'Krzesło tulipan, szary', 50, 3, '/krzeslo-tulipan/krzeslo-tulipan-grey.png', 'Krzesło tulipan to ikoniczny i nowoczesny mebel, który łączy w sobie elegancję i funkcjonalność. Zostało zaprojektowane z myślą o minimalistycznym, a jednocześnie wyrafinowanym wyglądzie, co czyni je idealnym dodatkiem do współczesnych wnętrz. Charakterystyczna konstrukcja krzesła tulipan obejmuje smukłą, jednolitą podstawę w kształcie kielicha, która przechodzi w delikatnie zaokrąglone siedzisko, tworząc harmonijną całość. Wykonane z wysokiej jakości materiałów, takich jak formowane tworzywo sztuczne i metal, krzesło tulipan jest nie tylko estetyczne, ale także trwałe i łatwe do utrzymania w czystości. Jego ergonomiczny kształt zapewnia wygodę siedzenia, a dostępność w różnych kolorach i wykończeniach pozwala na dopasowanie go do indywidualnych gustów i aranżacji wnętrz. Krzesło tulipan to doskonały wybór dla tych, którzy cenią sobie nowoczesny design i komfort.', 0, 'simple', '#8c8c8c', 55, 35, 30),
(37, 'Łóżko pikowane, niebieski', 5699, 5, '/lozko-pikowane/lozko-pikowane-creamy-blue.png', 'Jak sama nazwa wskazuje - łóżko pikowane niebieskie, w nim osiągniesz peak relaksacji. Nie ważne, czy będziesz spał, oglądał serial czy nagrywał smutny filmik na youtube - warto wyłożyć na takie łoże. ', 0, 'simple', '#2aaab7', 45, 160, 210),
(40, 'Łóżko pikowane, brązowe', 5699, 5, '/lozko-pikowane/lozko-pikowane-creamy-brown.png', 'Jak sama nazwa wskazuje - łóżko pikowane brazowe, a kobiety lubia braz, w nim osiągniesz peak relaksacji. Nie ważne, czy będziesz spał, oglądał serial czy nagrywał smutny filmik na youtube - warto wyłożyć na takie łoże. ', 65, 'simple', '#8f470c', 45, 160, 210),
(44, 'Taboret hoker, zielony', 519, 3, '/hoker/hoker-green.png', 'Nie każdy lubi się opierać jak siedzi. Ty też nie możesz się oprzeć temu hookerowi. Cały stelaż został zaimpregnowany roztworem z nokii 3310, pewnie stąd wzięła się legenda, że naukowcy do teraz nie wiedzą co może go zniszczyć.', 30, 'simple', '#006400', 70, 30, 30),
(45, 'Fotel uszak, niebieski', 519, 3, '/fotel/fotel-blue.png', 'Fotel uszak to klasyczny i elegancki mebel, który doskonale łączy w sobie komfort i styl. Charakterystyczne wysokie oparcie z zaokrąglonymi \"uszami\" oraz głębokie siedzisko zapewniają wyjątkowe wsparcie dla pleców i głowy, co sprawia, że fotel ten jest idealnym miejscem do odpoczynku i relaksu. Dodatkowo, szerokie podłokietniki umożliwiają wygodne ułożenie rąk, a solidne nogi zapewniają stabilność. Tapicerka wykonana z miękkiego, przyjemnego w dotyku materiału dodaje przytulności i ciepła każdemu wnętrzu. Fotel uszak to nie tylko funkcjonalny, ale także dekoracyjny element wystroju, który wprowadzi do Twojego domu odrobinę luksusu i klasy.\r\n', 100, 'simple', '#3d85c6', 50, 40, 35),
(46, 'Komoda modern, czarna', 2899, 3, '/komoda-modern/komoda-modern-black-wood.png', 'Modernistyczna komoda. Im mniej tym lepiej. My się mniej staramy, a ty więcej płacisz. Konsumpcjonizm w najlepszym tego słowa znaczeniu. Krótkie zdanie z kropką na końcu.', 20, 'simple', '#041729', 110, 60, 180),
(47, 'Komoda modern, złota', 2899, 3, '/komoda-modern/komoda-modern-golden-wood.png', 'Modernistyczna komoda. Im mniej tym lepiej. My się mniej staramy, a ty więcej płacisz. Konsumpcjonizm w najlepszym tego słowa znaczeniu. Krótkie zdanie z kropką na końcu.', 15, 'simple', '#848a15', 110, 60, 180),
(48, 'Krzesło tulipan, brązowe', 50, 2, '/krzeslo-tulipan/krzeslo-tulipan-brown.png', 'Krzesło tulipan to ikoniczny i nowoczesny mebel, który łączy w sobie elegancję i funkcjonalność. Zostało zaprojektowane z myślą o minimalistycznym, a jednocześnie wyrafinowanym wyglądzie, co czyni je idealnym dodatkiem do współczesnych wnętrz. Charakterystyczna konstrukcja krzesła tulipan obejmuje smukłą, jednolitą podstawę w kształcie kielicha, która przechodzi w delikatnie zaokrąglone siedzisko, tworząc harmonijną całość. Wykonane z wysokiej jakości materiałów, takich jak formowane tworzywo sztuczne i metal, krzesło tulipan jest nie tylko estetyczne, ale także trwałe i łatwe do utrzymania w czystości. Jego ergonomiczny kształt zapewnia wygodę siedzenia, a dostępność w różnych kolorach i wykończeniach pozwala na dopasowanie go do indywidualnych gustów i aranżacji wnętrz. Krzesło tulipan to doskonały wybór dla tych, którzy cenią sobie nowoczesny design i komfort.', 22, 'simple', '#8c6918', 55, 35, 30),
(49, 'Fotel skandynawski, zielony\r\n', 419, 3, '/fotel-skandynawski/fotel-skandynawski-green.png', 'Fotel skandynawski to esencja prostoty, funkcjonalności i elegancji, inspirowany ponadczasowym stylem skandynawskim. Charakteryzuje się minimalistycznym designem, który łączy w sobie naturalne materiały i neutralne kolory, tworząc atmosferę spokoju i harmonii. Wysokiej jakości drewno, z którego wykonana jest konstrukcja, oraz miękka tapicerka zapewniają komfort i trwałość. Dzięki ergonomicznemu kształtowi i wygodnym podłokietnikom, fotel ten jest idealnym miejscem do odpoczynku i relaksu. Skandynawski fotel doskonale wpasuje się zarówno w nowoczesne, jak i klasyczne wnętrza, dodając im ciepła i stylu. Usiądź, zrelaksuj się i podziwiaj skandynawską zorzę relaksu w zaciszu własnego domu.\r\n\r\n', 5, 'simple', '#26a69b', 60, 50, 40),
(50, 'Komoda nowoczesna, czarna', 2499, 4, '/komoda/komoda-dark-wood-black.png', 'Dzięki tej komodzie żaden sezon na netflix nie będzie dla ciebie problemem. Problemem będzie jej wniesienie na czwarte piętro, dlatego pozwól, żeby nasi profesjonaliści pokazali czego się nauczyli na wakacjach w IKEI. ', 10, 'simple', '#222222', 110, 70, 200),
(51, 'Komoda nowoczesna, różowa', 2499, 4, '/komoda/komoda-dark-wood-pink.png', 'Dzięki tej komodzie żaden sezon na netflix nie będzie dla ciebie problemem. Problemem będzie jej wniesienie na czwarte piętro, dlatego pozwól, żeby nasi profesjonaliści pokazali czego się nauczyli na wakacjach w IKEI. ', 6, 'simple', '#b58079', 110, 70, 200),
(52, 'Stolik kawowy, biały', 289, 2, '/stolik-kawowy/stolik-kawowy-oak-wood-white.png', 'Niby stolik kawowy, a jednak jest drewniany. Najlepsi architekci pokazali kunszt i wydobyli z wysokiej jakości Dębu wszystko czego oczekuje twój kubek gorącej macchiato. ', 13, 'simple', '#dddddd', 50, 110, 90),
(53, 'Stolik kawowy, brązowy', 289, 2, '/stolik-kawowy/stolik-kawowy-oak-wood-brown.png', 'Niby stolik kawowy, a jednak jest drewniany. Najlepsi architekci pokazali kunszt i wydobyli z wysokiej jakości Dębu wszystko czego oczekuje twój kubek gorącej macchiato. ', 87, 'simple', '#945b15', 50, 110, 90),
(54, 'Krzesło ergonomiczne, różowe\r\n', 1299, 3, '/krzeslo-ergo/krzeslo-ergonomiczne-pink.png', 'Krzesło ergonomiczne to idealne połączenie komfortu i zdrowia, zaprojektowane z myślą o tych, którzy spędzają wiele godzin przy biurku. Charakteryzuje się nowoczesnym designem oraz licznymi funkcjami, które wspierają prawidłową postawę i redukują zmęczenie. Wyprofilowane oparcie z regulacją wysokości oraz wsparciem lędźwiowym zapewnia optymalne dopasowanie do kształtu kręgosłupa, minimalizując ryzyko bólu pleców. Siedzisko krzesła Back jest wykonane z oddychającego materiału, co zapobiega przegrzewaniu się, a możliwość regulacji wysokości i głębokości siedziska pozwala na indywidualne dostosowanie do potrzeb użytkownika. Dodatkowo, regulowane podłokietniki odciążają ramiona i nadgarstki, a solidna, pięcioramienna podstawa z kółkami zapewnia stabilność i mobilność. Krzesło ergonomiczne Back to nie tylko inwestycja w zdrowie, ale także w wygodę, która przekłada się na większą produktywność i komfort pracy.\r\n\r\n', 12, 'simple', '#d190bb', 120, 35, 30),
(55, 'Krzesło ergonomiczne, szary\r\n', 1299, 3, '/krzeslo-ergo/krzeslo-ergonomiczne-gray.png', 'Krzesło ergonomiczne to idealne połączenie komfortu i zdrowia, zaprojektowane z myślą o tych, którzy spędzają wiele godzin przy biurku. Charakteryzuje się nowoczesnym designem oraz licznymi funkcjami, które wspierają prawidłową postawę i redukują zmęczenie. Wyprofilowane oparcie z regulacją wysokości oraz wsparciem lędźwiowym zapewnia optymalne dopasowanie do kształtu kręgosłupa, minimalizując ryzyko bólu pleców. Siedzisko krzesła Back jest wykonane z oddychającego materiału, co zapobiega przegrzewaniu się, a możliwość regulacji wysokości i głębokości siedziska pozwala na indywidualne dostosowanie do potrzeb użytkownika. Dodatkowo, regulowane podłokietniki odciążają ramiona i nadgarstki, a solidna, pięcioramienna podstawa z kółkami zapewnia stabilność i mobilność. Krzesło ergonomiczne Back to nie tylko inwestycja w zdrowie, ale także w wygodę, która przekłada się na większą produktywność i komfort pracy.\r\n\r\n', 22, 'simple', '#999999', 120, 35, 30);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `services`
--

CREATE TABLE `services` (
  `id_service` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `discription` text COLLATE utf8_polish_ci NOT NULL,
  `basic_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `services`
--

INSERT INTO `services` (`id_service`, `name`, `discription`, `basic_price`) VALUES
(0, 'Wniesienie', 'Wniesienie mebli do domu lub mieszkania', 100),
(3, 'Montaż', 'W naszym sklepie meblowym oferujemy usługę kompleksowego montażu mebli z części, zapewniającą wygodę i pewność, że Wasze nowe meble zostaną złożone dokładnie i starannie.', 50);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `simple_to_configurable`
--

CREATE TABLE `simple_to_configurable` (
  `id` int(11) NOT NULL,
  `simple_id` int(11) NOT NULL,
  `configurable_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_polish_ci;

--
-- Zrzut danych tabeli `simple_to_configurable`
--

INSERT INTO `simple_to_configurable` (`id`, `simple_id`, `configurable_id`) VALUES
(22, 20, 6),
(23, 21, 6),
(24, 45, 2),
(25, 3, 2),
(26, 18, 2),
(27, 24, 2),
(28, 46, 11),
(29, 47, 11),
(34, 5, 4),
(35, 36, 4),
(36, 33, 4),
(37, 25, 1),
(38, 28, 1),
(39, 44, 1),
(40, 40, 14),
(41, 37, 14),
(44, 48, 4),
(45, 49, 6),
(46, 50, 10),
(47, 51, 10),
(48, 52, 16),
(49, 53, 16),
(50, 29, 7),
(51, 32, 7),
(52, 55, 7),
(53, 54, 7);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `address` text COLLATE utf8_polish_ci NOT NULL,
  `number` int(9) NOT NULL,
  `email` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `login` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `permission` enum('admin','pracownik','klient') COLLATE utf8_polish_ci NOT NULL COMMENT 'ENUM'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id_user`, `name`, `last_name`, `address`, `number`, `email`, `login`, `password`, `permission`) VALUES
(1, 'Julian', 'Cendrowski', 'Gdańsk ul. Księdza Tischnera Józefa 86\r\n', 603495351, 'quimoyoussoubu@gmail.com', 'moyous', 'moyous21', 'pracownik'),
(2, 'Klaudiusz', 'Shvets', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'crunneufexehe@mail.com', 'crunne', 'crunne12', 'pracownik'),
(3, 'Jan', 'Mura', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'mepubrolleiseu@gmail.com', 'mepu', 'mepuro1', 'pracownik'),
(4, 'Bartłomiej', 'Kurzak', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'vemequettoffei@gmail.com', 'veme', 'veme123', 'pracownik'),
(5, 'Tadeusz', 'Pohl', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'joiprabrouddacro@gmail.com', 'broudd', 'broudd123', 'pracownik'),
(6, 'admin', 'admin', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'admin@mail.com', 'admin', 'admin', 'admin'),
(7, 'user', 'user', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'user@wp.pl', 'user', '123', 'pracownik'),
(8, 'Bartulo', 'Administraciulo', 'Gdańsk ul. Księdza Tischnera Józefa 86', 603495351, 'xmilov333@gmail.com', 'xmilov333', 'admin', 'pracownik'),
(9, 'Maria', 'Maria', 'Rzeszów ul. Ceramiczna 122', 603495351, 'nefrepoifroga-4421@gmail.com', 'nefre', '1234', 'klient'),
(11, 'Witold', 'Smółka', 'Gdańsk ul. Księdza Tischnera Józefa 86', 675832336, 'trabrautouyabro@gmail.com', 'bro', 'bro123', 'klient'),
(12, 'Bartula', 'Studenciura', 'Wrocław, ul. Wygodna 13', 1234567890, 'xmilov3@gmail.com', 'xmilov3', 'haslo', 'klient');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id_cart`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_user` (`id_user`) USING BTREE;

--
-- Indeksy dla tabeli `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeksy dla tabeli `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id_courier`);

--
-- Indeksy dla tabeli `fur_list`
--
ALTER TABLE `fur_list`
  ADD PRIMARY KEY (`id_fur`),
  ADD KEY `id_mat` (`id_mat`,`id_category`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeksy dla tabeli `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id_mat`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeksy dla tabeli `order_ele`
--
ALTER TABLE `order_ele`
  ADD PRIMARY KEY (`id_order_ele`);

--
-- Indeksy dla tabeli `order_services`
--
ALTER TABLE `order_services`
  ADD PRIMARY KEY (`id_order_services`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_service` (`id_service`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksy dla tabeli `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Indeksy dla tabeli `simple_to_configurable`
--
ALTER TABLE `simple_to_configurable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `simple_id` (`simple_id`),
  ADD KEY `configurable_id` (`configurable_id`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `carts`
--
ALTER TABLE `carts`
  MODIFY `id_cart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT dla tabeli `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id_courier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `fur_list`
--
ALTER TABLE `fur_list`
  MODIFY `id_fur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `materials`
--
ALTER TABLE `materials`
  MODIFY `id_mat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT dla tabeli `order_ele`
--
ALTER TABLE `order_ele`
  MODIFY `id_order_ele` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `order_services`
--
ALTER TABLE `order_services`
  MODIFY `id_order_services` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT dla tabeli `simple_to_configurable`
--
ALTER TABLE `simple_to_configurable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`product_id`);

--
-- Ograniczenia dla tabeli `fur_list`
--
ALTER TABLE `fur_list`
  ADD CONSTRAINT `fur_list_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `fur_list_ibfk_2` FOREIGN KEY (`id_mat`) REFERENCES `materials` (`id_mat`);

--
-- Ograniczenia dla tabeli `order_services`
--
ALTER TABLE `order_services`
  ADD CONSTRAINT `order_services_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  ADD CONSTRAINT `order_services_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `services` (`id_service`);

--
-- Ograniczenia dla tabeli `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`);

--
-- Ograniczenia dla tabeli `simple_to_configurable`
--
ALTER TABLE `simple_to_configurable`
  ADD CONSTRAINT `simple_to_configurable_ibfk_1` FOREIGN KEY (`simple_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `simple_to_configurable_ibfk_2` FOREIGN KEY (`configurable_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
