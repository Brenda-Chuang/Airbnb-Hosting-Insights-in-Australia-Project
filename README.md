# Airbnb Hosting in Australia Project
 
## Dashboard Overview


## Problem Statement

This project aims to provide potential Airbnb hosts in Australia, particularly in NSW, VIC, QLD, and WA, with key insights based on booking rates, listing details, and existing host information. <br/>

Potential Airbnb hosts who wish to invest in the Airbnb business have approached to provide key insights to better understand the market. They have posed several questions, and additionally, requested an interactive dashboard for visualization purposes. This dashboard should be able to answer the following questions and provide other relevant information for further data exploration: <br/>

1. Which location is ideal for starting an Airbnb business based on booking rates? <br/>
2. What is the listing price range for the identified location in question 1? 
3. what is the most common property and room type for the identified location in question 1? <br/>
4. What is the most common number of accommodates, beds, and bathrooms for the identified location in question 1? <br/>
5. What is the seasonality of Airbnb hosting for the overall Australian market and the identified location in question 1? <br/>
6. Who are the dominant hosts in the identified location? Provide detailed information including but not limited to their tenure, number of listings,
   and estimated revenue for the next 30 days. <br/>

The goal is to equip potential hosts with actionable insights to make informed decisions about their Airbnb investments. <br/> 

## Data Collection

The data was collected from Inside Airbnb (https://insideairbnb.com/get-the-data/). <br/>
The downloaded CSV files (listings.csv.gz) include the following: <br/>
1. Sydney, New South Wales, Australia <br/>
2. Melbourne, Victoria, Australia <br/>
3. Brisbane, Queensland, Australia <br/>
4. Western Australia, Western Australia, Australia <br/>

This project used the above data to represent the Airbnb listing in NSW, VIC, QLD, and WA (Sates).

## Data Cleaning

**Tool: Python (Pandas/Matplotlib/Seaborn)** <br/>
<br/>
The data cleaning includes the following steps:<br/>
- Pre-cleaning: Concat all CSV files into one single dataframe <br/>
- Step 1: Raw Data Understanding (e.g., data shape, data attributes, and data type.) <br/>
- Step 2: Data preparation (e.g., change data type, split columns, and handling missing values.) <br/>
The cleaned data was written into a CSV file for further data storage.<br/>

Detailed steps and codes are documented in [Airbnb_Data cleaning_Python.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Raw%20airbnb%20data/Airbnb_Data%20cleaning_Python.ipynb).<br/>

## Load Data into the PostgreSQL database
**Tool: Python(Pandas/psycopg2/sqlalchemy) | SQL(PostgreSQL)**<br/>
<br/>
- Step 1: Create an Airbnb database (Python).  <br/>
- Step 2: Create tables and load the cleaned CSV file into the Airbnb database (Python). <br/>
- Step 3: Change the data type to the correct format (PostgreSQL). <br/>

Detailed steps and codes are documented in [Airbnb_Load Data into PostgreSQL.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Raw%20airbnb%20data/Airbnb_Load%20data%20into%20PostgreSQL.ipynb).<br/>

## Summary of Exploratory Data Analysis <br/>
Exploratory data analysis in Python was conducted after data cleaning and before dash board creation to get a fundamental understanding of the dataset. <br/>

- Python: Used for a broader understanding of the data. This includes: <br/>
  - Understand the data statistics and distribution. <br/>
  - Explore relationships through data correlation. <br/>

1. Pricing <br/>
   - Western Australia's average listing price is the highest, $245, slightly higher than that of NSW ($242).
     The figure for QLD is the lowest, with an average listing price of $182.
     <br/>
     ![image](https://github.com/user-attachments/assets/8636042a-bcd7-476e-83ff-a87a585db748)
     <br/>
     ![image](https://github.com/user-attachments/assets/28e9ff6b-bf8b-449a-89d3-3b392d3d5428)

2. Host Joining Trend <br/>
   - The number of hosts joining Airbnb saw a significant increase from 2013 to 2015,
   - peaking in 2015 and 2016 across all states, with VIC experiencing the most drastic growth.
   - From 2017 to 2021, there was a sharp decline in the number of new hosts.
   - Starting in 2022 and continuing into 2023, the number of new hosts began to rise again. <br/>
   
   ![image](https://github.com/user-attachments/assets/4ced4bb2-06b9-4d27-a2f1-9bfacdc5d1fe) <br/>
   
3. Host Response and Acceptance Rate <br/>
  
   Airbnb hosts in WA and QLD tend to respond to guests and accept bookings more frequently, compared to hosts in NSW and VIC. <br/>
   <br/>
   ![image](https://github.com/user-attachments/assets/17b636dc-b3c6-4a3d-8039-a08c3868f4fd) <br/>
  
4. Review Rating score <br/>
  
   - Based on the point chart, Cleanliness and Value negatively impact the overall rating score, with Value being the most influential negative factor. <br/>
   <br/>
   ![image](https://github.com/user-attachments/assets/b9b55e74-1b07-4d44-bb2e-25ceaebf2b2a) <br/>
   <br/>
  
   - Based on the correlation heat map, Accuracy and Value are two factors that strongly and positively correlate with the overall rating score.
     In addition, Cleanliness is the second most influential factor in the overall rating score. 
     <br/>
     ![image](https://github.com/user-attachments/assets/26462ccf-77b6-4df2-a39b-b1ecaa633375) <br/>
     <br/>

- SQL: <br/>
Used for more detailed and specific analysis. This includes: <br/>
  - Identify the top-rated host in each state (WA, NSW, VIC, QLD).<br/>
    ![image](https://github.com/user-attachments/assets/9ddec175-5724-4f3c-81b8-a822b984c309) <br/>
    <br/>
  - Identify the dominant host in each state (the host with the most listings).<br/>
    ![image](https://github.com/user-attachments/assets/1f84e86d-bb99-49ae-8a5c-8cbadab9edae) <br/>
    <br/>
  - Calculate the total revenue and also the revenue in each suburb for the top dominant host in WA for the next 30 days.<br/>
    ![image](https://github.com/user-attachments/assets/11f084ca-daf8-4634-b811-0049188c4993) br/>
    <br/>

Conclusion: <br/>
1. To improve the overall rating score, hosts should focus on enhancing the Value and Cleanliness of their listings,
   as these factors significantly influence guest satisfaction. 
   Additionally, maintaining high accuracy in listing descriptions can positively impact overall ratings. <br/>
2. The correlation of review rating scores among various categories can be presented in the interactive.
    This can provide potential hosts with insights on how to improve overall ratings, which may, in turn, increase booking rates and revenue.
3. Host information will be presented on one of the report pages for stakeholder exploration.















