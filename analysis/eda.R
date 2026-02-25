# Read data
data_path <- here::here("data", "dataset", "train.csv")
data <- data.table::fread(data_path)

# make a glimps into data
head(data)

# Null value percents per column
colMeans(is.na(data)) * 100

# statistic for claims
data[, mean(is_claim)]
data[is_claim == 1, mean(claim_amount)]
data[is_claim == 1, mean(claim_cnt)]

# premiums
data[, mean(premium_wo_term)]
data[, mean(premium)]
data[premium==premium_wo_term, .N]/data[, .N]

# profitability
data[is_claim == 1, sum(claim_amount)]/data[, sum(premium_wo_term)]*100

# using group by operation we can create a mapping of name to id and drop name columns.
data[, .N, by = list(is_individual_person, is_individual_person_name)]
data[, .N, by = list(is_residence, is_residence_name)]
data[, .N, by = list(region_id, region_name)]
data[, .N, by = list(vehicle_type_id, vehicle_type_name)]
data[, .N, by = list(age_experience_id, age_experience_name)]

# car_year has bad values
data[, unique(car_age)]
