-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 09, 2019 at 04:47 PM
-- Server version: 5.7.20-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `id` int(11) NOT NULL,
  `questionId` int(11) NOT NULL,
  `questionText` varchar(255) NOT NULL,
  `IntAreaId` int(11) NOT NULL,
  `InterestAreaName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`id`, `questionId`, `questionText`, `IntAreaId`, `InterestAreaName`) VALUES
(1, 207, 'Learning how things grow and stay alive.', 1, 'Agriculture, Food & Natural Resources'),
(2, 208, 'Making the best use of the earth\'s natural resources.', 1, 'Agriculture, Food & Natural Resources'),
(3, 209, 'Hunting or fishing.', 1, 'Agriculture, Food & Natural Resources'),
(4, 210, 'Protecting the environment or taking care of animals.', 1, 'Agriculture, Food & Natural Resources'),
(5, 211, 'Being outdoors.', 1, 'Agriculture, Food & Natural Resources'),
(6, 212, 'Planning, budgeting, and keeping records.', 1, 'Agriculture, Food & Natural Resources'),
(7, 213, 'Operating and/or repairing machines.', 1, 'Agriculture, Food & Natural Resources'),
(8, 214, 'Reading and following blueprints and/or instructions.', 2, 'Architecture & Construction'),
(9, 215, 'Picturing in my mind what a finished product will look like.', 2, 'Architecture & Construction'),
(10, 216, 'Working with my hands.', 2, 'Architecture & Construction'),
(11, 217, 'Performing work that requires precise steps.', 2, 'Architecture & Construction'),
(12, 218, 'Solving technical problems.', 2, 'Architecture & Construction'),
(13, 219, 'Visiting and learning from historical or beautiful buildings.', 2, 'Architecture & Construction'),
(14, 220, 'Following logical step-by-step procedures.', 2, 'Architecture & Construction'),
(15, 221, 'Using my imagination to communicate new information to others.', 3, 'Arts, A/V Technology & Communications'),
(16, 222, 'Performing in front of others.', 3, 'Arts, A/V Technology & Communications'),
(17, 223, 'Reading and writing.', 3, 'Arts, A/V Technology & Communications'),
(18, 224, 'Playing a musical instrument.', 3, 'Arts, A/V Technology & Communications'),
(19, 225, 'Performing creative, artistic activities.', 3, 'Arts, A/V Technology & Communications'),
(20, 226, 'Using video and recording technology.', 3, 'Arts, A/V Technology & Communications'),
(21, 227, 'Designing brochures and posters.', 3, 'Arts, A/V Technology & Communications'),
(22, 228, 'Performing routine, organized activities but can be flexible.', 4, 'Business Management & Administration'),
(23, 229, 'Working with numbers and detailed information.', 4, 'Business Management & Administration'),
(24, 230, 'Being the leader in a group.', 4, 'Business Management & Administration'),
(25, 231, 'Making business contact with people.', 4, 'Business Management & Administration'),
(26, 232, 'Working with computer programs.', 4, 'Business Management & Administration'),
(27, 233, 'Creating reports and communicating ideas.', 4, 'Business Management & Administration'),
(28, 234, 'Planning my work and follow instructions without close supervision.', 4, 'Business Management & Administration'),
(29, 235, 'Communicating with different types of people.', 5, 'Education & Training'),
(30, 236, 'Help others with their homework or to learn new things.', 5, 'Education & Training'),
(31, 237, 'Going to school.', 5, 'Education & Training'),
(32, 238, 'Directing and planning activities for others.', 5, 'Education & Training'),
(33, 239, 'Handling several responsibilities at once.', 5, 'Education & Training'),
(34, 240, 'Acquiring new information.', 5, 'Education & Training'),
(35, 241, 'Helping people overcome their challenges.', 5, 'Education & Training'),
(36, 242, 'Working with numbers.', 6, 'Finance'),
(37, 243, 'Working to meet a deadline.', 6, 'Finance'),
(38, 244, 'Making predictions based on existing facts.', 6, 'Finance'),
(39, 245, 'Having a framework of rules by which to operate.', 6, 'Finance'),
(40, 246, 'Analyzing financial information and interpret it to others.', 6, 'Finance'),
(41, 247, 'Handling money with accuracy and reliability.', 6, 'Finance'),
(42, 248, 'Taking pride in the way I dress and look.', 6, 'Finance'),
(43, 249, 'Being involved in politics.', 7, 'Government & Public Administration'),
(44, 250, 'Negotiating, defending, and debating ideas and topics.', 7, 'Government & Public Administration'),
(45, 251, 'Planning activities and working cooperatively with others.', 7, 'Government & Public Administration'),
(46, 252, 'Working with details.', 7, 'Government & Public Administration'),
(47, 253, 'Performing a variety of duties that may change often.', 7, 'Government & Public Administration'),
(48, 254, 'Analyzing information and interpreting it to others.', 7, 'Government & Public Administration'),
(49, 255, 'Traveling and seeing things that are new to me.', 7, 'Government & Public Administration'),
(50, 256, 'Working under pressure.', 8, 'Health Science'),
(51, 257, 'Helping sick people and animals.', 8, 'Health Science'),
(52, 258, 'Making decisions based on logic and information.', 8, 'Health Science'),
(53, 259, 'Participating in health and science classes.', 8, 'Health Science'),
(54, 260, 'Responding quickly and calmly in emergencies.', 8, 'Health Science'),
(55, 261, 'Working as a member of a team.', 8, 'Health Science'),
(56, 262, 'Following guidelines precisely and meet strict standards of accuracy.', 8, 'Health Science'),
(57, 263, 'Investigating new places and activities.', 9, 'Hospitality & Tourism'),
(58, 264, 'Working with all ages and types of people.', 9, 'Hospitality & Tourism'),
(59, 265, 'Organizing activities in which other people enjoy themselves.', 9, 'Hospitality & Tourism'),
(60, 266, 'Having a flexible schedule.', 9, 'Hospitality & Tourism'),
(61, 267, 'Helping people make up their minds.', 9, 'Hospitality & Tourism'),
(62, 268, 'Communicating easily, tactfully, and courteously.', 9, 'Hospitality & Tourism'),
(63, 269, 'Learning about other cultures.', 9, 'Hospitality & Tourism'),
(64, 270, 'Caring about people, their needs, and their problems.', 10, 'Human Services'),
(65, 271, 'Participating in community services and/or volunteering.', 10, 'Human Services'),
(66, 272, 'Listening to other people\'s viewpoints.', 10, 'Human Services'),
(67, 273, 'Working with people from preschool age to old age.', 10, 'Human Services'),
(68, 274, 'Thinking of new ways to do things.', 10, 'Human Services'),
(69, 275, 'Making friends with different kinds of people.', 10, 'Human Services'),
(70, 316, 'Being socially aware or advocating for the rights of others.', 10, 'Human Services'),
(71, 276, 'Reasoning clearly and logically to solve complex problems.', 11, 'Information Technology'),
(72, 277, 'Using machines, techniques, and processes.', 11, 'Information Technology'),
(73, 278, 'Reading technical materials and/or diagrams.', 11, 'Information Technology'),
(74, 279, 'Solving technical problems.', 11, 'Information Technology'),
(75, 280, 'Adapting to change.', 11, 'Information Technology'),
(76, 281, 'Playing video games and figure out how they work.', 11, 'Information Technology'),
(77, 282, 'Concentrating for long periods without being distracted.', 11, 'Information Technology'),
(78, 283, 'Working under pressure or in the face of danger.', 12, 'Law, Public Safety, Corrections & Security'),
(79, 284, 'Making decisions based on my own observations.', 12, 'Law, Public Safety, Corrections & Security'),
(80, 285, 'Interacting with other people.', 12, 'Law, Public Safety, Corrections & Security'),
(81, 286, 'Respecting rules and regulations.', 12, 'Law, Public Safety, Corrections & Security'),
(82, 287, 'Debating and winning arguments.', 12, 'Law, Public Safety, Corrections & Security'),
(83, 288, 'Observing and analyzing people\'s behavior.', 12, 'Law, Public Safety, Corrections & Security'),
(84, 317, 'Helping people in need or standing up for the rights of others', 12, 'Law, Public Safety, Corrections & Security'),
(85, 289, 'Working with my hands.', 13, 'Manufacturing'),
(86, 290, 'Putting things together.', 13, 'Manufacturing'),
(87, 291, 'Doing routine, organized and accurate work.', 13, 'Manufacturing'),
(88, 292, 'Performing activities that produce tangible results.', 13, 'Manufacturing'),
(89, 293, 'Applying math to work out solutions.', 13, 'Manufacturing'),
(90, 294, 'Using hand and power tools and operate equipment/machinery.', 13, 'Manufacturing'),
(91, 295, 'Visualizing objects in three dimensions from flat drawings.', 13, 'Manufacturing'),
(92, 296, 'Shopping and going to the mall.', 14, 'Marketing, Sales & Service'),
(93, 297, 'Being in charge.', 14, 'Marketing, Sales & Service'),
(94, 298, 'Making displays and promote ideas.', 14, 'Marketing, Sales & Service'),
(95, 299, 'Giving presentations and enjoy public speaking.', 14, 'Marketing, Sales & Service'),
(96, 300, 'Persuading people to buy products or to participate in activities.', 14, 'Marketing, Sales & Service'),
(97, 301, 'Communicating my ideas to other people.', 14, 'Marketing, Sales & Service'),
(98, 302, 'Taking advantage of opportunities to make extra money.', 14, 'Marketing, Sales & Service'),
(99, 303, 'Interpreting formulas.', 15, 'Science, Technology, Engineering & Mathematics'),
(100, 304, 'Finding the answers to questions.', 15, 'Science, Technology, Engineering & Mathematics'),
(101, 305, 'Working in a laboratory.', 15, 'Science, Technology, Engineering & Mathematics'),
(102, 306, 'Figuring out how things work and investigate new things.', 15, 'Science, Technology, Engineering & Mathematics'),
(103, 307, 'Exploring new technology.', 15, 'Science, Technology, Engineering & Mathematics'),
(104, 308, 'Experimenting to find the best way to do something.', 15, 'Science, Technology, Engineering & Mathematics'),
(105, 309, 'Paying attention to details and help things be precise.', 15, 'Science, Technology, Engineering & Mathematics'),
(106, 310, 'Traveling.', 16, 'Transportation, Distribution & Logistics'),
(107, 311, 'Seeing well and having quick reflexes.', 16, 'Transportation, Distribution & Logistics'),
(108, 312, 'Designing efficient processes.', 16, 'Transportation, Distribution & Logistics'),
(109, 313, 'Anticipating needs and preparing to meet them.', 16, 'Transportation, Distribution & Logistics'),
(110, 314, 'Driving or riding.', 16, 'Transportation, Distribution & Logistics'),
(111, 315, 'Moving things from one place to another.', 16, 'Transportation, Distribution & Logistics'),
(112, 318, 'Working with machines or automotive technology.', 16, 'Transportation, Distribution & Logistics');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `email` varchar(500) DEFAULT NULL,
  `primaryEmail` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`id`, `userId`, `score`, `created_at`, `updated_at`) VALUES
(2, 15, 69, '2019-06-08 19:50:25', '2019-06-08 19:50:25'),
(3, 16, 8, '2019-06-09 20:29:46', '2019-06-09 20:29:46'),
(4, 17, NULL, '2019-06-09 20:35:02', '2019-06-09 20:35:02');

-- --------------------------------------------------------

--
-- Table structure for table `usage_log`
--

CREATE TABLE `usage_log` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `sessionId` varchar(255) DEFAULT NULL,
  `login` datetime DEFAULT NULL,
  `logout` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usage_log`
--

INSERT INTO `usage_log` (`id`, `userId`, `sessionId`, `login`, `logout`, `created_at`, `updated_at`) VALUES
(79, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 13:20:39', '2019-06-08 14:00:34', '2019-06-08 18:00:34', '2019-06-08 18:00:34'),
(80, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:00:53', '2019-06-08 14:07:40', '2019-06-08 18:07:40', '2019-06-08 18:07:40'),
(81, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:07:59', '2019-06-08 14:11:16', '2019-06-08 18:11:16', '2019-06-08 18:11:16'),
(82, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:11:38', '2019-06-08 14:21:30', '2019-06-08 18:21:30', '2019-06-08 18:21:30'),
(83, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:21:50', '2019-06-08 14:33:07', '2019-06-08 18:33:07', '2019-06-08 18:33:07'),
(84, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:33:20', '2019-06-08 14:33:51', '2019-06-08 18:33:51', '2019-06-08 18:33:51'),
(85, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:34:05', '2019-06-08 14:42:37', '2019-06-08 18:42:37', '2019-06-08 18:42:37'),
(86, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 14:49:07', '2019-06-08 15:53:13', '2019-06-08 19:53:13', '2019-06-08 19:53:13'),
(87, 15, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-08 15:53:26', '2019-06-08 15:54:06', '2019-06-08 19:54:06', '2019-06-08 19:54:06'),
(88, 16, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-09 16:20:53', '2019-06-09 16:22:35', '2019-06-09 20:22:35', '2019-06-09 20:22:35'),
(89, 16, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-09 16:25:54', '2019-06-09 16:29:55', '2019-06-09 20:29:55', '2019-06-09 20:29:55'),
(90, 17, '2cpntu9i1tfc5vb6iglrs97gk1', '2019-06-09 16:35:02', '2019-06-09 16:35:09', '2019-06-09 20:35:09', '2019-06-09 20:35:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fName` varchar(500) DEFAULT NULL,
  `lName` varchar(500) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fName`, `lName`, `age`, `email`, `password`, `created_at`, `updated_at`) VALUES
(15, 'Matthew', 'ODell', 40, 'mro_guitar@hotmail.com', '$2y$10$fIyzpv3JFC9b.YbpAvO9Ku1GXlnA4emHWhx58gR5Xe1eVIhzE4BOi', '2019-06-08 17:20:39', '2019-06-08 17:20:39'),
(16, 'John', 'Doe', 45, 'testuser@gmail.com', '$2y$10$WLzPLJsU5IeibyJn6EyJFebed3aeat.NUFDnb4PA2Lx9nxJPIZJZe', '2019-06-09 20:20:53', '2019-06-09 20:20:53'),
(17, 'Nancy', 'Grace', 34, 'nancy@gmail.com', '$2y$10$yujj8nWmWy1MuvNvaZ.EcukLUROTfhDseOoMiXBdzulAZyuzBPs76', '2019-06-09 20:35:02', '2019-06-09 20:35:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usage_log`
--
ALTER TABLE `usage_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment`
--
ALTER TABLE `assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usage_log`
--
ALTER TABLE `usage_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
