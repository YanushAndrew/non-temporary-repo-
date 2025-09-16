CREATE TABLE IF NOT EXISTS Student (
    ID UUID PRIMARY KEY,
    Name VARCHAR(20) NOT NULL CHECK (Name ~ '^[A-Za-zА-ЯҐЄІЇЮЯа-яґєїюя\s-]+$'),
    Surname VARCHAR(30) NOT NULL CHECK (Surname ~ '^[A-Za-zА-ЯҐЄІЇЮЯа-яґєїюя\s-]+$'),
    PhoneNumber VARCHAR(15) CHECK (PhoneNumber ~ '^\+380[0-9]{9}$'),
    RegDate TIMESTAMP NOT NULL
);

---

CREATE TABLE IF NOT EXISTS Course (
    ID UUID PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);

---

CREATE TABLE IF NOT EXISTS Instructor (
    TIN VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(20) NOT NULL CHECK (Name ~ '^[A-Za-zА-ЯҐЄІЇЮЯа-яґєїюя\s-]+$'),
    Surname VARCHAR(30) NOT NULL CHECK (Surname ~ '^[A-Za-zА-ЯҐЄІЇЮЯа-яґєїюя\s-]+$'),
    PhoneNumber VARCHAR(15) CHECK (PhoneNumber ~ '^\+380[0-9]{9}$'),
    PassportID VARCHAR(20),
    RegDate TIMESTAMP NOT NULL
);

---

CREATE TABLE IF NOT EXISTS Enrollment (
    ID UUID PRIMARY KEY,
    HumanID UUID NOT NULL,
    IsLector BINARY(1) NOT NULL,
    CourseID UUID NOT NULL,
    FOREIGN KEY (HumanID) REFERENCES Student(ID),
    FOREIGN KEY (CourseID) REFERENCES Course(ID)
);

---

CREATE TABLE IF NOT EXISTS Lesson (
    ID UUID PRIMARY KEY,
    CourseID UUID NOT NULL,
    LectorID UUID NOT NULL,
    StartTime TIMESTAMP NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Course(ID),
    FOREIGN KEY (LectorID) REFERENCES Instructor(TIN)
);

---

CREATE TABLE IF NOT EXISTS Payment (
    ID UUID PRIMARY KEY,
    StudentID UUID NOT NULL,
    Sum FLOAT NOT NULL,
    Time TIMESTAMP NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(ID)
);
