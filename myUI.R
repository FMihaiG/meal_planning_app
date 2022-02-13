# Create UI

convertMenuItem <- function(mi,tabName) {
  mi$children[[1]]$attribs['data-toggle']="tab"
  mi$children[[1]]$attribs['data-value'] = tabName
  mi
}

# -------------- Sidebar --------------

sidebar = dashboardSidebar(
  width = 200,
  sidebarMenu(
    convertMenuItem(menuItem("Meal plan",
                             tabName = "menu_item_meal_plan",
                             uiOutput('filter_input_food_plan'),
                             uiOutput('text_food_unit'),
                             numericInput('input_quantity', 'Select quantity', min = 0, max = 10000, value = 0),
                             actionButton('action_add_food','Add to day plan'),
                             br(),
                             actionButton('action_delete_food','Delete'),
                             br(),
                             actionButton('action_reset_plan','Reset meal plan'),
                             width = 3),
                    tabName = "menu_item_meal_plan"
    ),
    convertMenuItem(
      menuItem(
        "Food & meals",
        tabName = "menu_item_food_and_meals",
        actionButton('action_add_food_data', 'Add food item'),
        actionButton('action_edit_food_data', 'Edit food item'),
        actionButton('action_delete_food_data', 'Delete food item'),
        actionButton('action_save_changes_food_data', 'Save changes'),
        actionButton('action_create_meal_data', 'Create meal')
      ),
      tabName = "menu_item_food_and_meals")
  )
)

# -------------- Body --------------

body = dashboardBody(
  tabItems(
    tabItem(tabName = "menu_item_meal_plan",
            fluidPage(
              fluidRow(
                tabsetPanel(id = "tabs_panel_meal_plan",
                  tabPanel('Monday',DT::DTOutput('output_table_mealPlan_Monday')),
                  tabPanel('Tuesday',DT::DTOutput('output_table_mealPlan_Tuesday')),
                  tabPanel('Wednesday',DT::DTOutput('output_table_mealPlan_Wednesday')),
                  tabPanel('Thursday',DT::DTOutput('output_table_mealPlan_Thursday')),
                  tabPanel('Friday',DT::DTOutput('output_table_mealPlan_Friday')),
                  tabPanel('Saturday',DT::DTOutput('output_table_mealPlan_Saturday')),
                  tabPanel('Sunday',DT::DTOutput('output_table_mealPlan_Sunday'))
                )
              ),
              br(),
              fluidRow(
                DT::DTOutput('output_table_macros')
              )
            )
    ),
    tabItem(tabName = "menu_item_food_and_meals",
            fluidPage(
              fluidRow(
                DT::DTOutput('output_table_food_and_meals')
              )
            )
    )
  )
)

# -------------- UI ------------

myUI = dashboardPage(skin="yellow",
                   dashboardHeader(
                     title = "Weekly meal plan",
                     titleWidth = 300
                   ),
                   sidebar,
                   body
)


















