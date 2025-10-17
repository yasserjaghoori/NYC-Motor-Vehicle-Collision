df = read.csv('/Users/yasserjaghoori/Desktop/Grad School Classes/Fall 2024/AIT 580_Fall 2024/Data Sets/Motor_Vehicle_Collisions_-_Crashes_20241011.csv')
View(df)
library(dplyr)
df<-df %>%
  mutate(TOTAL.FATALITIES = NUMBER.OF.PERSONS.KILLED +
           NUMBER.OF.PEDESTRIANS.KILLED +
           NUMBER.OF.CYCLIST.KILLED +
           NUMBER.OF.MOTORIST.KILLED)
df <- df %>%
  filter(!is.na(BOROUGH) & BOROUGH != "")

borough_fatalities <- fatal_accidents %>%
  group_by(BOROUGH) %>%
  summarize(Total_Fatalities = sum(TOTAL.FATALITIES, na.rm = TRUE)) %>%
  arrange(desc(Total_Fatalities))

library(ggplot2)
ggplot(borough_fatalities, aes(x = reorder(BOROUGH, -Total_Fatalities), y = Total_Fatalities)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Total Fatalities by Borough",
    x = "Borough",
    y = "Number of Fatalities"
  ) +
  theme_minimal()

borough_fatality_summary <- df %>%
  group_by(BOROUGH) %>%
  summarize(
    Total_Fatalities = sum(TOTAL.FATALITIES, na.rm = TRUE),
    Total_Accidents = n(),
    Fatality_Rate = Total_Fatalities / Total_Accidents
  ) %>%
  arrange(desc(Fatality_Rate))
print(borough_fatality_summary)

library(ggplot2)
ggplot(borough_fatality_summary, aes(x = reorder(BOROUGH, -Fatality_Rate), y = Fatality_Rate)) +
  geom_bar(stat = "identity", fill = 'steelblue') +
  labs(title = "Fatality Rate by Borough", x = "Borough", y = "Fatality Rate") +
  theme_minimal()

install.packages("tidyr")
library(tidyr)
fatal_accidents <- df %>%
  filter(TOTAL.FATALITIES > 0)
combined_factors <- fatal_accidents %>%
  pivot_longer(
    cols = starts_with("CONTRIBUTING.FACTOR.VEHICLE"),
    names_to = "Factor_Column",
    values_to = "Contributing_Factor"
  ) %>%

factor_summary <- combined_factors %>%
  filter(!is.na(Contributing_Factor) & Contributing_Factor != "") %>%
  group_by(Contributing_Factor) %>%
  summarize(Fatal_Accidents = n()) %>%
  arrange(desc(Fatal_Accidents))
print(factor_summary)

top_factors <- factor_summary %>% top_n(10, Fatal_Accidents)
ggplot(top_factors, aes(x = reorder(Contributing_Factor, -Fatal_Accidents), y = Fatal_Accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Top Contributing Factors in Fatal Accidents", 
       x = "Contributing Factor", 
       y = "Number of Fatal Accidents") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face = 'bold'))

top_factors <- factor_summary %>% top_n(10, Fatal_Accidents)

ggplot(top_factors, aes(x = reorder(Contributing_Factor, -Fatal_Accidents), y = Fatal_Accidents)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Top Contributing Factors in Fatal Accidents", 
       x = "Contributing Factor", 
       y = "Number of Fatal Accidents") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold", size = 8), # Adjust font size and bold
    axis.title.x = element_text(face = "bold", size = 14),  # Optional: Adjust x-axis title style
    axis.title.y = element_text(face = "bold", size = 14)   # Optional: Adjust y-axis title style
  )


df$ZIP.CODE <- gsub("\\.0$", "", as.character(df$ZIP.CODE))

# Create a TOTAL DEATHS column
df <- df %>%
  mutate(TOTAL_DEATHS = NUMBER.OF.PERSONS.KILLED +
           NUMBER.OF.PEDESTRIANS.KILLED +
           NUMBER.OF.CYCLIST.KILLED +
           NUMBER.OF.MOTORIST.KILLED)

# Aggregate deaths by ZIP code
zip_deaths <- df %>%
  group_by(ZIP.CODE) %>%
  summarize(TOTAL_DEATHS = sum(TOTAL_DEATHS, na.rm = TRUE)) %>%
  arrange(desc(TOTAL_DEATHS))

# Get the top 5 ZIP codes
top_zip_deaths <- head(zip_deaths, 5)

# Create a bar plot
ggplot(top_zip_deaths, aes(x = reorder(ZIP.CODE, -TOTAL_DEATHS), y = TOTAL_DEATHS, fill = ZIP.CODE)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Top 5 ZIP Codes with Highest Motor Vehicle Deaths",
    x = "ZIP Code",
    y = "Total Deaths"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  scale_fill_brewer(palette = "Set3")
