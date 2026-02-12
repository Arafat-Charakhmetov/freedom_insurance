# Read data
data_path <- here::here("final_dataset", "train.csv")
data <- data.table::fread(data_path)

# look into columns
colnames(data)
drive_predictors <- colnames(data)[32:159]

# basic stats for business
data[, mean(is_claim)]
data[is_claim == 1, mean(claim_amount)]
data[is_claim == 1, mean(claim_cnt)]
data[, mean(premium)]
data[is_claim == 1, sum(claim_amount)]/data[, sum(premium_wo_term)]*100
# 2 percent end up in crashes. Company pays 668735.8 per claim.
# On average company pays 13026.95 to the insured.
# On average company receives 10554.13 from premiums (taking into acount cancelations)
# Thus company is losing money at the current period
# The ratio of payments to premuims is 123 percent. This puts company at the loss.

# look into cancelation of insurance
data[premium==premium_wo_term, .N]/data[, .N]
# 28.5 percent of client cancel their insurance

# crash rate by drivers age and experience
data[, mean(is_claim), by = .(age_experience_name)]
