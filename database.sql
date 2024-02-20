create database  SocialApplication;
use SocialApplication;
-- signup
CREATE TABLE signup (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    UserName VARCHAR(255),
    Password VARCHAR(255),
    Email VARCHAR(255)
);

-- Table for status:

CREATE TABLE status (
    No INT PRIMARY KEY AUTO_INCREMENT,
    Id INT,
    Status_No INT,
    Status TEXT,
    Comments TEXT,
    Total_Like INT,
    Total_Comments INT,
    Time VARCHAR(255),
    FOREIGN KEY (Id) REFERENCES signup(Id)
);

-- Table for wall_post:

CREATE TABLE wall_post (
    No INT PRIMARY KEY AUTO_INCREMENT,
    Id INT,
    Wallpost_No INT,
    Wallpost TEXT,
    Comments TEXT,
    Total_Like INT,
    Total_Comments INT,
    Post_From VARCHAR(255),
    Time VARCHAR(255),
    FOREIGN KEY (Id) REFERENCES signup(Id)
);

-- Table for message:

CREATE TABLE message (
    No INT PRIMARY KEY AUTO_INCREMENT,
    Sender_Id INT,
    Reciever_Id INT,
    Subject VARCHAR(255),
    Message TEXT,
    Message_No INT,
    Time VARCHAR(255),
    FOREIGN KEY (Sender_Id) REFERENCES signup(Id),
    FOREIGN KEY (Reciever_Id) REFERENCES signup(Id)
);

-- Table for like_track:

CREATE TABLE like_track (
    No INT PRIMARY KEY AUTO_INCREMENT,
    Id INT,
    Post_Type VARCHAR(255),
    Post_No INT,
    Liker_Id INT,
    FOREIGN KEY (Id) REFERENCES signup(Id),
    FOREIGN KEY (Liker_Id) REFERENCES signup(Id)
);

-- Table for notify:

CREATE TABLE notify (
    No INT PRIMARY KEY AUTO_INCREMENT,
    Id INT,
    Notification TEXT,
    Notification_No INT,
    Notification_Type VARCHAR(255),
    Notification_From VARCHAR(255),
    Post_No INT,
    FOREIGN KEY (Id) REFERENCES signup(Id)
);

-- Table for pic_upload:

CREATE TABLE pic_upload (
    Id VARCHAR(255) PRIMARY KEY,
    Image BLOB
);
-- Table for about:

CREATE TABLE about (
    u_Id INT PRIMARY KEY,
    education_institute VARCHAR(255),
    working VARCHAR(255),
    email VARCHAR(255),
    sex VARCHAR(255),
    date_of_birth VARCHAR(255),
    FOREIGN KEY (u_Id) REFERENCES signup(Id)
);

-- Table for privacy:

CREATE TABLE privacy (
    u_Id INT PRIMARY KEY,
    education INT,
    email INT,
    work INT,
    friendlist INT,
    wall INT,
    status INT,
    dob INT,
    FOREIGN KEY (u_Id) REFERENCES signup(Id)
);
-- Table for online:

CREATE TABLE online (
    Id INT PRIMARY KEY,
    birthday VARCHAR(255),
    ontrack INT,
    FOREIGN KEY (Id) REFERENCES signup(Id)
);
