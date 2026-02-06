
CREATE TABLE company_esg_data (
    company_id INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    industry TEXT,
    region TEXT,
    year INT,
    revenue NUMERIC,
    profit_margin NUMERIC,
    market_cap NUMERIC,
    growth_rate NUMERIC,
    esg_overall NUMERIC,
    esg_environmental NUMERIC,
    esg_social NUMERIC,
    esg_governance NUMERIC,
    carbon_emissions NUMERIC,
    water_usage NUMERIC,
    energy_consumption NUMERIC
);
select count(*) from company_esg_data;

--1.Total revenue by Year..
Select year,sum(revenue) AS total_revenue
from company_esg_data
Group by year
order by year;

--2.Avg ESG score by industry
select industry, Avg(esg_overall) as avg_esg
from company_esg_data
Group by industry
order by avg_esg Desc;

--3.Top 10 companies by profit
select company_name,sum(revenue * profit_margin) as total_profit
from company_esg_data
Group by company_name
order by total_profit Desc
Limit 10;

--4.ESG Category(High,Medium and Low)
Select company_name,
CASE
    when esg_overall >= 75 THEN 'High'
	when esg_overall >= 50 THEN 'Medium'
	ELSE 'Low'
END as esg_category
FROM company_esg_data;

--5.total water used by Year
select year, sum(water_usage) as Total_water_used
From company_esg_data
Group by Year
order by Year;

--6.Top 10 Company Growth Rate by Year
Select year, company_name,Avg(growth_rate) as Avg_Growth_Rate
from company_esg_data
Group by year, company_name
order by Avg_growth_rate desc
Limit 10;

--7.Which are the top 10 industries with the highest profit margin?
select industry,Avg(profit_margin) as Avg_profit_margin
from company_esg_data
group by industry
order by Avg_profit_margin Desc;





