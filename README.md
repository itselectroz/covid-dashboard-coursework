# Covid Dashboard

![Build status](https://github.com/itselectroz/covid-dashboard-coursework/actions/workflows/python-test.yml/badge.svg)

Automatic covid dashboard for displaying accurate, up to date covid data and news.

## Table of Contents

 - [Features](#features)
 - [Installing](#installing)
 - [Running](#running)

## Features

## Installing

Installing the dashboard is simple.

Ensure pip is up to date  
`python -m pip install –upgrade pip`

Install the required pip modules using the following command  
`python -m pip install -r requirements.txt`

## Running

Running the dashboard is easy. You have two options;

- [Using the main module](#main_module)
- [Flask's CLI](#flask_cli)

### Main Module

Assuming you have python installed simply run

`python src/main.py`

### Flask CLI

First you need to export the necessary variables

#### CMD

`set FLASK_APP="src/main.py"`

#### Powershell

`$env:FLASK_APP="src/main.py"`

#### Bash

`export FLASK_APP="src/main.py"`

Then finally run the app using

`flask run`
