# Read data
data_path <- here::here("final_dataset", "train.csv")
data <- data.table::fread(data_path)

# look into columns
colnames(data)
drive_predictors <- colnames(data)[32:159]
data[, unique(bonus_malus)]
data[, unique(age_experience_name)]

# crash rate by drivers age and experience
data[, mean(is_claim), by = .(age_experience_name)]
data[is_claim==1, unique(claim_cnt)]