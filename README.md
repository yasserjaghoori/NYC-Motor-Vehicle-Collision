# NYC Motor Vehicle Collisions — Data Engineering Project

## Overview
This project analyzes motor vehicle collisions in New York City using a data engineering pipeline that combines Python, R, SQL, and AWS services. The focus is on identifying borough-level trends in fatality rates, time-of-day patterns, and vehicle types most involved in injuries.

## Tools & Technologies
- **Python**: Data cleaning, transformation, EC2 execution
- **R**: ANOVA, regression, and statistical modeling
- **SQL (MySQL)**: Filtering and aggregating collision data
- **AWS**: EC2 (compute), S3 (storage), RDS (MySQL database)

## Key Questions Answered
1. Which NYC borough has the highest fatality rate?
2. What are the most common contributing factors to severe collisions?
3. How does accident frequency vary by time of day?
4. Which vehicle types are most often involved in injuries?


## How to Reproduce
1. Clone the repo:
   git clone https://github.com/your-username/nyc-motor-vehicle-collisions

2. [Optional] Launch EC2 instance and run `python_preprocessing.ipynb`  
   This downloads the CSV from S3 and processes it

3. Run SQL scripts in MySQL or RDS:
   - `borough_fatalities.sql`
   - `top_contributing_factors.sql`

4. Open `NYC Motor Vehicle Collision.R` for statistical findings (e.g., ANOVA, regression)

## Sample Insight
> Bronx had the highest per capita fatality rate.  
> Nighttime accidents (10PM–2AM) showed elevated fatality rates, especially on weekends.  
> SUVs and taxis showed a higher proportion of injury-causing incidents than sedans.

## Future Work
- Automate ingestion with Apache Airflow or Lambda
- Add visualization dashboard (e.g., Streamlit or Power BI)
- Use Spark for distributed processing

## Author
**Yasser Jaghoori**  
Graduate Student, Data Analytics Engineering  
Email: jaghooya@outlook.com  
GitHub: https://github.com/yasserjaghoori

