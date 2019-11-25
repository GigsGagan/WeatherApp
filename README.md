# WeatherApp
Assignment: Weather App

 

Sign up for a free account on https://www.worldweatheronline.com/developer/api/docs/ to create an iOS Weather app that fulfills the following usecases.

 

Use Case 1.

As a user

Given I am on the home screen

When I type in to the search bar on the home page

Then i will see a list of available cities that pattern matches what I have typed

 

 

Use Case 2.

As a user

Given I am on the home screen

And there is a list of available cities (based on what I've typed)

 

When I tap on a city

Then I will be on the city Screen

 

Then I will see the current weather image

Then I will see the current humidity

Then I will see the current weather in text form

Then I will see the current weather temperature

 

 

Use Case 3.

As a user

Given I am on the home screen

And I have not viewed a City's weather

 

Then I should see a list view empty state

 

 

Use Case 4.

As a user

Given I am on the home screen

And I have previously viewed any city's weather

 

Then I should see a ordered list of the recent 10 cities that I have previously seen.

And I should see the latest City that I have viewed at the top of the list

 

 

Use Case 5.

As a user

Given I have previously viewed any city's weather

When I have relaunched the app (terminating the app and relaunched)

Then I should see a ordered list of the recent 10 cities that I have previously seen.

 

 

The assignment may look simple. The reviewers will be looking out on whether you adhere to clean code practices and readibility.

 

 

1. Code are to be in Swift

2. Please approach this exercise as you would in your day-to-day development workflow.

3. No use of external libraries. We want to see whether you are able to code without external help.

4. Please ensure that codes are properly unit tested. We expect to see all non-UI logics to be 100% tested and covered. Kindly use the XCode code coverage report to ensure all codes are covered.

5. No Massive View Controller anti-pattern. We are open for the use of any UIViewController architecture on the condition that it is properly tested and covered.

6. We will be looking at every LOC and assess on at least: appropriate naming, complexity, placement of codes

7. Bonus: We want to see if you are able to write good XCUITest cases

 
