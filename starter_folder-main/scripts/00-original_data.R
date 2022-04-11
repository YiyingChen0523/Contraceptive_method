#Get Original Data
library(pdftools)
library(tidyverse)

#Access the pdf file "FR22" from the input folder and download it on the desktop
setwd("/Users/Desktop")
all_content <- pdf_text("FR22.pdf")
just_page_i <- stri_split_lines(all_content[[59]])[[1]]
just_page_i <- just_page_i[just_page_i != ""]
just_page_i

type_of_table <- just_page_i[1:4] |> str_squish()
type_of_table #save the heading of the table

just_page_i_no_header <- just_page_i[5:length(just_page_i)]
just_page_i_no_header_no_footer <- just_page_i_no_header[3:29] 
just_page_i_no_header_no_footer #remove header and footer for the table, keep the data we need to analyze 

contraception_data <- tibble(all = just_page_i_no_header_no_footer)
contraception_data #convert the data into a tibble 