#### Business stats
* 2 percent end up in crashes. Company pays 668735 per claim. 
Therefore, on average company pays 13030 to the insured.

* On average company receives 10555 from premiums (taking into account cancellations). 
Average premium is 13290 and 28.5% end up canceling their insurance.

* Thus, company is losing money at the current period. The ratio of payments to premiums is 123%.

#### Null Values
* `claim_amount` and `claim_cnt` has null values for people who didn't made a claim
* 11.5% of `ownerkato` values is missing
* 19.4% percent of `engine_volume` and `engine_power` is missing
* All of the driver predictor score columns has a missing value

#### mapping of id's ot names
Some columns repeat identical information. Both incorporate categorical information. 
The only difference is that one stores category id while other uses the name. 
Here is mapping of such cases
* `is_individual_person` and `is_individual_person_name` hold only one value. 
That is there is only natural persons, no juridical persons. Since this columns
lack variability, we will drop them.

* `is_residence` is the binary variable that indicated whether the person is 
resident of Kazakhstan. `is_residence_name` repeats same information as string
and subsequently we drop them.

* The region_id is id of the region while the region_name is name of the same region.

```region_id = {1: "01 Алматинская область",
                20: "18 Туркестанская область",
                14: "14 Мангистауская область",
                19: "17 Шымкент",
                12: "12 Кызылординская область",
                5: "05 Карагандинская область",
                15: "15 Алматы",
                9: "09 Жамбылская область",
                7: "07 Акмолинская область",
                16: "16 Астана",
                13: "13 Атырауская область",
                10: "10 Актюбинская область",
                3: "03 Восточно-Казахстанская область",
                4: "04 Костанайская область",
                8: "08 Павлодарская область",
                11: "11 Западно-Казахстанская область",
                6: "06 Северо-Казахстанская область",
                18: "Временная регистрация",
                17: "Временный въезд",
                23: "21 Улытауская область",
                22: "20 Жетысуйская область",
                21: "19 Абайская область"}
```

* Type of the vehicle

```vehicle_type = {1: "Легковые",
                   4: "Прицепы(полуприцепы)",
                   2: "Грузовые",
                   3: "Мототранспорт",
                   5: "Автобусы > 16 п.м.",
                   7: "Автобусы до 16 п.м."}
```

* What is the age and experience of the driver

```age_experience = {5: "старше 25 лет/стаж вождения более 2 лет",
                     4: "старше 25 лет/стаж вождения менее 2 лет",
                     2: "менее 25 лет/стаж вождения менее 2 лет",
                     3: "менее 25 лет/стаж вождения более 2 лет"}
```