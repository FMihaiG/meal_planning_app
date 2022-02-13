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

path_project = "/home/MihaiG/meal_planning_app"
path_storage = paste0(path_project,"/Local storage/")

# Source ui and server
source(paste0(path_project,'/myUI.R'), local = TRUE)
source(paste0(path_project,'/myServer.R'), local = TRUE)

shinyApp(ui = myUI, server = myServer)








