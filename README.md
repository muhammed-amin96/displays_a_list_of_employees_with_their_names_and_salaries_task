# Employee List App

Fetch employee data using Dio and implement error handling using try-catch then parse JSON responses and map them to model then cache the employee list locally.
## Features

- Fetches employee data from an API using dio for API call.
- Map responses to a model.
- Error handling for API requests.
- Display a loading indicator while fetching data.
- Navigate between two screens and pass data to the details page through constructor.
- Cache the employee list locally using shared preferences and load it on app restart.

## Steps

### employee_service.dart:

1. Used dio package to fetch data from an endpoint with link https://mocki.io/v1/283ba093-9bf9-42e4-8f28-d2538937f9ca
2. Parsed json data and mapped it to my employee model.
3. Converted this json into string to save it in a shared preference to be loaded later on app restart.

### employee_model.dart:

1. Auto generated employee model using https://app.quicktype.io/

### home_screen.dart:

1. Created a function to load data from shared preferences.
2. Created another function to be called in initState() and this function makes api call when app is first launched then if app restarts it gets data from shared preferences by calling the first function.
3. Built UI for the screen where I pass the employee selected to the details screen to be viewed there.