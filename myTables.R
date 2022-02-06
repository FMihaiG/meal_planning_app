# =========== Tables ===============
# Day plans
table_mealPlan_Monday = renderDT(
  dayMealPlan$Monday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Tuesday = renderDT(
  dayMealPlan$Tuesday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Wednesday = renderDT(
  dayMealPlan$Wednesday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Thursday = renderDT(
  dayMealPlan$Thursday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Friday = renderDT(
  dayMealPlan$Friday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Saturday = renderDT(
  dayMealPlan$Saturday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)
table_mealPlan_Sunday = renderDT(
  dayMealPlan$Sunday,
  selection = 'single',
  options = list(pageLength = 30),
  class = "compact cell-border"
)

# Total macros
table_total_macros = renderDT({
  if(input$tabs_panel_meal_plan == "Monday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Monday[,4]),
                           Protein = sum(dayMealPlan$Monday[,5]),
                           Carbs = sum(dayMealPlan$Monday[,6]),
                           Fat = sum(dayMealPlan$Monday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Tuesday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Tuesday[,4]),
                           Protein = sum(dayMealPlan$Tuesday[,5]),
                           Carbs = sum(dayMealPlan$Tuesday[,6]),
                           Fat = sum(dayMealPlan$Tuesday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Wednesday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Wednesday[,4]),
                           Protein = sum(dayMealPlan$Wednesday[,5]),
                           Carbs = sum(dayMealPlan$Wednesday[,6]),
                           Fat = sum(dayMealPlan$Wednesday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Thursday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Thursday[,4]),
                           Protein = sum(dayMealPlan$Thursday[,5]),
                           Carbs = sum(dayMealPlan$Thursday[,6]),
                           Fat = sum(dayMealPlan$Thursday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Friday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Friday[,4]),
                           Protein = sum(dayMealPlan$Friday[,5]),
                           Carbs = sum(dayMealPlan$Friday[,6]),
                           Fat = sum(dayMealPlan$Friday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Saturday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Saturday[,4]),
                           Protein = sum(dayMealPlan$Saturday[,5]),
                           Carbs = sum(dayMealPlan$Saturday[,6]),
                           Fat = sum(dayMealPlan$Saturday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }else if(input$tabs_panel_meal_plan == "Sunday"){
    tableData = data.frame(Calories = sum(dayMealPlan$Sunday[,4]),
                           Protein = sum(dayMealPlan$Sunday[,5]),
                           Carbs = sum(dayMealPlan$Sunday[,6]),
                           Fat = sum(dayMealPlan$Sunday[,7])
    )
    datatable(tableData,
              class = "compact cell-border")
  }
})

table3 = renderDT({
  tableData = foodDatabase$Data
  datatable(tableData,
            selection = 'single',
            options = list("pageLength" = 30),
            class = "compact cell-border")
})

# Create meal
table_create_meal = renderDT({
  datatable(newMeal$Data,
            selection = 'single',
            options = list("pageLength" = 30),
            class = "compact cell-border")
})

# Create meal macros
table_macros_meal = renderDT({
  tableData = data.frame(
    Quantity = as.character(1),
    Unit = as.character("serving"),
    Calories = as.numeric(round(sum(newMeal$Data[,4])/input$input_select_servings_for_meal_data)),
    Protein = as.numeric(round(sum(newMeal$Data[,5])/input$input_select_servings_for_meal_data)),
    Carbs = as.numeric(round(sum(newMeal$Data[,6])/input$input_select_servings_for_meal_data)),
    Fat = as.numeric(round(sum(newMeal$Data[,7])/input$input_select_servings_for_meal_data))
  )
  datatable(tableData,
            selection = 'single',
            options = list("pageLength" = 30),
            class = "compact cell-border")
})
















