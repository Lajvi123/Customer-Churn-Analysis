select * from churn;

-- CUSTOMER CHURN ANALYSIS --

--   **** STEP 1 : DATA CLEANING AND PREPARATION ****.  -- 

-- Find the duplicates -- 
Select Customer_ID, count(Customer_ID)  as count
from churn 
GROUP BY Customer_ID
HAVING COUNT(Customer_ID) > 1 ; 

--  Find the total no of customers -- 
Select count(distinct Customer_ID) as Total_Customers 
from churn;

--   **** STEP 2 : EXPLORATORY DATA ANALYSIS ****   --

-- 1. How much revenue to lost from the churned customers ? -- 
select count(Customer_ID) as customer_count, Customer_Status, 
ROUND((SUM(Total_Revenue) * 100) / SUM(SUM(Total_Revenue)) OVER(), 1) as Revenue_Percentage
from churn
group by CUstomer_Status;

-- 2. What is the typical tenure for churned customer ? -- 
-- Analyze tenure for churned customers --
-- find the percentage of customer who stayed <=6 Months, <=12 Months (1 year), <=24 months(2 year) before they leave Maven --

SELECT
    CASE 
        WHEN Tenure_in_Months <= 6 THEN '6 months'
        WHEN Tenure_in_Months <= 12 THEN '1 Year'
        WHEN Tenure_in_Months <= 24 THEN '2 Years'
        ELSE '> 2 Years'
    END AS Tenure,
    ROUND(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVER(),1) AS Churn_Percentage
FROM churn
WHERE
Customer_Status = 'Churned'
GROUP BY
    CASE 
        WHEN Tenure_in_Months <= 6 THEN '6 months'
        WHEN Tenure_in_Months <= 12 THEN '1 Year'
        WHEN Tenure_in_Months <= 24 THEN '2 Years'
        ELSE '> 2 Years'
    END
ORDER BY
Churn_Percentage DESC;

-- 3. Which ciites had the highest churn rates ? --
select top 5 City, count(Customer_ID) as Churned_Customer,
CEILING(COUNT(case 
    when Customer_Status = 'Churned' then customer_id else null END) * 100.0  / COUNT(Customer_ID)) AS Churn_Rate
from churn
group by City
having count(Customer_ID)>30  and COUNT(case when Customer_Status='Churned'  then Customer_ID else null end ) > 0
ORDER BY
    Churn_Rate DESC;

--4. What are the general reason for churn ? -- 
select Churn_Category, 
ROUND(SUM(Total_Revenue), 0) AS Churned_Revenue,
CEILING(COUNT(Customer_ID) * 100 / SUM(COUNT(Customer_ID)) OVER()) AS Churned_Percentage
from churn
where Customer_Status = 'Churned'
GROUP BY Churn_Category
ORDER BY Churned_Percentage DESC;

--5. What are the specific reason for Churn ? --
select TOP 5 Churn_Reason, 
ROUND(SUM(Total_Revenue) , 0) AS Churned_Revenue,
CEILING(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVer()) AS Churn_Percentage 
from churn 
where Customer_Status = 'Churned'
GROUP BY Churn_Reason
Order by Churn_Percentage DESC;

--6. What Offer Churned Customer had ? --
select Offer, 
ROUND(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVER (), 2) AS churned_Percent
from churn
where Customer_Status = 'Churned'
Group by Offer 
Order by churned_Percent DESC;

--7. What Internet type Churned Customer has ? -- 
select Internet_Type,
COUNT(Customer_ID) AS No_of_Churned_Customer,
ROUND(COUNT(Customer_ID) * 100 / SUM(COUNT(Customer_ID)) OVER(), 1) AS Churn_Percent
from churn
where Customer_Status = 'Churned'
group by Internet_Type
Order by Churn_Percent DESC;

--8. What Internet Type did 'Competitor' churners have?
select Internet_Type,  Churn_Category,
ROUND(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVER(), 1) AS Churn_Percentage
from churn 
 WHERE 
    Customer_Status = 'Churned'
    AND Churn_Category = 'Competitor'
GROUP BY
Internet_Type,
Churn_Category
ORDER BY Churn_Percentage DESC;

--9. Did churners have premium tech support?
SELECT 
    Premium_Tech_Support,
    COUNT(Customer_ID) AS Churned,
    ROUND(COUNT(Customer_ID) *100.0 / SUM(COUNT(Customer_ID)) OVER(),1) AS Churn_Percentage
FROM churn
WHERE 
    Customer_Status = 'Churned'
GROUP BY Premium_Tech_Support
ORDER BY Churned DESC;

--  10. What contract were churners on?
SELECT 
    Contract,
    COUNT(Customer_ID) AS Churned,
    ROUND(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVER(), 1) AS Churn_Percentage
FROM churn
WHERE Customer_Status = 'Churned'
GROUP BY Contract
ORDER BY Churned DESC;

--  11. What gender were churners?
SELECT
    Gender,
    ROUND(COUNT(Customer_ID) *100.0 / SUM(COUNT(Customer_ID)) OVER(), 1) AS Churn_Percentage
FROM churn
WHERE
    Customer_Status = 'Churned'
GROUP BY
    Gender
ORDER BY
Churn_Percentage DESC;

-- 12. How old were churners?
SELECT  
    CASE
        WHEN Age <= 30 THEN '19 - 30 yrs'
        WHEN Age <= 40 THEN '31 - 40 yrs'
        WHEN Age <= 50 THEN '41 - 50 yrs'
        WHEN Age <= 60 THEN '51 - 60 yrs'
        ELSE  '> 60 yrs'
    END AS Age,
    ROUND(COUNT(Customer_ID) * 100 / SUM(COUNT(Customer_ID)) OVER(), 1) AS Churn_Percentage
FROM churn
WHERE
    Customer_Status = 'Churned'
GROUP BY
    CASE
        WHEN Age <= 30 THEN '19 - 30 yrs'
        WHEN Age <= 40 THEN '31 - 40 yrs'
        WHEN Age <= 50 THEN '41 - 50 yrs'
        WHEN Age <= 60 THEN '51 - 60 yrs'
        ELSE  '> 60 yrs'
    END
ORDER BY
Churn_Percentage DESC;

