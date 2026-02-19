# Read data
data_path <- here::here("data", "dataset", "train.csv")
data <- data.table::fread(data_path)

# look into columns
colnames(data)
drive_predictors <- colnames(data)[32:159]

# Null value percents per column
typeof(colMeans(is.na(data)) * 100)

# statistic for claims
data[, mean(is_claim)]
data[is_claim == 1, mean(claim_amount)]
data[is_claim == 1, mean(claim_cnt)]
data[is_claim == 1, sum(claim_amount)]/data[, sum(premium_wo_term)]*100

# premiums
data[, mean(premium_wo_term)]
data[, mean(premium)]
data[premium==premium_wo_term, .N]/data[, .N]

# profitability
data[is_claim == 1, sum(claim_amount)]/data[, sum(premium_wo_term)]*100