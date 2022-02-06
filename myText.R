# =========== Texts ===============
# Day plan
text1 = renderUI({
  A = foodDatabase$Data %>%
    filter(Name == input$input_food)
  paste("Unit: ",A$Unit," ;Default: ", A$Quantity)
})

text2 = renderUI({
  A = foodDatabase$Data %>%
    filter(Name == input$input_select_food_for_meal_data)
  paste("Unit: ",A$Unit," ;Default: ", A$Quantity)
})



























