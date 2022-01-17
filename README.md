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














