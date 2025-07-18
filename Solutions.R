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



#### Epidemic Curve using date of hospitalization ####

#### For different hospitals ####

#### For different gender ####

#### For different age group ####


### Epidemic Curve using date of onset ####

## For different hospitals ####

#### For different gender ####

#### For different age group ####
