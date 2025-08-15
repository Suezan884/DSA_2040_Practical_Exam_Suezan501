# DSA_2040_Practical_Exam_Suezan501 

# Project overview 

This project is split into four major tasks:

Database Design — Creating a structure to store sales data

OLAP Analysis — Running smart queries to answer business questions

Clustering & Classification — Using machine learning to find patterns

Association Rule Mining — Discovering which products are often bought together 

# Designing database (star schema)
I created three dimension tables ProductDim, CustomerDim and TimeDim and one fact table SalesFact. 
ProductionDim had; ProductID,ProductName,Category,and UnitPrice
CustomerDim had; CustomerID, Name, Location, Gender, Age
TimeDim had; Date, Month, Quarter, Year
SalesFact had; ProductID, CustomerID, TimeID, Sales Amount, Quantity

![alt text](star_schema.png)

# Data generation 
Using python, I created synthetic data for each table 
This is the output

Synthetic data generated:
   InvoiceNo StockCode Description  Quantity InvoiceDate  UnitPrice  \
0  INV770487      P002  Smartphone         2  2024-04-18      74.41   
1  INV872246      P002  Smartphone        44  2025-02-20      74.33   
2  INV542417      P001      Laptop         2  2024-04-06      10.28   
3  INV127824      P009       Mouse        13  2025-07-30      71.89   
4  INV331148      P008    Backpack        38  2023-08-18      28.54   

   CustomerID   Country  
0          29  Tanzania  
1          12  Botswana  
2          65  Botswana  
3          70   Nigeria  
4          98  Tanzania  

I also transformed data for all the dimension tables 
Transformed Sales Data (Recent):
    InvoiceNo StockCode Description  Quantity InvoiceDate  UnitPrice  \
1   INV872246      P002  Smartphone        44  2025-02-20      74.33   
3   INV127824      P009       Mouse        13  2025-07-30      71.89   
8   INV678856      P005         Pen        41  2024-08-16      62.23   
10  INV205907      P007     Monitor        18  2024-08-19      45.89   
11  INV472528      P004    Notebook        43  2025-07-11      27.43   

    CustomerID       Country  TotalSales  
1           12      Botswana     3270.52  
3           70       Nigeria      934.57  
8           74        Rwanda     2551.43  
10          21  South Africa      826.02  
11          83        Uganda     1179.49  

Customer Summary:
   CustomerID  TotalSales       Country
0           1     7527.79  South Africa
1           2    12012.99        Zambia
2           3     9366.79        Uganda
3           4     2367.62        Uganda
4           5     6511.92        Zambia

I loaded the data into SQLITE using sqlite3 and connected the data with retail_dw.db
Then I did full ETL

# OLAP QUERIES
Did three OLAP queries; roll up, drill down and slice. 
In roll up I calculated total sales by country and quarter. It revealed that Uganda, Zambia and Botswana has the highest sales.
Drill down; Sales details for a specific country where I used South Africa
Slice; Did total sales for electronic category 

I used bar chart to visualize sales by country. And according to the data, Uganda had the highest sales amount followed by Zambia while South Africa had the least sales amount.


# Data mining 
# Data processing and exploration 
Generated synthetic data using numpy, and handled the missing values 
![alt text](<Screenshot (159).png>)
Computed summary statistic 


Summary statistics:
        sepal length  sepal width  petal length  petal width     species
count    150.000000   150.000000    150.000000   150.000000  150.000000
mean       5.829097     3.087655      3.794590     1.231140    1.000000
std        0.764470     0.516098      1.839219     0.854412    0.819232
min        4.338785     1.927000      0.228414    -0.688868    0.000000
25%        5.120275     2.676704      1.631143     0.573194    0.000000
50%        5.828393     3.058947      4.594370     1.354638    1.000000
75%        6.426243     3.403860      5.233814     1.888265    2.000000
max        7.421594     4.601595      6.876917     3.015485    2.000000

Did visualization using correlation heatmap, pair plot and boxplot

![alt text](correlation_heatmap.png)

# Train-test split 
To prepare the dataset for machine learning, I implemented a function that splits the data into training and testing sets using an 80/20 ratio. This is a standard practice to ensure that models are trained on one portion of the data and evaluated on another, helping to prevent overfitting .
80% is used to teach the model patterns in the data.
20% is used to evaluate how well the model performs on unseen data.
This split ensures that the model’s performance reflects its ability to generalize beyond the data it was trained on.
This the output 

Data split complete:
Train size: 120, Test size: 30

This confirms that the dataset was successfully split into:
120 training samples
30 testing samples

# Applying k-means clustering 
I loaded the processed data and then applied k-means with k=3 

Adjusted Rand Index (k=3): 0.5073

![alt text](cluster_scatter.png)

Experimented k=2 and k=4 and used elbow curve to show it
![alt text](elbow_curve.png)









