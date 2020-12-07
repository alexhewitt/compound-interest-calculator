# README

## Compound interest web application

Build a Rails web application that allows a user to calculate compound interest on their investment over a time period of years.

Information about compound interest can be found here:

https://www.thecalculatorsite.com/articles/finance/compound-interest-formula.php

This includes a working equation that can be used in your application.

### Requirements
- In a browser a user should be able to input 3 values:
- Starting value (principal)
- Interest rate
- Years
- When the user submits they should see the value of their investment after the
number of years they input (see examples in link)
- Optional: persist results in a database and list the previous calculations in a view

### Notes
- Don’t worry about compound interest multiple times a year, we will assume just once
- Only allow for compound interest to be calculated by years, there is no need to give
an option for months
- No styling
- No need for any JavaScript (unless you want to!)

### Running the application locally
- Built with Ruby 2.7.2 and Rails 6.0.3.4

- Run 'bundle install'

- Run rake:db create

- Run rake:db migrate

- Run rails s

- In your web browser, go to http://localhost:3000/

### TODO
- Write tests
