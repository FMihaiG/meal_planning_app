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

path_storage = "/R_work/Meal_app_PROD/Local storage/"

# Source ui and server
source('C:/R_work/Meal_app_PROD/myUI.R', local = TRUE)
source('C:/R_work/Meal_app_PROD/myServer.R', local = TRUE)

shinyApp(ui = myUI, server = myServer)








