# Sluice

## GA WDI DC August 2014, Project 1


## Overview
_Sluice_ is a web application that helps journalists, researchers, and other social media analysts extract needle-in-a-haystack data from Twitter. It was developed for the August 2014 Web Development Immersive course at General Assembly in Washington, DC.

[Sluice](http://sluice-wdi.herokuapp.com/)


## Technology
* Ruby 2.1.1
* Rails 4.1.1
* PostgreSQL Database
* Authentication and Authorization using devise
* Twitter Search API
* Testing using rspec-rails and shoulda-matchers


## User Stories
* As a user I can sign up for an account on the site
* As a user I can log in to my account
* As a user I can create a new search query
* As a user I can run my search and the site returns tweets that match my query
* As a user I can choose to save important tweets that result from a query
* As a user I can edit or delete a query, and delete any saved tweet
* As a user I can only view queries and tweets that belong to me


## Next Steps

I'd like to build more features to make the app more helpful to users by automating the process of running queries on Twitter Search API. Ideally a cron job would schedule each user's queries to run once a day, with the option to send an email notification in the event of tweets fulfilling high-priority queries.

The complete user stories and backlog are recorded on this [pivotal tracker](https://www.pivotaltracker.com/s/projects/1160736) project.

## ERD


##### Written by Clare Politano