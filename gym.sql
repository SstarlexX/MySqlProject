-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 23 2021 г., 14:43
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gym`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `destionation` varchar(10) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `destionation`, `text`) VALUES
(0, 5, 'Зал', 'Відмінний тренажерний зал! ВСЕ СУПЕР!!! Чуйний персонал, досвідчений тренер. Чисто, просторо та затишно. Тренеруєшся..., і, - губишся в часі... РЕКОМЕНДУЮ;)'),
(1, 1, 'Зал', 'Чудовий тренажерний зал, світлий, просторий та з найкращими тренерами.\r\nЗавжди чисто, привітно йдеш і знаєш, що тобі завжди тут дуже раді.'),
(2, 2, 'Зал', 'Роздягальні досить просторі, є душ з кількома кабінками, фен, окрема вбиральня, завжди чиста, що дуже важливо, за такої великої кількості відвідувачів.\r\nМожна купувати шафки в оренду.\r\nТакож якщо вам необхідно купити рушник, шкарпетки, навіть гумки для волосся є.'),
(3, 3, 'Зал', 'Була на двох тренуваннях, дуже уважно підходять до кожної людини, питають висновки лікарів та знімки. Підбирають правильно навантаження.');

-- --------------------------------------------------------

--
-- Структура таблицы `subscription`
--

CREATE TABLE `subscription` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_name` varchar(30) NOT NULL,
  `price` smallint(5) UNSIGNED NOT NULL,
  `validity` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `subscription`
--

INSERT INTO `subscription` (`id`, `subscription_name`, `price`, `validity`) VALUES
(0, 'Разове заняття', 80, 1),
(1, '1 місяць безліміт', 600, 30),
(2, '1 місяць шкільний', 550, 30),
(3, '3 місяці', 1650, 90),
(4, '6 місяців', 3050, 183),
(5, '12 місяців', 5750, 365);

-- --------------------------------------------------------

--
-- Структура таблицы `trainers`
--

CREATE TABLE `trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trainer_name` varchar(20) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone_number` int(12) UNSIGNED DEFAULT NULL,
  `passport` int(20) UNSIGNED DEFAULT NULL,
  `specialization` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `trainers`
--

INSERT INTO `trainers` (`id`, `trainer_name`, `login`, `password`, `phone_number`, `passport`, `specialization`) VALUES
(0, 'Толмач Марк', 'tolmachmark', 'mark130285', 939331425, 301003, 'зниження ваги, корекція фігури'),
(1, 'Книщук Роман', 'roman123', 'knischukroman1978', 931213444, 1567891, 'функціональний тренінг, набір м\'язової маси, силовий тренінг'),
(2, 'Селяева Дарья', 'dashaseleeva', 'dashaseleeva1987', 931145425, 3023453, 'зниження ваги, корекція фігури'),
(3, 'Корягин Павел', 'korapavel', 'koraginpasha3322', 667894361, 3023453, 'Велнес\r\nФітнес спеціалізація\r\nФункціональний тренінг\r\nСтретч та релаксація\r\nРеабілітація та відновлення після травм\r\nСкладання програм персональних тренувань\r\nНабір м\'язової маси\r\nЗниження маси тіла');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `subscription_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `user_name`, `login`, `password`, `subscription_id`) VALUES
(0, 'Потап Вадим', 'PotapVadim', 'vadim100600', 1),
(1, 'Козак Иван', 'kozivan', 'kozivan1984', 1),
(2, 'Николен Катя', 'Nikate', 'Nikate2005', 2),
(3, 'Литвин Даша', 'dashaLitv', 'Lidasha123', 2),
(5, 'Клюв Никита', 'nikitos', 'nikitoskluv', 4),
(6, 'Губарь Максим', 'gubamaks', 'gubamaks123', 3),
(7, 'Деркачук Рита', 'derkachuk', 'derRita123', 0),
(8, 'Козак Иван', 'koziasdsa', 'kasdas', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users_trainers`
--

CREATE TABLE `users_trainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `trainer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users_trainers`
--

INSERT INTO `users_trainers` (`id`, `user_id`, `trainer_id`) VALUES
(0, 5, 1),
(1, 1, 0),
(2, 3, 1),
(3, 2, 0),
(5, 6, 1),
(6, 7, 2),
(9, 0, 3);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `subscription`
--
ALTER TABLE `subscription`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `trainers`
--
ALTER TABLE `trainers`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `subscription_id` (`subscription_id`);

--
-- Индексы таблицы `users_trainers`
--
ALTER TABLE `users_trainers`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trainer_id` (`trainer_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users_trainers`
--
ALTER TABLE `users_trainers`
  ADD CONSTRAINT `users_trainers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_trainers_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
