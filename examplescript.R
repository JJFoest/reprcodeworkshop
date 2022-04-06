# libraries ----
library(dplyr)

# A function to calculate the CV of a variables ----

get_cv <- function(data, variable) {
  require(dplyr)
  data %>%
    mutate(CV = sd({{variable}}) / mean({{variable}}))
}

# test DO NOT RUN ----

# make some data
set.seed(111)
mydata <- tibble(a = c(1:10, rnorm(10)), b = c(rep("a", 10), rep("b", 10)))

# example
mydata %>%
  group_by("b") %>% # group by a variable, to calculate the CV per group
  get_cv(variable = a)

# end script ----
