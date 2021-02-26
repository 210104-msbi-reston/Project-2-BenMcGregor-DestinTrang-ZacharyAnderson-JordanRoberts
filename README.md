# Project 2 - Pandex Reports
## Project Description
Pandex is a nationwide food delivery service used by thousands of customers every day. Since the manifestation of global issues stemming from the COVID-19 Pandemic, more and more customers rely on food delivery services like Pandex to stay safe in isolation while enjoying their favorite foods. Business has increased as more people stay home, and we should remain as efficient and competitive as possible in this growing industry.

Pandex does not currently have a singular database from which to track and analyze data, through which sound business decisions can be made regarding the future of the company. We plan to create a database to consolidate and track business-related data for analysis. This data will be aggregated into a data warehouse for analysis. We will analyze this data, noting any positive trends or avenues for improvement, and report our findings to the Pandex board for scrutiny.


## Technologies Used
- SQL Server Management Server
- SQL Server Integration Server
- SQL Server Analysis Server
- SQL Server Reporting Server
- Microsoft Excel

## Features
- A robust database with views/functions to view and manipulate Order Data for Pandex delivery company
- Data warehouse to analyse individual orders by dimension
- SSIS packages for easy updating of data and scheduling for data refresh
- Multidimensional model based on individual orders for deep analysis
- A collection of reports showcasing all aspects of recorded business operations across the country

## Getting Started
Required Software: Microsoft SQL Server Management Studio, Visual Studio

### Steps to pull databases from repos
- Create a directory that will store the project data
- Locate the directory in Git Bash
- Type git init and press Enter
- Type git pull https://github.com/210104-msbi-reston/Project-2-BenMcGregor-DestinTrang-ZacharyAnderson-JordanRoberts.git
- Open Microsoft SQL Server Management Studio
- Create a database to store Pandex DB data as well as a database to store Pandex DW data
- Unzip and restore Project-2.bak and Project2DW.bak
- Create connections in SSIS, SSAS, and SSRS to your new Project-2 (Database) and Project2DW (Data Warehouse)
- Process and Deploy the cube from SSAS to SSMS using your own connection settings

## Usage
- Data updates automatically through SSIS and SQL Server Agent from the included Excel file
- SSRS Reports are fully functional with Cube and Data Warehouse objects, and able to be deployed to a personal reporting service
