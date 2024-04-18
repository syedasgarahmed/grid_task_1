-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 03:34 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grid`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `QuestionID` int(11) NOT NULL,
  `QuestionText` text DEFAULT NULL,
  `DifficultyLevel` varchar(50) DEFAULT NULL,
  `Topic` varchar(50) DEFAULT NULL,
  `Type` enum('MCQ','Descriptive') DEFAULT NULL,
  `Options` varchar(255) DEFAULT NULL,
  `CorrectAnswer` varchar(255) DEFAULT NULL,
  `Explanation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`QuestionID`, `QuestionText`, `DifficultyLevel`, `Topic`, `Type`, `Options`, `CorrectAnswer`, `Explanation`) VALUES
(1, 'What does PHP stand for?', 'Easy', 'Programming', 'MCQ', 'Hypertext Preprocessor, PHP: Hypertext Preprocessor, Personal Home Page, Option D', 'Hypertext Preprocessor', 'PHP stands for Hypertext Preprocessor.'),
(2, 'What is the file extension for PHP files?', 'Easy', 'Programming', 'Descriptive', NULL, '.php', 'The file extension for PHP files is .php.'),
(3, 'What is the syntax for echoing something in PHP?', 'Easy', 'Programming', 'Descriptive', NULL, 'echo \"Hello World!\";', 'The syntax for echoing something in PHP is echo \"Hello World!\";'),
(4, 'How do you start a PHP block?', 'Easy', 'Programming', 'Descriptive', NULL, '<?php', 'You start a PHP block with <?php.'),
(5, 'Which function is used to get the length of a string in PHP?', 'Easy', 'Programming', 'MCQ', 'strlen(), str_length(), length(), Option D', 'strlen()', 'The strlen() function is used to get the length of a string in PHP.'),
(6, 'What is the output of 5 + \"10\" in PHP?', 'Easy', 'Programming', 'MCQ', '15, \"15\", Error, Option D', '15', 'The output of 5 + \"10\" in PHP is 15 because PHP automatically converts \"10\" to an integer when performing arithmetic operations.'),
(7, 'What is the correct way to comment out a single line in PHP?', 'Easy', 'Programming', 'Descriptive', NULL, '// This is a comment', 'The correct way to comment out a single line in PHP is by using double forward slashes (//).'),
(8, 'How do you concatenate two strings in PHP?', 'Easy', 'Programming', 'Descriptive', NULL, '$str1 . $str2;', 'You concatenate two strings in PHP using the dot operator ($str1 . $str2).'),
(9, 'Which superglobal variable is used to access form data after submitting an HTML form with the POST method?', 'Medium', 'Programming', 'MCQ', '$_GET, $_POST, $_REQUEST, Option D', '$_POST', 'The $_POST superglobal variable is used to access form data after submitting an HTML form with the POST method.'),
(10, 'What is the result of the expression (true && false) in PHP?', 'Medium', 'Programming', 'MCQ', 'true, false, Error, Option D', 'false', 'The result of the expression (true && false) in PHP is false because it represents the logical AND operation and both operands must be true for the result to be true.'),
(11, 'How do you start a session in PHP?', 'Medium', 'Programming', 'Descriptive', NULL, 'session_start();', 'You start a session in PHP using the session_start() function.'),
(12, 'What is the correct way to include an external PHP file named \"functions.php\"?', 'Medium', 'Programming', 'Descriptive', NULL, 'include \"functions.php\";', 'The correct way to include an external PHP file named \"functions.php\" is by using the include statement: include \"functions.php\";'),
(13, 'How do you redirect to another page in PHP?', 'Medium', 'Programming', 'Descriptive', NULL, 'header(\"Location: newpage.php\");', 'You redirect to another page in PHP using the header() function with the \"Location\" header set to the URL of the new page.'),
(14, 'Which PHP function is used to open a file?', 'Medium', 'Programming', 'MCQ', 'open(), fopen(), readfile(), Option D', 'fopen()', 'The fopen() function is used to open a file in PHP.'),
(15, 'What does the PHP function var_dump() do?', 'Medium', 'Programming', 'Descriptive', NULL, 'var_dump() displays structured information about one or more expressions that includes its type and value.', 'The var_dump() function in PHP displays structured information about one or more expressions that includes its type and value.'),
(16, 'How do you check if a variable is empty in PHP?', 'Medium', 'Programming', 'Descriptive', NULL, 'if (empty($variable)) { /* code */ }', 'You check if a variable is empty in PHP using the empty() function inside an if statement.'),
(17, 'What is the correct way to end a PHP script?', 'Medium', 'Programming', 'Descriptive', NULL, '?>', 'The correct way to end a PHP script is with the PHP closing tag: ?>'),
(18, 'How do you access the first element of an array in PHP?', 'Medium', 'Programming', 'Descriptive', NULL, '$array[0];', 'You access the first element of an array in PHP using square brackets with the index of the element.'),
(19, 'What is the purpose of the PHP function htmlentities()?', 'Medium', 'Programming', 'Descriptive', NULL, 'htmlentities() is used to convert characters to HTML entities to prevent XSS attacks and display HTML tags as text.', 'The purpose of the htmlentities() function in PHP is to convert characters to HTML entities to prevent XSS attacks and display HTML tags as text.'),
(20, 'How do you generate a random number between 1 and 100 in PHP?', 'Medium', 'Programming', 'Descriptive', NULL, 'rand(1, 100);', 'You generate a random number between 1 and 100 in PHP using the rand() function with the appropriate range specified.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
