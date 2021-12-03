# Covid Dashboard

![Build status](https://github.com/itselectroz/covid-dashboard-coursework/actions/workflows/python-test.yml/badge.svg)

Automatic covid dashboard for displaying accurate, up to date covid data and news.

## Table of Contents

 - [Features](#features)
 - [Installing](#installing)
 - [Running](#running)
 - [Config File](#config_file)
   - [Logging](#logging)
   - [Template](#template)
   - [Core](#core)
 - [Testing](#testing)

## Features

- Display up-to-date COVID-19 statistics
  - Display both local and national articles
- Display recent news articles about the configured search terms
  - Remove articles from being displayed, even after new ones are fetched
- Schedule one-time and repeating updates to fetch new statistics and news articles
- All configurable

## Installing

Installing the dashboard is simple.

Ensure pip is up to date  

    python -m pip install –upgrade pip

Install the required pip modules using the following command

    python -m pip install -r requirements.txt

## Running

Running the dashboard is easy. You have two options;

- Using the main module
- Flask's CLI

### Main Module

Assuming you have python installed simply run

    python src/__main__.py

### Flask CLI

First you need to export the necessary variables

***

#### CMD

`set FLASK_APP="src/__main__.py"`

#### Powershell

`$env:FLASK_APP="src/__main__.py"`

#### Bash

`export FLASK_APP="src/__main__.py"`

***

Then run the app using

    flask run

This will start the interface at `127.0.0.1:5000/index` which can simply be navigated to with any web browser.

## Config File

This project has a configuration JSON file which can be used to customize the dashboard.

The default configuration is as follows:

```json
{
    "logging": {
        "enabled": true,
        "debug": false,
        "path": "./logging/log",
        "use_file": true,
        "dump_debug_on_error": true,
        "dump_debug_count": 10
    },

    "template": {
        "title": "COVID-19 UK Dashboard",
        "logo": "logo.webp",
        "favicon": "favicon.webp"
    },

    "location": "Exeter",
    "location_type": "ltla",
    "nation_location": "England",

    "search_terms": "Covid COVID-19 coronavirus",

    "news_api_key": "a9bbf9fd5caa4b42a8a41a7113584e64",

    "resource_path": "../resources/",
    "static_path": "../static/",

    "inital_national_data_filename": "nation_2021-10-28.csv"
}
```

### Logging

**enabled** : boolean  
Whether or not the logging module is enabled.  
This disables debug, info and error logs as well as file writes.

**debug** : boolean  
This toggles whether or not to log debug messages to the console.  
They will still be written to a file upon error.  

**path** : string  
The path to the log file. Can be relative or absolute.  

**use_file** : boolean  
Whether to write info and error logs to a file.  

**dump_debug_on_error** : boolean  
Whether to log the history of debug messages when an error log occurs.  
The number of debug messages to log is configurable.

**dump_debug_count** : number  
The number of debug messages to log.

### Template

**title** : string  
The title to display at the top of the template page.

**logo** : string  
The logo image path relative to `/static/images/` (where /static/ is the static directory)  

**favicon** : string  
The favicon image path relative to `/static/images/` (where /static/ is the static directory)  

### Core

**location** : string  
The location in which to query covid data for.
The valid values for this config option depends on the value of location_type.

**location_type** : string  
The type of the location configuration option.
Valid options can be found [here](https://coronavirus.data.gov.uk/details/developers-guide/main-api#params-filters) under the the areaType metric.

**nation_location** : string  
The national location to use for national data.
Must be a valid nation in the UK.

**search_terms** : string  
A list of search terms separated by space used to query for news articles.
The value `covid19 coronavirus` will be split into two queries, `covid19` and `coronavirus`.
There is no way to include a space in a query.

**news_api_key** : string  
Your [news api key](https://newsapi.org/account).

**resource_path** : string  
The path to your resources folder.

**static_path** : string  
The path to your static folder.
This folder is used for all static content on the dashboard, such as images.  
All file paths in the [template](#template) configuration section are relative to `static_path/images/`.

**inital_national_data_filename** : string  
The path to the initial csv data file. This file is used to load initial data for the dashboard.  
The path for this file is relative to `resource_path/`
