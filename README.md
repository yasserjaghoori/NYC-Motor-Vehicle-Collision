# 🚙 NYC Motor Vehicle Collisions 

## Overview
This project analyzes motor vehicle collisions in New York City using a data engineering pipeline that combines Python, R, SQL, and AWS services. The focus is on identifying borough-level trends in fatality rates, time-of-day patterns, and vehicle types most involved in injuries.

## Tools & Technologies
- **Python**: Data cleaning, transformation, EC2 execution
- **R**: ANOVA, regression, and statistical modeling
- **SQL (MySQL)**: Filtering and aggregating collision data
- **AWS**: EC2 (compute), S3 (storage), RDS (MySQL database)

## Key Questions Answered
1.	Which NYC borough has the highest fatality rate in motor vehicle accidents, and what are the leading contributing factors to these accidents?
2.	What is the relationship between the time of day and the frequency of accidents across boroughs?
3.	Which types of vehicles are most frequently involved in accidents, and how do these patterns differ by borough?

## Sample Insight
- Staten Island has the highest fatality rate per accident, despite having the lowest total number of collisions. This suggests a higher severity of accidents on average, warranting borough-specific safety interventions.
- Brooklyn and Queens reported the highest total number of traffic fatalities, while "Driver Inattention/Distraction" and "Failure to Yield Right-of-Way" were identified as the leading contributing factors to fatal crashes.
- Peak accident times align with daily commuting patterns, specifically between 8–9 AM and 4–7 PM. Manhattan, Brooklyn, and Queens showed the highest collision frequency during these rush hours.
- Passenger vehicles are the most commonly involved vehicle type in accidents across all boroughs, followed by SUVs and taxis. ZIP code–level analysis revealed accident hotspots like:
   - 11207 (Brooklyn) for passenger vehicle accidents
   - 10016 (Manhattan) for taxi-related incidents
   - 11101 (Queens) for SUV/station wagon collisions
- Data-driven suggestions include targeted traffic enforcement, borough-specific safety policies, and time-specific traffic control to reduce fatalities and improve commuter safety.

## Future Work
- Automate ingestion with Apache Airflow or Lambda
- Add visualization dashboard (e.g., Streamlit or Power BI)
- Use Spark for distributed processing

## Author
**Yasser Jaghoori**  
Graduate Student, Data Analytics Engineering  
Email: jaghooya@outlook.com  
GitHub: https://github.com/yasserjaghoori

