# Airbnb Hosting Insights in Australia
 
# Dashboard Overview

The interactive dashboard provides actionable insights for Airbnb hosting in Australia, allowing users to explore trends in bookings.

https://github.com/user-attachments/assets/95313bad-92dc-4e1f-b2ad-1d7888ea7c38

## Key Features
- Main Report Page: Provides a high-level overview.
- Drill-Through to Listing Details: Allows users to explore detailed information about specific listings from the main report page. Additionally, a map visual is applied for a better geographical understanding of each listing.
- Rating Insights: Apply the key influencer and the map visual to help potential hosts understand factors influencing overall rating.
- Hosting Insights: Present detailed information about existing hosts, including their tenure, number of listings, ratings, and estimated revenue for the next 30 days.
- Light and dark modes: Allows users to switch between visual themes based on preference.

# Project Overview
As someone who has travelled extensively and stayed at various Airbnb accommodations, I became curious about the key factors that contribute to successful hosting. This project explores hosting trends in Australia using publicly available Airbnb data, providing actionable insights for new and existing hosts to optimize their strategies.<br/>
By leveraging Python, SQL, and Power BI, the project transforms raw data into meaningful visualisations, helping hosts make data-driven decisions about pricing, occupancy, and revenue potential.<br/>

## Key Insights:<br/>
- Suburbs like Busselton, Albany, and Denmark in WA have higher booking rates, especially in the next 30 days (e.g., Busselton at 87%).
- The number of reviews fluctuates throughout the year, with a peak around December and a significant dip during July, reflecting seasonal demand.
- Entire homes/apartments dominate the market with the highest number of listings, followed by private rooms.
- Identified **Value**, **Cleanliness**, and **Accuracy** as critical factors significantly impacting overall guest satisfaction.

## Actionable Recommendations for Hosts:<br/>
- Enhance Value by offering competitive pricing and additional amenities.<br/>
- Improve Cleanliness through thorough cleaning protocols and guest feedback.<br/>
- Ensure Accuracy in listing descriptions to set correct guest expectations.

## Dataset

The data was collected from Inside Airbnb (https://insideairbnb.com/get-the-data/) in June 2024. <br/>
The downloaded CSV files (listings.csv.gz) include the following: <br/>
1. Sydney, New South Wales, Australia <br/>
2. Melbourne, Victoria, Australia <br/>
3. Brisbane, Queensland, Australia <br/>
4. Western Australia, Western Australia, Australia <br/>

This project used the above data to represent the Airbnb listing in NSW, VIC, QLD, and WA (Sates).

# Project Workflow

## 1. Data Cleaning

**Tool: Python (Pandas)** <br/>
<br/>
The data cleaning includes the following steps:<br/>
- Pre-cleaning: Concat all CSV files into one single dataframe <br/>
- Step 1: Raw Data Understanding (e.g., data shape, data attributes, and data type.) <br/>
- Step 2: Data preparation <br/>
  - Handled Missing Values: Dropped rows with critical missing values in the price column.
  - Detected and Removed Outliers: 
    - Price: Applied the Interquartile Range (IQR) method to flag outliers. Outliers defined as values outside [Q1 - 1.5 * IQR, Q3 + 1.5 * IQR]. Removed rows with price values exceeding the bounds to clean the dataset.
    - Rating Score: Removed rows with rating score lower than 0 or higher than 5.

- Step 3: The cleaned data was written into a CSV file for further data storage.<br/>

Detailed steps and codes are documented in [Airbnb_Data cleaning_Python.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Airbnb_Data%20cleaning_Python.ipynb).<br/>

## 2. Exploratory Data Analysis <br/>
Exploratory data analysis in Python was conducted after data cleaning and before dashboard creation to get a fundamental understanding of the dataset. <br/>

**Tool: Python (Pandas/Matplotlib/Seaborn)

1. Pricing <br/>
   - Western Australia's average listing price is the highest, $245, slightly higher than that of NSW ($242).
     The figure for QLD is the lowest, with an average listing price of $182. 

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
  
   - Value consistently has the lowest average rating across all states, suggesting it could negatively impact the overall score.
   - Cleanliness is slightly higher than Value but still lags behind categories like Location and Communication.
   - The line chart revealed that Value and Cleanliness have consistently lower scores across states, suggesting they might negatively impact overall ratings.
   
     ![image](https://github.com/user-attachments/assets/b9b55e74-1b07-4d44-bb2e-25ceaebf2b2a) 
  
   - The correlation heatmap confirmed that Accuracy and Value have the strongest positive correlations with overall ratings, with Accuracy being the most influential factor (correlation = 0.86) and Value as the second most influential factor (correlation = 0.85). This highlights the importance of improving these areas, alongside Cleanliness (correlation = 0.82), for hosts seeking higher overall scores.
     <br/>
     ![image](https://github.com/user-attachments/assets/26462ccf-77b6-4df2-a39b-b1ecaa633375) <br/>
     <br/>

## 3. Data Storage in SQL

Storing data in SQL ensures scalability, reusability, and efficient querying for future analysis.

**Tool: Python(Pandas/psycopg2/sqlalchemy) | SQL(PostgreSQL)**<br/>

- Step 1: Create an Airbnb database (Python).  <br/>
- Step 2: Create tables and load the cleaned CSV file into the Airbnb database (Python). <br/>
- Step 3: Change the data type to the correct format (PostgreSQL). <br/>

Detailed steps and codes are documented in [Airbnb_Load Data into PostgreSQL.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Airbnb_Load%20data%20into%20PostgreSQL.ipynb).<br/>

## 4. PostgreSQL Analysis: <br/>
  To enable efficient querying and analysis, the Airbnb dataset was imported into a PostgreSQL database.
  Using SQL, I conducted advanced analyses to answer key business questions, such as identifying top-rated hosts, dominant hosts by listings, and revenue estimates. <br/>

Detailed steps and codes are documented in [Airbnb_EDA in PostgreSQL.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Airbnb_EDA%20in%20PostgreSQL.sql).<br/>

  - Identify the top-rated host in each state (WA, NSW, VIC, QLD).<br/>
    ![image](https://github.com/user-attachments/assets/1a7607d9-4000-48db-bf74-c5855cafd610)
    <br/>
  - Identify the dominant host in each state (the host with the most listings).<br/>
    ![image](https://github.com/user-attachments/assets/7914d4f1-5e37-4836-9461-0efbc3a88c17)
    <br/>
  - Calculate the estimated total revenue and also the estimated revenue in each suburb for the top dominant host in WA for the next 30 days.<br/>
    Suppose the properties are booked and not blocked by the host. The top 1 dominant host is Let Go; The agency owns 86 Airbnan listings
	   and is estimated to earn AU$ 455,962 in the next 30 days calculated for the time the data was scrapped. <br/>
    ![image](https://github.com/user-attachments/assets/f9682c6b-0395-4ae8-af31-bfedcb2f7e3b)
    <br/>


## 5. Interactive Power BI Dashboard

### 1) Dashboard Design Concept based on EDA and SQL analysis <br/>

1. The correlation of review rating scores among various categories can be presented in the interactive dashboard.
    This can provide potential hosts with insights on how to improve overall ratings and increase booking rates and revenue.
2. Host and listing information is presented for stakeholder exploration.

The steps for data preparation and data modelling are documented in [Create Airbnb Dashboard in Power BI.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Create%20Airbnb%20Dashboard%20in%20Power%20BI).<br/>

### 2) Data Modelling
The semantic model of the dataset is presented as follows: <br/>

![image](https://github.com/user-attachments/assets/ba155c07-d663-4ec1-b38f-71dc8b1a3214)
<br/>

### 3) Problem Statement

The dashboard is designed for hosts to analyse trends in the existing data. It combines multiple pages, including the main report page, listing details that can be drilled through from the main report page, rating insights, and hosting details. 
As such, the potential hosts can explore the dashboard for more insights. <br/>

1. Which location is ideal for starting an Airbnb business based on booking rates? <br/>
   Busselton, WA is likely to be an ideal location to start an Airbnb business, as the suburb has the most bookings (26,899) and a high booking rate (87%) for the next 30 days. <br/>
2. What is the suitable listing daily price for the identified location in question 1?  <br/>
   The daily price can be set between $195 and $478, which is calculated as the price within one standard deviation. <br/>
3. What is the most common property and room type for the identified location in question 1? <br/>
   The most common property type and room type for Airbnb listings in Busselton, WA is the entire home. <br/>

   Dashboard view for answering questions 1-4: <br/>
   ![image](https://github.com/user-attachments/assets/5b85822b-22fd-4303-bf90-979f2a6e48ea)

4. What is the seasonality of Airbnb hosting for the overall Australian market and the identified location in question 1? <br/>
   Generally, the peak season for the overall Australian market is between October and March, whereas the peak season for Airbnb hosting in Busselton, WA is between October and December. <br/>

   Dashboard view for answering part of question 4: <br/>
   ![image](https://github.com/user-attachments/assets/cbcfec25-2246-403e-ade0-0352cca84c27)

5. Who are the dominant hosts in the identified location? Provide detailed information including but not limited to their tenure, number of listings,
   and estimated revenue for the next 30 days. <br/>
   The top 3 dominant hosts (measured by projected revenue) in Busselton, WA are DownSouth (9 years), Davinia (8 years), and Dunsborough Holiday (7 years), and their estimated revenue for the next 30 days is $617k, 570k, and $510k, respectively. <br/>

   Dashboard view for answering question 5: <br/>
   ![image](https://github.com/user-attachments/assets/9a5d4456-89fa-4fcd-ba89-0d88e2f2a446)




