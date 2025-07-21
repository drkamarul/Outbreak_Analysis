#### ---- Data Management ------- ####

linelist2 <- linelist2 %>% 
  mutate(date_infection2 = ymd(date_infection),
         date_outcome2 = ymd(date_outcome))
glimpse(linelist2)

linelist2 <- linelist2 %>%
  mutate(days_infection_onset = date_onset2 - date_infection2,
         days_outcome_onset = date_outcome2 - date_onset2 )
glimpse(linelist2)

#### ---- Epidemic Curve ------- ####

military_data <- linelist2 %>% 
  filter(hospital == "Military Hospital")

ggplot(data = military_data) +         
  geom_histogram(                
    mapping = aes(x = date_onset2),     
    binwidth = 1)+                     
  labs(title = "Military Hospital - Daily")  

ggplot(data = military_data) +          
  geom_histogram(                      
    mapping = aes(x = date_onset2),   
    binwidth = 7) +                   
  labs(title = "Military Hospital - 7-day bins, starting at first case")

ggplot(data = military_data) +          
  geom_histogram(                      
    mapping = aes(x = date_onset2),   
    binwidth = 7) +                   
  labs(title = "Military Hospital - 7-day bins, starting at first case")

# be careful with epidweek (because overlapping of epiweek)

military_data |>
  filter(between(date_onset2, 
                 as_date("2014-01-01"), 
                 as_date("2014-12-31"))) |>
  ggplot() +
  geom_histogram(                
    mapping = aes(x = epidweek),     
    binwidth = 1) +                     
  labs(title = "Military Hospital - Daily") 

military_data |>
  filter(between(date_onset2, 
                 as_date("2014-01-01"), 
                 as_date("2014-12-31"))) |>
  ggplot() +
  geom_histogram(                
    mapping = aes(x = epidweek),     
    binwidth = 7) +                     
  labs(title = "Military Hospital - Daily") 


#### Epidemic Curve using date of hospitalization ####

#### For different gender ####

ggplot(data = military_data) +         
  geom_histogram(                
    mapping = aes(x = date_onset2),     
    binwidth = 1) +
  facet_wrap(~gender) +
  labs(title = "Military Hospital - Daily")  

ggplot(data = military_data) +          
  geom_histogram(                      
    mapping = aes(x = date_onset2),   
    binwidth = 7) +                   
  facet_wrap(~gender) +
  labs(title = "Military Hospital - 7-day bins, starting at first case")

#### For different age group ####


