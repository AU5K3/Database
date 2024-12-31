# database
additional table i had to make you can just run this to test the site and see any other potential bugs i've missed. 

CREATE TABLE care_requests (
    requestID INT AUTO_INCREMENT PRIMARY KEY,
    memberID INT NOT NULL,
    parentID INT NOT NULL,
    startDate DATE NOT NULL,
    startTime TIME NOT NULL,
    endDate DATE NOT NULL,
    endTime TIME NOT NULL,
    FOREIGN KEY (memberID) REFERENCES member(memberID),
    FOREIGN KEY (parentID) REFERENCES parents(parentID)
);

ALTER TABLE contracts ADD COLUMN status ENUM('pending', 'accepted', 'denied') DEFAULT 'pending';
ALTER TABLE contracts ADD COLUMN requestID INT AFTER dailyHoursWorked;
