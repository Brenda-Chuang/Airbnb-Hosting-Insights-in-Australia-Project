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

This project used the above data to represent the Airbnb listing in the states of NSW, VIC, QLD, and WA.

## Data Cleaning and Exploratory Data Analysis

**Tool: Python (Pandas/Matplotlib/Seaborn) <br/>**
The data cleaning includes the following steps:<br/>
Pre-cleaning: Concat all CSV files into one single dataframe <br/>
Step 1: Raw Data Understanding (e.g., data shape, data attributes, and data type.) <br/>
Step 2: Data preparation (e.g., change data type, split columns, and handling missing values.) <br/>
Step 3: Exploratory Data Analysis (e.g., data statistics, data distribution, and data relationships.) <br/>

Detailed steps and codes are documented in [Airbnb_Data cleaning_Python.ipynb](https://github.com/Brenda-Chuang/Airbnb-Hosting-in-Australia-Project/blob/main/Airbnb%20Hostig%20Analysis%20Project/Raw%20airbnb%20data/Airbnb_Data%20cleaning_Python.ipynb).<br/>

## EDA Summary

Exploratory data analysis was conducted after data cleaning and before the dashboard creation to get a fundamental understanding of the dataset. <br/>
1. Pricing
   Western Australia's average listing price is the highest, which is $245, slightly higher than that of NSW ($242).
   The figure for QLD is the lowest, with an average listing price of $182. <br/>
   ![image](https://github.com/user-attachments/assets/fdd3698e-a708-496e-918c-252fe97c55a0) <br/>
   ![image](https://github.com/user-attachments/assets/6d08163b-982e-4bff-9aa5-115064886618)








