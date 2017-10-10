# Sugar Track (Sugar Level Tracker and Analytics)

## Key Requirements :
  - ### Store user provided blood sugar levels
  - ### Display levels overtime in a useful manner back to the user

## Models
- Users -> Devise
- Post -> owner:userID level:number date:date

## Features
- Users may log via the site
- Data will be graphed and interactive (Chart.js?)

- Texts will be scheduled as defined by the user
- Users will receive text prompts allowing them to create a log via text

## Tools
- Devise -> User Authentication
- Bootstraps -> Basic Formating
- NPM -> Fornt-end Package Manger
- Chart.js -> Data Representation
- React - Redux -> Front-end Data Management

## ToDo
- Add rspec, capybara and bi
- Setup DB
- Create tests and make Logs Model
- Add Devise
...
