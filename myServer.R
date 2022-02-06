# Create server
myServer = function(input,output,session){
  # source codes
  source('/srv/shiny-server/meal_planning_app/myFilters.R', local = TRUE)
  source('/srv/shiny-server/meal_planning_app/myText.R', local = TRUE)
  source('/srv/shiny-server/meal_planning_app/myTables.R', local = TRUE)
  source('/srv/shiny-server/meal_planning_app/features.R', local = TRUE)
  
  # baseline plan
  foodDatabase = reactiveValues()
  dayMealPlan = reactiveValues()
  newMeal = reactiveValues()
  
  dayMealPlan$Monday = readRDS(paste0(path_storage,"dayPlan_dev_1.rds"))
  dayMealPlan$Tuesday = readRDS(paste0(path_storage,"dayPlan_dev_2.rds"))
  dayMealPlan$Wednesday = readRDS(paste0(path_storage,"dayPlan_dev_3.rds"))
  dayMealPlan$Thursday = readRDS(paste0(path_storage,"dayPlan_dev_4.rds"))
  dayMealPlan$Friday = readRDS(paste0(path_storage,"dayPlan_dev_5.rds"))
  dayMealPlan$Saturday = readRDS(paste0(path_storage,"dayPlan_dev_6.rds"))
  dayMealPlan$Sunday = readRDS(paste0(path_storage,"dayPlan_dev_7.rds"))
  
  foodDatabase$Data = readRDS(paste0(path_storage,"food_and_meals.rds"))
  newMeal$Data = data.frame(
    Name = as.character(),
    Quantity = as.character(),
    Unit = as.character(),
    Calories = as.numeric(),
    Protein = as.numeric(),
    Carbs = as.numeric(),
    Fat = as.numeric()
  )
  
  # =========== Filters ===============
  output$filter_input_food_plan = filter_input_food_plan
  
  # =========== Texts ===============
  
  # food units
  output$text_food_unit = text1
  output$text_unit_for_meal_data = text2
  
  # =========== Tables ===============
  # Day plan
  output$output_table_mealPlan_Monday = table_mealPlan_Monday
  output$output_table_mealPlan_Tuesday = table_mealPlan_Tuesday
  output$output_table_mealPlan_Wednesday = table_mealPlan_Wednesday
  output$output_table_mealPlan_Thursday = table_mealPlan_Thursday
  output$output_table_mealPlan_Friday = table_mealPlan_Friday
  output$output_table_mealPlan_Saturday = table_mealPlan_Saturday
  output$output_table_mealPlan_Sunday = table_mealPlan_Sunday
  
  # Total macros
  output$output_table_macros = table_total_macros
  
  # Food & meals
  output$output_table_food_and_meals = table3
  
  # Create and edit meal
  output$output_table_create_meal_data = table_create_meal
  
  # Create meal macros
  output$output_table_macros_create_meal_data = table_macros_meal
  
  # =========== Functionality ===============
  # ----------- Meal plan menu --------------
  # Add food item to plan
  feature_add_food_plan
  
  # Delete row
  feature_delete_food
  
  # Reset meal plan
  feature_reset_plan
  
  # ----------- Food database menu ----------
  # add food item to database
  feature_add_food_database
  feature_save_food_database
  
  # edit food item
  feature_edit_food_data
  feature_save_edit_food_data
  
  # delete food item
  feature_delete_food_data
  
  # save changes in database
  feature_save_changes_database
  
  # create meal
  feature_create_meal_database
  feature_add_item_to_new_meal
  feature_delete_item_to_new_meal
  feature_reset_new_meal
  feature_save_new_meal_database

}




