# SQL_kaggle_olympic_data
Solving SQL scenario using real data. I  downloaded 120 years of Olympic data and analyzed the data using various KPIs.
### Downloading Kaggle Data
The location of the data:
https://www.kaggle.com/heesoo37/120-years-of-olympic-history-athletes-and-results

There are two csv files:

![image](https://user-images.githubusercontent.com/57301554/149722288-bf6467b7-aa8d-4bd2-8881-21e99a9bf371.png)

The table structures are as follows:

athlete_events.csv

![image](https://user-images.githubusercontent.com/57301554/149722788-1d02821a-6573-475b-8f63-e98405b25c35.png)

noc_regions.csv

![image](https://user-images.githubusercontent.com/57301554/149723075-3cf60338-7410-411f-b4c6-dc11d3c350e7.png)

### Move files int SSMS

Save the files in a location in the file navigator, then import the csv files directly into SQL Server Management Studio (SSMS).

### Import steps

1. Create a database in SSMS ( I called mine KaggleDemo)

![image](https://user-images.githubusercontent.com/57301554/149723808-f9d78a55-58af-457f-9962-7081c9fcad56.png)

2. Right click on KaggleDemo --> Tasks --> Import data
3. From the wizard, select the data source -- Flat file source, browse the location of your first files (athlete_events.csv) and specify the delimter (,). Check the box for column names in the first row.
   
![image](https://user-images.githubusercontent.com/57301554/149724479-34bf3537-3d95-4de6-8852-711c9541026e.png)

4. Preview the data under the columns tab

![image](https://user-images.githubusercontent.com/57301554/149725426-f57a395b-9aaa-4f8d-b913-954efbacc04d.png)

5. Change data types accordingly under the 'Advanced' tab. Here you can also use the 'suggest types' button for the system to suggest data types for you.

![image](https://user-images.githubusercontent.com/57301554/149726232-2eda43b1-39e0-423b-9ca0-f54a93493691.png)

6. Next page, specify the SQL server instance and make sure your KaggleDemo database appears here.

![image](https://user-images.githubusercontent.com/57301554/149726393-88b8a67f-ea6b-4528-a3a1-264d8f253d7c.png)

7. Next page shows the path to the data source (the csv file path) and also the table name that will be created in the SQL server. You can kee this name or change it to any other name of your choice.

![image](https://user-images.githubusercontent.com/57301554/149726801-ff27a721-15fe-4a99-b739-43b33040fbf4.png)

8. Next page has a preview of the results of data type mappings. Double clicking on a type that we changed, eg id, it will tell you what conversion was done. If we  click on name, it wil tell you that we need no conversion.

![image](https://user-images.githubusercontent.com/57301554/149727472-da83cf95-94f2-49aa-9698-91c3083c75bf.png)
![image](https://user-images.githubusercontent.com/57301554/149727546-733b1ba2-717a-4d7e-b448-0827af631d8a.png)

Name
![image](https://user-images.githubusercontent.com/57301554/149727615-c4396530-0887-408d-af9a-a632986effde.png)
![image](https://user-images.githubusercontent.com/57301554/149727679-8e99538a-fa69-4fb4-9c61-be2bf3617d2e.png)

9.You can run the process immediately

![image](https://user-images.githubusercontent.com/57301554/149727909-2ce82086-1a6a-4e7a-aff0-6e49fa11837a.png)

10. Repeat the 9 steps for the second file (noc_regions.csv)

 ![image](https://user-images.githubusercontent.com/57301554/149729754-10b2e08a-4b84-4bdf-850a-4a904dad8dbe.png)
 
 ## Lets start Analyzing our data
 
 #### We will ask ourselves a number of questions which will inform our insights. The data covers the years 1896 to 2016. We will analyze data for summer and Winter Olympics. This way, we will be able to tell a story about the olympics since 1896. We will find out:
 
 ##### 1. How many olympic games have been held since 1896 to 2016?
 
![image](https://user-images.githubusercontent.com/57301554/149733296-63987e25-d429-4cce-8f84-ac60bdc107ee.png)

![image](https://user-images.githubusercontent.com/57301554/149733714-d28a9eb0-eb80-44e3-b443-1e4fe3e88424.png)

##### 2. What is the total number of nations that have participated in each olympic games

![image](https://user-images.githubusercontent.com/57301554/149733792-e429865b-364d-41b6-a64a-cf459d8f08c6.png)
![image](https://user-images.githubusercontent.com/57301554/149734030-60e3a5ff-7702-40bf-9015-ba41f00bc12f.png)

Listed a few but there are 51 such records

##### 4. Which year saw the highest and the lowest number of countries participating in Olympics?

I used a CTE and nested subqueries in this scenario.

![image](https://user-images.githubusercontent.com/57301554/149735191-aa13355e-1b3f-4947-a597-8fbfcd559b48.png)
![image](https://user-images.githubusercontent.com/57301554/149734928-abd5d213-4bdd-4b8d-9ba3-186fa519b69f.png)

##### 5. Which nation has participated in all of the olympic games?

Here i used a series of CTEs to dig into data and then summarize the data as rquired inthe final outcome. I added a description for each CTE to show what I expect out of it.

![image](https://user-images.githubusercontent.com/57301554/149737493-391d4a67-2840-44ce-8de3-14d37ca9c57e.png)
![image](https://user-images.githubusercontent.com/57301554/149738218-878f1c8a-3156-4667-af8f-1d187cbaa4dc.png)

##### 6. Identify the sport which was played in all summer olympics.

![image](https://user-images.githubusercontent.com/57301554/149818758-4afbd258-17c5-4177-8798-7367f92b9ed6.png)
![image](https://user-images.githubusercontent.com/57301554/149818812-4c2b6ef9-cfad-464a-a4e6-59f0bf087a61.png)

##### 10. Find the Ratio of male to female athletes participated in all olympic games.
--need total male to total female

--then divide male by female

--tehn we will find ratio of women to men

![image](https://user-images.githubusercontent.com/57301554/149819681-b82e7c0e-0ee6-4bb0-86ca-ed783399ebb6.png)
![image](https://user-images.githubusercontent.com/57301554/149819740-4b099ba0-ce5b-4058-a723-262e18389e77.png)

##### 11.  Fetch the top 5 athletes who have won the most gold medals.

![image](https://user-images.githubusercontent.com/57301554/149820566-547ffaab-7a66-4489-a6ac-6753fad46556.png)
![image](https://user-images.githubusercontent.com/57301554/149820630-3228b984-c62e-4224-ba7f-ce252a31ebfa.png)




















