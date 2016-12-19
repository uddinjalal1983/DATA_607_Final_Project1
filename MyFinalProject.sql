Drop schema  if exists Final_HIV;
create schema Final_HIV;
use Final_HIV; 

CREATE TABLE HIV_Death (
            Region_Id int not null primary key,
			Region_name varchar(25) NOT null,            
            Number_of_Death varchar(25)
           );
          
              select * from HIV_Death;
              
              CREATE TABLE HIV_Infection (
            Infection_Region_Id int not null primary key,
			Adult_infection_Rate varchar(25) NOT null,            
            Number_of_Infection varchar(25)
            );
          
              select * from HIV_Infection;
              
              CREATE TABLE HIV_Living (
            Living_Region_Id int not null primary key,
            Number_of_Living varchar(25)
            );
          
              select * from HIV_Living;
              
              
           SELECT Region_Id, Region_name, Number_of_Death, Adult_infection_Rate, 
           Number_of_Infection, Number_of_Living FROM HIV_Death AS d
                          INNER JOIN HIV_Infection AS i
                          ON d.Region_Id = i.Infection_Region_Id
                          INNER JOIN HIV_Living AS l
                          ON i.Infection_Region_Id = l.Living_Region_Id;
                          
                          
           CREATE TABLE Mother_Child_Transmission (
            Transmission_Id int not null primary key,
            Country_Name varchar (100),
            Number_Pregnant_antiretrovirals_preventing varchar (10),
            Number_HIV_Need_antiretrovirals varchar (10),
            Percentage_HIV_Receive_antiretrovirals varchar (10)
            );
          
              select * from Mother_Child_Transmission; 
              
          
              
                 CREATE TABLE HIV_Counselling_Receive (
            Counselling_Id int not null primary key,
            Country_Name varchar (100),
            Number_Receive_Counselling varchar (25),
            Number_Receive_Counselling_PerThousand varchar (25)
            );
          
              select * from HIV_Counselling_Receive; 
              
            
              
               CREATE TABLE HIV_Theraphy_Coverage (
            Coverage_Id int not null primary key,
            Country_Name varchar (200),
            Percentage_Receive_Therapy varchar (255),
            Number_Receive_Therapy varchar (255)
            );
          
              select * from HIV_Theraphy_Coverage; 
              
              
           SELECT * FROM Mother_Child_Transmission AS m
                          INNER JOIN HIV_Counselling_Receive AS c
                          ON m. Country_Name = c. Country_Name
                          INNER JOIN HIV_Theraphy_Coverage AS t
                          ON c. Country_Name = t. Country_Name;    
                          
                          
            
           CREATE TABLE Highest_HIV_death (
            Country_Id int not null primary key,
            Country_Name varchar (200),
            total_death varchar (255),
            total_population varchar (255),
            Percentage_death varchar (255)
            ); 
        
                   select * from Highest_HIV_death; 
                   
                    SELECT * FROM Highest_HIV_death AS h
                          INNER JOIN HIV_Counselling_Receive AS c
                          ON h. Country_Name = c. Country_Name
                          INNER JOIN HIV_Theraphy_Coverage AS t
                          ON h. Country_Name = t. Country_Name
                          INNER JOIN Mother_Child_Transmission AS m
                          ON h. Country_Name = m. Country_Name;