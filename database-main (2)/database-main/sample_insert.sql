USE Caregivers;

-- EXPECTED USAGE -- passwords HASHED HERE but == "123"
INSERT INTO member (username, passwd, address, phoneNumber, availability, numParents)
VALUES
('john', '$2y$10$jlOOz0s7TSHrLAbjAS/KP.u8E2J.NSmr3BFR57ABH3QNFf7DTm752', 'Orlando', '1234567890', 35, 1),
('jane', '$2y$10$eOpWkthQrB2YaGWmJYwr5euV90XwzHjWXtsh6AQIBXFt00Ol9owZy', 'Orlando', '9876543210', 44, 2),
('amy', '$2y$10$zVpjl13RoMkVSNAQd1a5NO9EqSbg57dWoucqY03dGjduea8cTap0i', 'Orlando', '1234567890', 35, 1),
('bryan', '$2y$10$7e.jjw1d3T01j7XDmo4Hxez69eNN0ClkIoGnvtsumxHii4CaoL8UK', 'Tampa', '1234567890', 35, 1),
('charlie', '$2y$10$qJtyW6A69eHaB8xCfZcMROdrff8grAoVAWhQOmS1CSHQozGAmXVMi', 'Miami', '1234567890', 35, 2),
('damian', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Tampa', '1234567890', 35, 2),
('esmeralda', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Gainsville', '1234567890', 0, 1),
('fiona', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Miami', '1234567890', 0, 1),
('german', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Orlando', '1234567890', 0, 2),
('hector', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Orlando', '1234567890', 0, 1),
('ignacio', '$2y$10$OFHko5We95b4Ec7bOYsWJO2yWmNwAvIPQr.3RQ14cPB7qhyHp9w6i', 'Orlando', '1234567890', 0, 1);

INSERT INTO contracts (caretakerID, clientID, startDate, endDate, dailyHoursWorked)
VALUES
(1, 2, '2010-11-04', '2010-11-15', 1), 
(2, 1, '2023-11-15', '2023-12-06', 1),
(1, 3, '2022-11-04', '2022-11-21', 1),
(1, 4, '2021-11-04', '2021-11-20', 1),
(1, 5, '2024-11-04', '2024-11-18', 1),
(1, 6, '2027-11-04', '2027-11-26', 1),
(2, 7, '2021-08-01', '2021-08-18', 1),
(5, 8, '2024-04-06', '2024-04-23', 1),
(1, 9, '2022-01-03', '2022-01-22', 1),
(1, 10, '2020-07-10', '2020-05-26', 1),
(1, 11, '2010-05-14', '2010-05-26', 1),
(5, 1, '2012-05-14', '2012-05-26', 4),
(5, 1, '2010-05-14', '2010-05-26', 3),

(1, 1, '2011-05-14', '2011-05-26', 1),
(1, 1, '2012-05-14', '2012-05-26', 1),
(1, 1, '2013-05-14', '2013-05-26', 1);


INSERT INTO reviews (caretakerID, memberID, contractID, rating, dateOfCompletion)
VALUES
(1, 2, 1, 4, '2010-11-15'),
(2, 1, 2, 5, '2023-12-06'),
(1, 2, 3, 1, '2022-11-21'),
(1, 2, 4, 3, '2021-11-20'),
(1, 2, 5, 2, '2024-11-18'),
(1, 2, 6, 5, '2027-11-26'),
(2, 7, 7, 5, '2021-08-18'),
(5, 8, 8, 5, '2024-04-23'),
(1, 9, 9, 5, '2022-01-22'),
(1, 10, 10, 5, '2020-05-26'),
(1, 11, 11, 5, '2010-05-26'),
(5, 1, 12, 5, '2012-05-26'),
(5, 1, 13, 5, '2010-05-26'),

(1, 6, 14, 2, '2011-05-26'),
(1, 2, 15, 1, '2012-05-26'),
(1, 7, 16, 4, '2013-05-26');



INSERT INTO parents (memberID, parentID, parentName, age, needs)
VALUES
(1, 1, 'Mary Doe', 45, 'Help with daily activities'),
(2, 2, 'Peter Smith', 60, 'Assistance with medication'),
(2, 3, 'Petera Smith', 55, 'Feed them, walk them'),
(3, 4, 'jackie Baynes', 64, 'Feed them, walk them'),
(4, 5, 'steven Baynes', 60, 'Feed them, walk them'),
(5, 6, 'ronald washington', 55, 'Feed them, walk them'),
(5, 7, 'lucy washington', 44, 'Feed them, walk them'),
(6, 8, 'jamie rivera', 64, 'Feed them, walk them'),
(6, 9, 'james rivera', 55, 'Feed them, walk them'),
(7, 10, 'arup guha', 54, 'Feed them, walk them'),
(8, 11, 'travis meade', 74, 'Feed them, walk them'),
(9, 12, 'tanvira ahmed', 84, 'Feed them, walk them'),
(9, 13, 'tanvir ahmed', 94, 'Feed them, walk them'),
(10, 14, 'kien hua', 61, 'Feed them, walk them'),
(11, 15, 'andrew steinberg', 69, 'Feed them, walk them');
