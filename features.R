# ----------- Meal plan menu --------------
# Add food item to plan
feature_add_food_plan = observeEvent(input$action_add_food,{
  
  workBench = foodDatabase$Data %>%
    filter(Name == input$input_food)
  
  A = workBench %>%
    mutate(Quantity = input$input_quantity) %>%
    mutate(Calories = round(workBench$Calories*input$input_quantity/workBench$Quantity)) %>%
    mutate(Protein = round(workBench$Protein*input$input_quantity/workBench$Quantity)) %>%
    mutate(Carbs = round(workBench$Carbs*input$input_quantity/workBench$Quantity)) %>%
    mutate(Fat = round(workBench$Fat*input$input_quantity/workBench$Quantity))
  
  if(input$tabs_panel_meal_plan == "Monday"){
    dayMealPlan$Monday = dayMealPlan$Monday %>%
      rbind(A)
    saveRDS(dayMealPlan$Monday,paste0(path_storage,"dayPlan_dev_1.rds"))
  }else if(input$tabs_panel_meal_plan == "Tuesday"){
    dayMealPlan$Tuesday = dayMealPlan$Tuesday %>%
      rbind(A)
    saveRDS(dayMealPlan$Tuesday,paste0(path_storage,"dayPlan_dev_2.rds"))
  }else if(input$tabs_panel_meal_plan == "Wednesday"){
    dayMealPlan$Wednesday = dayMealPlan$Wednesday %>%
      rbind(A)
    saveRDS(dayMealPlan$Wednesday,paste0(path_storage,"dayPlan_dev_3.rds"))
  }else if(input$tabs_panel_meal_plan == "Thursday"){
    dayMealPlan$Thursday = dayMealPlan$Thursday %>%
      rbind(A)
    saveRDS(dayMealPlan$Thursday,paste0(path_storage,"dayPlan_dev_4.rds"))
  }else if(input$tabs_panel_meal_plan == "Friday"){
    dayMealPlan$Friday = dayMealPlan$Friday %>%
      rbind(A)
    saveRDS(dayMealPlan$Friday,paste0(path_storage,"dayPlan_dev_5.rds"))
  }else if(input$tabs_panel_meal_plan == "Saturday"){
    dayMealPlan$Saturday = dayMealPlan$Saturday %>%
      rbind(A)
    saveRDS(dayMealPlan$Saturday,paste0(path_storage,"dayPlan_dev_6.rds"))
  }else if(input$tabs_panel_meal_plan == "Sunday"){
    dayMealPlan$Sunday = dayMealPlan$Sunday %>%
      rbind(A)
    saveRDS(dayMealPlan$Sunday,paste0(path_storage,"dayPlan_dev_7.rds"))
  }
})

# Delete row
feature_delete_food = observeEvent(input$action_delete_food, {
  if(input$tabs_panel_meal_plan == "Monday"){
    dayMealPlan$Monday = dayMealPlan$Monday[-input$output_table_mealPlan_Monday_rows_selected,]
    saveRDS(dayMealPlan$Monday,paste0(path_storage,"dayPlan_dev_1.rds"))
  }else if(input$tabs_panel_meal_plan == "Tuesday"){
    dayMealPlan$Tuesday = dayMealPlan$Tuesday[-input$output_table_mealPlan_Tuesday_rows_selected,]
    saveRDS(dayMealPlan$Tuesday,paste0(path_storage,"dayPlan_dev_2.rds"))
  }else if(input$tabs_panel_meal_plan == "Wednesday"){
    dayMealPlan$Wednesday = dayMealPlan$Wednesday[-input$output_table_mealPlan_Wednesday_rows_selected,]
    saveRDS(dayMealPlan$Wednesday,paste0(path_storage,"dayPlan_dev_3.rds"))
  }else if(input$tabs_panel_meal_plan == "Thursday"){
    dayMealPlan$Thursday = dayMealPlan$Thursday[-input$output_table_mealPlan_Thursday_rows_selected,]
    saveRDS(dayMealPlan$Thursday,paste0(path_storage,"dayPlan_dev_4.rds"))
  }else if(input$tabs_panel_meal_plan == "Friday"){
    dayMealPlan$Friday = dayMealPlan$Friday[-input$output_table_mealPlan_Friday_rows_selected,]
    saveRDS(dayMealPlan$Friday,paste0(path_storage,"dayPlan_dev_5.rds"))
  }else if(input$tabs_panel_meal_plan == "Saturday"){
    dayMealPlan$Saturday = dayMealPlan$Saturday[-input$output_table_mealPlan_Saturday_rows_selected,]
    saveRDS(dayMealPlan$Saturday,paste0(path_storage,"dayPlan_dev_6.rds"))
  }else if(input$tabs_panel_meal_plan == "Sunday"){
    dayMealPlan$Sunday = dayMealPlan$Sunday[-input$output_table_mealPlan_Sunday_rows_selected,]
    saveRDS(dayMealPlan$Sunday,paste0(path_storage,"dayPlan_dev_7.rds"))
  }
})

# Reset meal plan
feature_reset_plan = observeEvent(input$action_reset_plan,{
  if(input$tabs_panel_meal_plan == "Monday"){
    dayMealPlan$Monday = dayMealPlan$Monday %>%
      slice(0)
    saveRDS(dayMealPlan$Monday,paste0(path_storage,"dayPlan_dev_1.rds"))
  }else if(input$tabs_panel_meal_plan == "Tuesday"){
    dayMealPlan$Tuesday = dayMealPlan$Tuesday %>%
      slice(0)
    # saveRDS(dayMealPlan$Tuesday,paste0(path_storage,"dayPlan_dev_2.rds"))
    saveRDS(dayMealPlan$Tuesday,"/home/MihaiG/temp_storage/dayPlan_dev_2.rds")
  }else if(input$tabs_panel_meal_plan == "Wednesday"){
    dayMealPlan$Wednesday = dayMealPlan$Wednesday %>%
      slice(0)
    saveRDS(dayMealPlan$Wednesday,paste0(path_storage,"dayPlan_dev_3.rds"))
  }else if(input$tabs_panel_meal_plan == "Thursday"){
    dayMealPlan$Thursday = dayMealPlan$Thursday %>%
      slice(0)
    saveRDS(dayMealPlan$Thursday,paste0(path_storage,"dayPlan_dev_4.rds"))
  }else if(input$tabs_panel_meal_plan == "Friday"){
    dayMealPlan$Friday = dayMealPlan$Friday %>%
      slice(0)
    saveRDS(dayMealPlan$Friday,paste0(path_storage,"dayPlan_dev_5.rds"))
  }else if(input$tabs_panel_meal_plan == "Saturday"){
    dayMealPlan$Saturday = dayMealPlan$Saturday %>%
      slice(0)
    saveRDS(dayMealPlan$Saturday,paste0(path_storage,"dayPlan_dev_6.rds"))
  }else if(input$tabs_panel_meal_plan == "Sunday"){
    dayMealPlan$Sunday = dayMealPlan$Sunday %>%
      slice(0)
    saveRDS(dayMealPlan$Sunday,paste0(path_storage,"dayPlan_dev_7.rds"))
  }
})

# ----------- Food database menu --------------
# Add food item to database
feature_add_food_database = observeEvent(input$action_add_food_data,{
  showModal(
    modalDialog(
      title = "Add food item",
      textInput("input_add_food_data_name",
                "Name:",
                value = ""),
      numericInput("input_add_food_data_quantity",
                   "Quantity:",
                   value = 0),
      selectInput("input_add_food_data_unit",
                  "Unit:",
                  choices = as.character(levels(factor(foodDatabase$Data[,3])))),
      numericInput("input_add_food_data_calories",
                   "Calories:",
                   value = 0),
      numericInput("input_add_food_data_protein",
                   "Protein:",
                   value = 0),
      numericInput("input_add_food_data_carbs",
                   "Carbs:",
                   value = 0),
      numericInput("input_add_food_data_fat",
                   "Fat:",
                   value = 0),
      actionButton("action_save_food_data","Add"),
    )
  )
})
feature_save_food_database = observeEvent(input$action_save_food_data,{
  NewEntry = data.frame(Name = as.character(input$input_add_food_data_name),
                        Quantity = as.numeric(input$input_add_food_data_quantity),
                        Unit = as.character(input$input_add_food_data_unit),
                        Calories = as.numeric(input$input_add_food_data_calories),
                        Protein = as.numeric(input$input_add_food_data_protein),
                        Carbs = as.numeric(input$input_add_food_data_carbs),
                        Fat = as.numeric(input$input_add_food_data_fat)
  )
  foodDatabase$Data = foodDatabase$Data %>% 
    rbind(NewEntry)
})

# Edit food in database
feature_edit_food_data = observeEvent(input$action_edit_food_data,{
  if(paste0(foodDatabase$Data[input$output_table_food_and_meals_rows_selected,1],".rds") 
     %in%
     list.files(paste0(path_storage,"meals/"))){
    newMeal$Data = readRDS(
      paste0(
        path_storage,"meals/",
        foodDatabase$Data[input$output_table_food_and_meals_rows_selected,1],
        ".rds"
      )
    )
    showModal(
      modalDialog(
        textInput(
          "input_create_meal_name_data",
          "Name",
          value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,1]),
        selectInput(
          "input_select_food_for_meal_data",
          "Food",
          choices = as.character(levels(factor(foodDatabase$Data[,1])))
        ),
        uiOutput('text_unit_for_meal_data'),
        numericInput(
          "input_select_quantity_for_meal_data",
          "Quantity",
          value = 0),
        actionButton('action_add_food_create_meal_data',"Add"),
        actionButton('action_delete_food_create_meal_data',"Delete"),
        actionButton('action_reset_create_meal_data',"Reset"),
        DT::DTOutput('output_table_create_meal_data'),
        numericInput(
          "input_select_servings_for_meal_data",
          "Servings",
          value = 1),
        DT::DTOutput('output_table_macros_create_meal_data'),
        actionButton('action_add_meal_data',"Add to database")
      )
    )
  }else{
    showModal(
      modalDialog(
        title = "Edit food item",
        textInput("input_edit_food_data_name",
                  "Name:",
                  value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,1]),
        numericInput("input_edit_food_data_quantity",
                     "Quantity:",
                     value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,2]),
        selectInput("input_edit_food_data_unit",
                    "Unit:",
                    choices = as.character(levels(factor(foodDatabase$Data[,3]))),
                    selected = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,3]),
        numericInput("input_edit_food_data_calories",
                     "Calories:",
                     value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,4]),
        numericInput("input_edit_food_data_protein",
                     "Protein:",
                     value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,5]),
        numericInput("input_edit_food_data_carbs",
                     "Carbs:",
                     value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,6]),
        numericInput("input_edit_food_data_fat",
                     "Fat:",
                     value = foodDatabase$Data[input$output_table_food_and_meals_rows_selected,7]),
        actionButton("action_save_edit_food_data","Edit")
      )
    )
  }
})
feature_save_edit_food_data = observeEvent(input$action_save_edit_food_data,{
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,1] = input$input_edit_food_data_name
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,2] = input$input_edit_food_data_quantity
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,3] = input$input_edit_food_data_unit
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,4] = input$input_edit_food_data_calories
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,5] = input$input_edit_food_data_protein
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,6] = input$input_edit_food_data_carbs
  foodDatabase$Data[input$output_table_food_and_meals_rows_selected,7] = input$input_edit_food_data_fat
})

# Delete food from database
feature_delete_food_data = observeEvent(input$action_delete_food_data,{
  foodDatabase$Data = foodDatabase$Data[-input$output_table_food_and_meals_rows_selected,]
})

# Save changes to database
feature_save_changes_database = observeEvent(input$action_save_changes_food_data,{
  saveRDS(foodDatabase$Data,paste0(path_storage,"food_and_meals.rds"))
  shinyalert(title = "Saved!", type = "success")
})

# Create meal
feature_create_meal_database = observeEvent(input$action_create_meal_data,{
  showModal(
    modalDialog(
      textInput(
        "input_create_meal_name_data",
        "Name"),
      selectInput(
        "input_select_food_for_meal_data",
        "Food",
        choices = as.character(levels(factor(foodDatabase$Data[,1])))
      ),
      uiOutput('text_unit_for_meal_data'),
      numericInput(
        "input_select_quantity_for_meal_data",
        "Quantity",
        value = 0),
      actionButton('action_add_food_create_meal_data',"Add"),
      actionButton('action_delete_food_create_meal_data',"Delete"),
      actionButton('action_reset_create_meal_data',"Reset"),
      DT::DTOutput('output_table_create_meal_data'),
      numericInput(
        "input_select_servings_for_meal_data",
        "Servings",
        value = 1),
      DT::DTOutput('output_table_macros_create_meal_data'),
      actionButton('action_add_meal_data',"Add to database")
    )
  )
})

# In create meal box: add food item
feature_add_item_to_new_meal = observeEvent(input$action_add_food_create_meal_data,{
  workBench = foodDatabase$Data %>%
    filter(Name == input$input_select_food_for_meal_data)
  A = workBench %>%
    mutate(Quantity = input$input_select_quantity_for_meal_data) %>%
    mutate(Calories = round(workBench$Calories*input$input_select_quantity_for_meal_data/workBench$Quantity)) %>%
    mutate(Protein = round(workBench$Protein*input$input_select_quantity_for_meal_data/workBench$Quantity)) %>%
    mutate(Carbs = round(workBench$Carbs*input$input_select_quantity_for_meal_data/workBench$Quantity)) %>%
    mutate(Fat = round(workBench$Fat*input$input_select_quantity_for_meal_data/workBench$Quantity))
  newMeal$Data = newMeal$Data %>%
    rbind(A)
})

# In create meal box: delete item table
feature_delete_item_to_new_meal = observeEvent(input$action_delete_food_create_meal_data,{
  newMeal$Data = newMeal$Data[-input$output_table_create_meal_data_rows_selected,]
})

# In create meal box: reset table
feature_reset_new_meal = observeEvent(input$action_reset_create_meal_data,{
  newMeal$Data = newMeal$Data %>% 
    slice(0)
})

# In create meal box: save meal
feature_save_new_meal_database = observeEvent(input$action_add_meal_data,{
  # save "recipe" in the local storage folder
  saveRDS(newMeal$Data,paste0(path_storage,"meals/",input$input_create_meal_name_data,".rds"))
  # add 1 serving to the food database
  NewEntry = data.frame(Name = as.character(input$input_create_meal_name_data),
                        Quantity = as.numeric(1),
                        Unit = as.character("serving"),
                        Calories = as.numeric(round(sum(newMeal$Data[,4])/input$input_select_servings_for_meal_data)),
                        Protein = as.numeric(round(sum(newMeal$Data[,5])/input$input_select_servings_for_meal_data)),
                        Carbs = as.numeric(round(sum(newMeal$Data[,6])/input$input_select_servings_for_meal_data)),
                        Fat = as.numeric(round(sum(newMeal$Data[,7])/input$input_select_servings_for_meal_data))
  )
  foodDatabase$Data = foodDatabase$Data %>% 
    filter(Name != as.character(input$input_create_meal_name_data)) %>% 
    rbind(NewEntry)
  saveRDS(foodDatabase$Data,paste0(path_storage,"food_and_meals.rds"))
})
