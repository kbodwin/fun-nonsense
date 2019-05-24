# Spongebob-case for MacOS
# Shoutout to that anonymous person in STAT 419 for doing this in Python

# How to run:
# Go on terminal
# Rscript meme.R We really made this in R
# [1] "Copied to clipboard: we reALlY MAdE tHIs iN r"

args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  stop("Give me some text!", call. = FALSE)
} else
{
  new_output <- c()
  for (data in args) {
    split_word <- strsplit(data,"")[[1]]
    for (char in split_word){
      should_change <- sample(c(T,F)) && grepl("^[A-Za-z]+$", char, perl = T)
      if (should_change){
        if (!grepl("^[[:upper:]]+$", char))
        {
          char = toupper(char)
        }
        else if (grepl("^[[:upper:]]+$", char))
        {
          char = tolower(char)
        }
      }
      if (toupper(char) == toupper(split_word[length(split_word)])){
        char <- paste0(char," ")
      }
      new_output <- c(new_output,char)
    }
  }
  new_data <- paste0(new_output, collapse = "")
  
  # Get rid of last space
  new_data <- substr(new_data, 1, nchar(new_data)-1)
  
  print(paste0('Copied to clipboard: ',new_data))
  pb <- pipe("pbcopy", "w")
  write(new_data, file = pb)
  close(pb)
}