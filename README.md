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

**Insights**
  1. Maven has 1869 churned customers which is around 26% of the total customers and 20% of them are high-value customers.
  2. Customers with a tenure of less than 6 months are more likely to churn compared to those who have stayed for more than a year.
  3. Maven lost ~$1.7 million to competitors, making it the most expensive type of churn.
  4. The top 3 reasons for churn are competitors made better offers, competitors had better devices and attitude of support staff.
  5. The key indicators of churn are Month-to-Month contract , No Premium Tech Support, Fiber Optic internet, No promotional offer and Offer E.


**Visualisation**

You can see the Dashboard in the repository or in the [Tableau](https://public.tableau.com/app/profile/lajvi.bhavsar5485/viz/CustomerChurnAnalysis_17331173665670/Dashboard22?publish=yes)

  
