CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(50),
    EventDate DATE,        -- Only date
    EventDateTime DATETIME, -- Date + time
    EventTime TIME          -- Only time
);

INSERT INTO Events (EventID, EventName, EventDate, EventDateTime, EventTime) VALUES
(1, 'Conference', '2024-05-10', '2024-05-10 09:30:00', '09:30:00'),
(2, 'Workshop',   '2024-06-15', '2024-06-15 14:00:00', '14:00:00'),
(3, 'Webinar',    '2024-07-20', '2024-07-20 18:45:00', '18:45:00'),
(4, 'Hackathon',  '2024-08-05', '2024-08-05 22:15:00', '22:15:00'),
(5, 'Seminar',    '2024-09-12', '2024-09-12 11:00:00', '11:00:00');


select * from events;

select EventDate,EventTime,EventDateTime from events;

select * from Events where Month(EventDateTime) <= 07;

select day(eventdate) as day, Month(EventDate) as month, year(eventdate) as year from events;

select DATEPART(Week,eventdatetime) from events;

select DATENAME(month,eventdatetime) from events;

select DATETRUNC(month,eventdatetime) from events;

select Datepart(Month,EventDateTime)as Month, count(*)as countMonth from events group by Datepart(Month,EventDateTime) 
having Datepart(Month,EventDateTime)<8;

--formatting

select EventDate,EventTime,EventDateTime from events;

select format(EventDateTime,'dd/MM/yyyy HH:mm:ss'),EventDateTime from events;

select format(EventDateTime,'dd/MM/yyyy'),EventDateTime from events;

--dd: 1, ddd: wed, dddd:wednesday
--MM: 12, MMM: Dec, MMMM: December

--Practice: Day Wed Jan Q1 2025 12:34:56 PM
select Datepart(QUARTER,EventDateTime) from events;

select 'Day ' + format(EventDateTime,'ddd MM') + ' ' + 'Q'+ DateName(QUARTER,EventDateTime) 
+ ' ' + format(EventDateTime,'yyyy hh:mm:ss tt'),
'Day Wed Jan Q1 2025 12:34:56 PM'  
, EVENTDATETIME from events;