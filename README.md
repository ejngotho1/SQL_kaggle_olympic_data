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
3. From the wizard, select the data source -- Flat file source, browse the location of your first files (athlete_events.csv) and specify the delimter (,)
   
![image](https://user-images.githubusercontent.com/57301554/149724479-34bf3537-3d95-4de6-8852-711c9541026e.png)








