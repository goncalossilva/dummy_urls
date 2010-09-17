# Dummy routes

"Dummy urls" uses [dummy](http://github.com/goncalossilva/dummy) to generate test urls for your Rails 3 application.

## Description

"Dummy urls" generates GET, POST, PUT and DELETE test urls for your Rails 3 application. It depends on [dummy\_data](http://github.com/goncalossilva/dummy_data) since it expects you to generate your test data with it (you can change it later). It also uses [dummy](http://github.com/goncalossilva/dummy) to generate the needed data for POST and PUT requests. Check dummy's description for a better understanding of what it does.

## Installation

$ gem install dummy_urls

## Usage

Add the following to the Gemfile of your Rails 3 application:
    gem "dummy_urls"
    
Now you have access to the generator:
    rails generate dummy:urls
    
You can change the divisor in use (what these mean exactly is explained latter on):
    rails generate dummy:urls --divisor=3
    
Also, you can manually define the amount of urls to generate for each model (or just accept the defaults):
    rails generate dummy:urls --manual-amounts
    
And you can manually set the output folder of the dummy data (which defaults to test/dummy):
    rails generate dummy:urls --output-folder test/awesome_fixtures

The files will be placed under _output-folder_/urls.
    
Feel free to mix all of these options.

## More information

### URLs with smart data

"Dummy urls" tells dummy to try to understand your database columns and generate data accordingly, instead of dumping "Lorem ipsum" all over the place.

For instance, if you have a field called _company\_name_, it will generate a company name. If you have a field called _awesome\_postal\_code_, it will generate a valid ZIP Code. If you have a field called _longitude_, it will generate a valid longitude, and so on. You get the picture.

Dummy cares about associations. It will create random associations between the automatically generated records, so you don't have to worry about that.

This way, the generated POST and PUT requests will look very realistic.

### Smart amounts of urls

"Dummy urls" analyzes the amount of records that dummy\_data generated and uses this amount to estimate the amount of url groups to generate (each group composed by a GET, a POST, a PUT and a DELETE request).

It uses the divisor for this estimation. If dummy\_data generated 15 records for a given model and dummy\_urls is using the default divisor (5), it will generate 3 groups of urls for this model (12 requests in total).

Copyright (c) 2010 Gonçalo Silva
