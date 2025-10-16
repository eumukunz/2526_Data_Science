#%% importeer tidyverse
library(tidyverse)

#%% importeer data
library(palmerpenguins)

#%%
dataset<-penguins

#%%
str(dataset)

#%%
summary(dataset)

#%%
library(ggplot2)
library(ggthemes)
#%%
ggplot(data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(mapping = aes(color = species, shape = species)) +
  geom_smooth(method = "lm") +
  labs(title = "Flipper length vs Body mass",
        subtitle = "Palmer Penguins, dimensions of 3 species",
        x = "Flipper length (mm)",
        y = "Body mass (g)",
      color = "Species", 
    shape = "Species") + scale_color_colorblind()

#%%
library(dplyr)

#%%
dataset_summary<- dataset %>% group_by(cyl) %>%
  summarise(avg = mean(mpg))

#%%
dataset |> group_by(cyl) |>
  summarise(avg = mean(mpg))
#%%
library(duckdb)

#%%
# Create connection to DuckDB
con <- dbConnect(duckdb())


#%%
# Register mtcars dataset
dbWriteTable(con, "mtcars", mtcars)

#%%
# Execute the query
result <- dbGetQuery(con, "
SELECT cyl, AVG(mpg) as avg_mpg
FROM mtcars
GROUP BY cyl
")

print(result)

# Clean up
dbDisconnect(con)

#%%
library(nycflights13)

#%%
str(flights)

#%%
flights |>
  filter(dest == "IAH") |>
  group_by(year,month,day) |>
  summarize(avg_delay = mean(arr_delay, na.rm = TRUE))

#%%
flights<- flights |> filter(month == 1 & day == 1)

#%%

add_two_numbers <- function(x, y) {
#' Add Two Numbers
#'
#' This function takes two numbers and returns their sum.
#'
#' @param x A numeric value
#' @param y A numeric value
#' @return The sum of x and y
#' @examples
#' add_two_numbers(5, 3)
#' add_two_numbers(10, -2)
#' @export


  return(x + y)
}
#%%

result <- add_two_numbers(3, 5)

