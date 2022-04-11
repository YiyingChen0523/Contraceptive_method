#Clean and prepare the data for later analysis

#Correct details in the table that R could not recognize
contraception_data <-
  contraception_data |>
  mutate(all = str_squish(all)) |> 
  mutate(all = str_replace(all, "II.3", "11.3")) |> 
  mutate(all = str_replace(all, "I I .6", "11.6")) |>
  mutate(all = str_replace(all, "II.4", "11.4")) |>
  mutate(all = str_replace(all, "4,8", "4.8")) |>
  mutate(all = str_replace(all, "7,3", "7.3")) |>
  mutate(all = str_replace(all, "6,4", "6.4")) |>
  mutate(all = str_replace(all, "No schooling", "No_Schooling")) |>
  mutate(all = str_replace(all, "Secondary or more", "Secondary_or_more")) |>
  mutate(all = str_replace(all, "6 or more", "6_or_more")) |>
  mutate(all = str_replace(all, "Livinq Children", "Living_Children")) |>
  mutate(all = str_replace(all, "R~liqion", "Religion")) |>
  mutate(all = str_replace(all, "Rest of country", "Rest_of_country")) |>
  mutate(all = str_replace(all, "Aqe", "Age")) |> 
  separate(col = all,
           into = c("Characteristic", "Any_Method", "Any_Mordern_Method", "Characteristic_2", "Any_Method_2", "Any_Mordern_Method_2"),
           sep = " ", 
           remove = TRUE,
           fill = "right",
           extra = "drop"
  )
contraception_data

#rename the column for lay out; append the data from bottom to change the side-by-side layout
contraception_data_long <-
  rbind(contraception_data |> select(Characteristic, Any_Method, Any_Mordern_Method),
        contraception_data |>
          select(Characteristic_2, Any_Method_2, Any_Mordern_Method_2) |>
          rename(Characteristic = Characteristic_2, Any_Method = Any_Method_2, Any_Mordern_Method = Any_Mordern_Method_2)
  )
contraception_data_long

#Remove extra lines from the table
contraception_data_long <- 
  contraception_data_long |> 
  remove_empty(which = c("rows"))
new_data <- 
  contraception_data_long[-c(17, 21),]

#Manually correct mistakes during scanning 
new_data[1,2] <- ""
new_data[17,2] <- ""
new_data[17,3] <- ""
new_data[20,2] <- ""
new_data[20,3] <- ""
new_data[22,2] <- "3"
new_data[22,3] <- "2.9"
new_data[31,1] <- "Traditional/Other"
new_data[31,2] <- "3.7"
new_data[31,3] <- "3.1"
new_data[38,1] <- "Kru/Sapo"
new_data[38,2] <- "11.3"
new_data[38,3] <- "10.7"
new_data[41,1] <- "Mano"
new_data[41,2] <- "6.3"
new_data[41,3] <- "5.4"
new_data[42,1] <- "Other/None"
new_data[42,2] <- "9.6"
new_data[42,3] <- "7.2"
new_data[34,3] <- "3.3"
new_data[39,1] <- "Mandingo"
new_data[39,2] <- "1.5"
new_data[39,3] <- "1.5"
new_data