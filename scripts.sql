CREATE TABLE Status (
    Status_ID     NUMBER(1) 
		CONSTRAINT Status_ID_NN NOT NULL,
    Status_Name   VARCHAR2(25) 
		CONSTRAINT Status_Name_NN NOT NULL
);
ALTER TABLE Status ADD CONSTRAINT Status_PK PRIMARY KEY ( Status_ID );
ALTER TABLE Status ADD CONSTRAINT Status_Name_UQ UNIQUE ( Status_Name );


CREATE TABLE Format_Type (
    Format_Type_ID     NUMBER(2) 
		CONSTRAINT Format_Type_ID_NN NOT NULL,
    Format_Type_Name   VARCHAR2(20)
		CONSTRAINT Format_Type_Name_NN NOT NULL
);
ALTER TABLE Format_Type ADD CONSTRAINT Format_Type_PK PRIMARY KEY ( Format_Type_ID );
ALTER TABLE Format_Type ADD CONSTRAINT Format_Type_Name_UQ UNIQUE ( Format_Type_Name );


CREATE TABLE Language (
    Language_ID     NUMBER(3)
		CONSTRAINT Language_ID_NN NOT NULL,
    Language_Name   VARCHAR2(50)
		CONSTRAINT Language_Name_NN NOT NULL,
    Language_Code   VARCHAR2(3)
		CONSTRAINT Language_Code_NN NOT NULL
);
ALTER TABLE language ADD CONSTRAINT Language_PK PRIMARY KEY ( Language_ID );
ALTER TABLE language ADD CONSTRAINT Language_name_UQ UNIQUE ( Language_Name );
ALTER TABLE language ADD CONSTRAINT Language_Code_UQ UNIQUE ( Language_Code );


CREATE TABLE Photo (
    Photo_ID     NUMBER(5)
		CONSTRAINT Photo_ID_NN NOT NULL,
    Photo_URL    VARCHAR2(150)
		CONSTRAINT Photo_URL_NN NOT NULL,
    Photo_Name   VARCHAR2(40)
		CONSTRAINT Photo_Name_NN NOT NULL
);
ALTER TABLE Photo ADD CONSTRAINT Photo_PK PRIMARY KEY ( Photo_ID );
ALTER TABLE Photo ADD CONSTRAINT Photo_URL_UQ UNIQUE ( Photo_URL );
ALTER TABLE Photo ADD CONSTRAINT Photo_Name_UQ UNIQUE ( Photo_Name );


CREATE TABLE Cover_Type (
    Cover_ID     NUMBER(1)
		CONSTRAINT Cover_ID_NN NOT NULL,
    Cover_Name   VARCHAR2(10)
		CONSTRAINT Cover_Name_NN NOT NULL
);
ALTER TABLE Cover_Type ADD CONSTRAINT Cover_Type_PK PRIMARY KEY ( Cover_ID );
ALTER TABLE Cover_Type ADD CONSTRAINT Cover_Name_UQ UNIQUE ( Cover_Name );


CREATE TABLE format (
    Format_ID        NUMBER(7)
		CONSTRAINT Format_ID_NN NOT NULL,
    Page_Number      NUMBER(4),
    Status_ID        NUMBER(1)
		CONSTRAINT Format_StatusID_NN NOT NULL,
    Format_Type_ID   NUMBER(2)
		CONSTRAINT Format_FormatTypeID_NN NOT NULL,
    Language_ID      NUMBER(3)
		CONSTRAINT Format_Language_NN NOT NULL,
    Photo_ID         NUMBER(5)
		CONSTRAINT Format_Photo_NN NOT NULL,
    Cover_ID         NUMBER(1),
    Book_ID          NUMBER(6)
		CONSTRAINT Format_BookID_NN NOT NULL
);
ALTER TABLE format ADD CONSTRAINT Format_PK PRIMARY KEY ( Format_ID );


CREATE TABLE Offer (
    Offer_ID             NUMBER(8)
		CONSTRAINT Offer_ID_NN NOT NULL,
    Offer_Regular_Price   NUMBER(4, 2)
		CONSTRAINT Offer_Regular_Price_NN NOT NULL,
    Offer_URL            VARCHAR2(150)
		CONSTRAINT Offer_URL_NN NOT NULL,
    Format_ID            NUMBER(7)
		CONSTRAINT Offer_FormatID_NN NOT NULL,
    Discount_ID           NUMBER(5),
    Shop_ID               NUMBER(4)
		CONSTRAINT Offer_ShopID_NN NOT NULL
);
ALTER TABLE Offer ADD CONSTRAINT Offer_PK PRIMARY KEY ( Offer_ID );
ALTER TABLE Offer ADD CONSTRAINT Offer_URL_UQ UNIQUE ( Offer_URL );


CREATE TABLE Shop (
    Shop_ID     NUMBER(4)
		CONSTRAINT Shop_ID_NN NOT NULL,
    Shop_Name   VARCHAR2(50)
		CONSTRAINT Shop_Name_NN NOT NULL
);
ALTER TABLE Shop ADD CONSTRAINT Shop_PK PRIMARY KEY ( Shop_ID );
ALTER TABLE Shop ADD CONSTRAINT Shop_Name_UQ UNIQUE ( Shop_Name );


CREATE TABLE Discount (
    Discount_ID       NUMBER(5)
		CONSTRAINT Discount_ID_NN NOT NULL,
    Discount_Code     VARCHAR2(10)
		CONSTRAINT Discount_Code_NN NOT NULL,
    Discount_Pct      NUMBER(3, 2)
		CONSTRAINT Discount_Pct_NN NOT NULL,
    Start_Date        DATE
		CONSTRAINT Start_Date_NN NOT NULL,
    Exparation_Date   DATE
		CONSTRAINT Expiration_Date_NN NOT NULL
);
ALTER TABLE Discount ADD CONSTRAINT Discount_PK PRIMARY KEY ( Discount_ID );


CREATE TABLE Book (
    Book_ID          NUMBER(6)
		CONSTRAINT Book_ID_NN NOT NULL,
    Book_Title       VARCHAR2(50)
		CONSTRAINT Book_Title_NN NOT NULL,
    Book_ISBN        NUMBER(13)
		CONSTRAINT Book_ISBN_NN NOT NULL,
    Relase_Date      DATE
		CONSTRAINT Release_Date_NN NOT NULL,
    Age_ctg_ID       NUMBER(2)
		CONSTRAINT Book_AgeCtgID_NN NOT NULL,
    Author_ID        NUMBER(5)
		CONSTRAINT Book_Author_ID_NN NOT NULL,
    Publ_house_ID    NUMBER(4)
		CONSTRAINT Book_PublHouse_ID_NN NOT NULL,
    Subcategory_ID   NUMBER(4)
		CONSTRAINT Book_Subcategory_ID_NN NOT NULL
);
ALTER TABLE Book ADD CONSTRAINT Book_PK PRIMARY KEY ( Book_ID );
ALTER TABLE Book ADD CONSTRAINT Book_ISBN_UQ UNIQUE ( book_ISBN );


CREATE TABLE Subcategory (
    Subcategory_ID     NUMBER(4)
		CONSTRAINT Subcategory_ID_NN NOT NULL,
    Subcategory_Name   VARCHAR2(40)
		CONSTRAINT Subcategory_Name_NN NOT NULL,
    Category_ID        NUMBER(2)
		CONSTRAINT Subcategory_CategoryID_NN NOT NULL
);
ALTER TABLE Subcategory ADD CONSTRAINT Subcategory_PK PRIMARY KEY ( Subcategory_ID );
ALTER TABLE Subcategory ADD CONSTRAINT Subcategory_Name_UQ UNIQUE ( Subcategory_Name );


CREATE TABLE Category (
    Category_ID     NUMBER(2)
		CONSTRAINT Category_ID_NN NOT NULL,
    Category_Name   VARCHAR2(40)
		CONSTRAINT Category_Name_NN NOT NULL
);
ALTER TABLE Category ADD CONSTRAINT Category_PK PRIMARY KEY ( Category_ID );
ALTER TABLE Category ADD CONSTRAINT Category_Name_UQ UNIQUE ( Category_Name );


CREATE TABLE Review_Head (
    Review_ID        NUMBER(9)
		CONSTRAINT Review_ID_NN NOT NULL,
    Review_Date      DATE
		CONSTRAINT Review_Date_NN NOT NULL,
    Average_Rating   NUMBER(1)
		CONSTRAINT Average_Rating_NN NOT NULL,
    Review_Comment   VARCHAR2(300),
    User_ID          NUMBER(8)
		CONSTRAINT Review_UserID_NN NOT NULL,
    Book_ID          NUMBER(6)
		CONSTRAINT Review_BookID_NN NOT NULL
);
ALTER TABLE Review_Head ADD CONSTRAINT Review_Head_PK PRIMARY KEY ( Review_ID );


CREATE TABLE "User" (
    User_ID           NUMBER(8)
		CONSTRAINT User_ID_NN NOT NULL,
    User_First_Name   NUMBER(25)
		CONSTRAINT User_First_Name_NN NOT NULL,
    User_Last_Name    VARCHAR2(45)
		CONSTRAINT User_Last_Name_NN NOT NULL,
    User_Email        VARCHAR2(50)
		CONSTRAINT User_Email_NN NOT NULL,
    User_Nickname     VARCHAR2(20)
		CONSTRAINT User_Nickname_NN NOT NULL,
	User_Password     VARCHAR2(20)
		CONSTRAINT User_Password_NN NOT NULL,
    User_Age          NUMBER(3),
    User_Type_ID      NUMBER(2)
		CONSTRAINT User_UserType_ID_NN NOT NULL,
    Country_ID        NUMBER(3)
		CONSTRAINT User_CountryID_NN NOT NULL
);
ALTER TABLE "User" ADD CONSTRAINT User_PK PRIMARY KEY ( User_ID );
ALTER TABLE "User" ADD CONSTRAINT User_Email_UQ UNIQUE ( User_Email );
ALTER TABLE "User" ADD CONSTRAINT User_Nickname_UQ UNIQUE ( User_Nickname );


CREATE TABLE User_Type (
    User_Type_ID     NUMBER(2)
		CONSTRAINT User_Type_ID_NN NOT NULL,
    User_Type_Name   VARCHAR2(30)
		CONSTRAINT User_Type_Name_NN NOT NULL
);
ALTER TABLE User_Type ADD CONSTRAINT User_Type_PK PRIMARY KEY ( User_Type_ID );
ALTER TABLE User_Type ADD CONSTRAINT User_Type_Name_UQ UNIQUE ( User_Type_Name );


CREATE TABLE Country (
    Country_ID     NUMBER(3)
		CONSTRAINT Country_ID_NN NOT NULL,
    Country_Name   VARCHAR2(50)
		CONSTRAINT Country_Name_NN NOT NULL,
    Country_Code   VARCHAR2(2)
		CONSTRAINT Country_Code_NN NOT NULL
);
ALTER TABLE Country ADD CONSTRAINT Country_PK PRIMARY KEY ( Country_ID );
ALTER TABLE Country ADD CONSTRAINT Country_Name_UQ UNIQUE ( Country_Name );
ALTER TABLE Country ADD CONSTRAINT Country_Code_UQ UNIQUE ( Country_Code );


CREATE TABLE Rate (
    Rate_ID        NUMBER(11)
		CONSTRAINT Rate_ID_NN NOT NULL,
    Rating         NUMBER(1)
		CONSTRAINT Rating_NN NOT NULL,
    Rate_Comment   VARCHAR2(300),
    Review_ID      NUMBER(10)
		CONSTRAINT Rate_Review_ID_NN NOT NULL,
    Rate_Ctg_ID    NUMBER(2)
		CONSTRAINT Rate_RateCtg_ID_NN NOT NULL
);
ALTER TABLE Rate ADD CONSTRAINT Rate_PK PRIMARY KEY ( Rate_ID );

CREATE TABLE Rate_Category (
    Rate_Ctg_ID     NUMBER(2)
		CONSTRAINT Rate_Ctg_ID_NN NOT NULL,
    Rate_Ctg_Name   VARCHAR2(40)
		CONSTRAINT Rate_Ctg_Name_NN NOT NULL
);
ALTER TABLE Rate_Category ADD CONSTRAINT Rate_Category_PK PRIMARY KEY ( Rate_Ctg_ID );
ALTER TABLE Rate_Category ADD CONSTRAINT Rate_Ctg_Name_UQ UNIQUE ( Rate_Ctg_Name );


CREATE TABLE Publishing_House (
    Publ_House_ID     NUMBER(4)
		CONSTRAINT Publ_House_ID_NN NOT NULL,
    Publ_House_Name   VARCHAR2(50)
		CONSTRAINT Publ_House_Name_NN NOT NULL
);
ALTER TABLE Publishing_House ADD CONSTRAINT Publishing_House_PK PRIMARY KEY ( Publ_House_ID );
ALTER TABLE Publishing_House ADD CONSTRAINT Publ_House_Name_UQ UNIQUE ( Publ_House_Name );


CREATE TABLE Author (
    Author_ID           NUMBER(5)
		CONSTRAINT Author_ID_NN NOT NULL,
    Author_First_Name   VARCHAR2(25)
		CONSTRAINT Author_First_Name_NN NOT NULL,
    Author_Last_Name    VARCHAR2(45)
		CONSTRAINT Author_Last_Name_NN NOT NULL
);
ALTER TABLE Author ADD CONSTRAINT Author_PK PRIMARY KEY ( Author_ID );


CREATE TABLE Age_Category (
    Age_Ctg_ID     NUMBER(2)
		CONSTRAINT Age_Ctg_ID_NN NOT NULL,
    Age_Ctg_Name   VARCHAR2(50)
		CONSTRAINT Age_Ctg_Name_NN NOT NULL
);
ALTER TABLE Age_Category ADD CONSTRAINT Age_Category_PK PRIMARY KEY ( Age_Ctg_ID );
ALTER TABLE Age_Category ADD CONSTRAINT Age_Ctg_Name_UQ UNIQUE ( Age_Ctg_Name );


ALTER TABLE Book
    ADD CONSTRAINT Book_Agectg_FK FOREIGN KEY ( Age_Ctg_ID )
        REFERENCES Age_Category ( Age_Ctg_ID );

ALTER TABLE Book
    ADD CONSTRAINT Book_Author_FK FOREIGN KEY ( Author_ID )
        REFERENCES Author ( Author_ID );

ALTER TABLE Book
    ADD CONSTRAINT Book_Publhouse_FK FOREIGN KEY ( Publ_House_ID )
        REFERENCES Publishing_House ( Publ_House_ID );

ALTER TABLE Book
    ADD CONSTRAINT Book_Subctg_FK FOREIGN KEY ( Subcategory_ID )
        REFERENCES Subcategory ( Subcategory_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_Book_FK FOREIGN KEY ( Book_ID )
        REFERENCES Book ( Book_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_CoverType_FK FOREIGN KEY ( Cover_ID )
        REFERENCES Cover_Type ( Cover_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_FormatType_FK FOREIGN KEY ( Format_Type_ID )
        REFERENCES Format_Type ( Format_Type_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_Language_FK FOREIGN KEY ( Language_ID )
        REFERENCES language ( Language_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_Photo_FK FOREIGN KEY ( Photo_ID )
        REFERENCES Photo ( Photo_ID );

ALTER TABLE Format
    ADD CONSTRAINT Format_Status_FK FOREIGN KEY ( Status_ID )
        REFERENCES Status ( Status_ID );

ALTER TABLE Offer
    ADD CONSTRAINT Offer_Discount_FK FOREIGN KEY ( Discount_ID )
        REFERENCES Discount ( Discount_ID );

ALTER TABLE Offer
    ADD CONSTRAINT Offer_Format_FK FOREIGN KEY ( Format_ID )
        REFERENCES Format ( Format_ID );

ALTER TABLE Offer
    ADD CONSTRAINT Offer_Shop_FK FOREIGN KEY ( Shop_ID )
        REFERENCES Shop ( Shop_ID );

ALTER TABLE Rate
    ADD CONSTRAINT Rate_RateCtg_Fk FOREIGN KEY ( Rate_Ctg_ID )
        REFERENCES Rate_Category ( Rate_Ctg_ID );

ALTER TABLE Rate
    ADD CONSTRAINT Rate_Review_FK FOREIGN KEY ( Review_ID )
        REFERENCES Review_Head ( Review_ID );

ALTER TABLE Review_Head
    ADD CONSTRAINT Review_Book_FK FOREIGN KEY ( Book_ID )
        REFERENCES Book ( Book_ID );

ALTER TABLE Review_Head
    ADD CONSTRAINT Review_User_FK FOREIGN KEY ( User_ID )
        REFERENCES "User" ( User_Id );

ALTER TABLE Subcategory
    ADD CONSTRAINT Subcategory_Ctg_FK FOREIGN KEY ( Category_ID )
        REFERENCES Category ( Category_ID );

ALTER TABLE "User"
    ADD CONSTRAINT User_Country_FK FOREIGN KEY ( Country_ID )
        REFERENCES Country ( Country_ID );

ALTER TABLE "User"
    ADD CONSTRAINT User_Usertype_FK FOREIGN KEY ( User_Type_ID )
        REFERENCES User_Type ( User_Type_ID );