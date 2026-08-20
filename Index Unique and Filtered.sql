select * from Animals;

create unique clustered index Ageindex on Animals (Age)

create unique nonclustered index Ageindex on Animals (Age) where Age < 20;
