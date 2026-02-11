# Read data
data_path <- here::here("final_dataset", "train.csv")
data <- data.table::fread(data_path)

# 