# Customer Churn Analysis
The Customer Churn Analysis project aims to identify patterns and trends in customer behavior that lead to churn (customers leaving a service). I have provided an in-depth analysis of Maven Telecom’s churn dataset and to answer the following questions:

1. What are the key drivers of churn?
2. Is the company losing high value customers? If so, how can they retain them?
3. Which customer demographic is most likely to churn (age group, gender, region)?

**Project Strategy**

I downloaded the dataset from [Maven Analytics](https://mavenanalytics.io/data-playground?order=date_added%2Cdesc&search=customer%20churn) and it contained information about customer demographics, subscription plans and account records for Maven Telecom. I performed all data preparation and analysis using SQL (Azure Data Studio), and all the SQL codes will be provided in this repository. The dashboard was designed with Tableau. 

The main steps for this project are:

* Data Cleaning and Preparation
* Exploratory Data Analysis
* Data Insights
* Customer Retention Strategies
* Data Visualisation

**Dataset Description**

The dataset includes information about customers, their demographics, and their usage of services. Below are the key fields in the dataset:

* Customer ID: Unique identifier for each customer.
* Customer Status: Indicates whether a customer has churned, stayed, or joined.
* Internet Service: Type of internet service (Fiber Optic, DSL, Cable, None).
* Monthly Charges: Monthly fee paid by the customer.
* Tenure: Duration (in months) a customer has been with the company.
* Churn Reason: Reason provided by the customer for leaving the service.
