library(shiny)
library(xlsx)
library(ggplot2)
library(plotly)
library(reshape)
library(dplyr)
library(DT)
library(shinythemes)
library(shinyalert)
library(shinydashboard)

rm(list=ls())

# PRODUCTION

path_storage = "/srv/shiny-server/meal_planning_app/Local storage/"

# Source ui and server
source('/srv/shiny-server/meal_planning_app/myUI.R', local = TRUE)
source('/srv/shiny-server/meal_planning_app/myServer.R', local = TRUE)

shinyApp(ui = myUI, server = myServer)








