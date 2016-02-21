# Snow Alert

## Description

Application that sends email snow alerts for a users’ favorite ski resorts.

## Production site

[https://snow-a1ert.herokuapp.com/](https://snow-a1ert.herokuapp.com/)

## Features

- Facebook OAuth
- Handrolled service for [Forcast.io's](http://www.forcast.io) weather API
- Rakefile for populating database with North American Ski resort info
- Rake task for sending automated daily alert emails to users

## Running locally

#### Clone Repo
`bundle`

`rake db:create db:migrate data:import`

#### To run tests  

`rake test`
