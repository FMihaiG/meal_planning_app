library(shiny)
library(xlsx)
library(ggplot2)
library(reshape)
library(dplyr)
library(DT)
library(shinythemes)
library(shinyalert)
library(shinydashboard)

rm(list=ls())

# PRODUCTION

path_project = "/srv/shiny-server/meal_planning_app"
path_storage = paste0(path_project,"/LocalStorage/")

# Source ui and server
source(paste0(path_project,'/myUI.R'), local = TRUE)
source(paste0(path_project,'/myServer.R'), local = TRUE)

shinyApp(ui = myUI, server = myServer)








