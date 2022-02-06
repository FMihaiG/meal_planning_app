# =========== Filters ===============
# Select food filter
filter_input_food_plan = renderUI({
  selectInput('input_food',
              'Select food',
              choices = as.character(levels(factor(foodDatabase$Data[,1])))
  )
})





























