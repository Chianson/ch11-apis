### Exercise 1 ###

# Load the httr and jsonlite libraries for accessing data
library("httr")
library("jsonlite")
#install.packages("dplyr")
library("dplyr")

## For these questions, look at the API documentation to identify the appropriate endpoint and information.
## Then send GET() request to fetch the data, then extract the answer to the question

GetGithubInfo <- function(input.query) {
  uri.base <- "https://api.github.com"
  uri.location <- "/search/repositories"
  query.params <- list(q = input.query, sort = "forks", order = "desc")
  full.url <- paste0(uri.base, uri.location)
  
  response <- GET(full.url, query = query.params)
  response.content <- content(response, "text")
  body.data <- fromJSON(response.content)
  # str(body.data)# view as a formatted string
  # names(body.data)# view the tag names
  items <- body.data$items
  
  return(items)
}
# How many forks does the most popular repository (by number of forks) have when you search for the term "d3"?
# (search for the term, and sort descending by the number of forks)
d3.info <- GetGithubInfo("d3")
#d3.info <- arrange(d3.info, desc(forks))

# How many public repositories does our course organization have?

