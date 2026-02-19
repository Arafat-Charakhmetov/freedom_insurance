import os

FILEPATH = os.path.join("..", "data", "dataset", "train.csv")

bonus_malus_types = ["13", "8",  "4",  "10", "11", "12", "3", "5", "7", "6", "9", "2", "1", "M", "0", ""]
car_age_types = ["свыше 7 лет", "до 7 лет включ."]
SCHEMA_OVERRIDES = {"car_year": pl.String,
                    "bonus_malus": pl.Enum(bonus_malus_types),
                    "operation_date": pl.Date,
                    "claim_amount": pl.Float64,
                    "claim_cnt": pl.UInt16,
                    "is_claim": pl.UInt8,
                    "car_age": pl.Enum(car_age_types),
                    "SCORE_12_1": pl.Float64,
                    "SCORE_12_2": pl.Float64,
                    "SCORE_12_3": pl.Float64,
                    "SCORE_12_4": pl.Float64,
                    "SCORE_12_5": pl.Float64,
                    "SCORE_12_6": pl.Float64}

TRAIN_FRACTION = 0.8

SEED = 42
