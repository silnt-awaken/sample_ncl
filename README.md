# Flutter Ships Information App
## Overview
This is a Flutter app that fetches and displays the information about different ships from the Norwegian Cruise Line's API. The application uses BLoC architecture pattern for state management and http package to make API requests.

## Requirements
This application features:

Three buttons labeled SKY, BLISS, and ESCAPE. Each button corresponds to a specific ship.

Upon pressing a button, the app sends a GET request to the respective API endpoint: https://www.ncl.com/cms-service/cruise-ships/{SHIP_NAME}

The app parses the JSON response and displays the following fields:

"shipName"
"shipFacts.passengerCapacity"
"shipFacts.crew"
"shipFacts.inauguralDate"
Architecture
This application leverages the BLoC (Business Logic Component) architecture, which is an excellent choice for Flutter, promoting a reactive and predictable state management solution.

Here's a quick overview of the project's structure:

Blocs - The application uses ShipBloc to manage the state of the application. ShipBloc handles the different events triggered from the UI and updates the state accordingly. The state is then provided to the UI components that react and re-render themselves based on the updated state.

Models - This folder contains ShipFacts, a simple data model that represents the facts about a ship. The ShipFacts is created by parsing the JSON response from the API.

Repositories - ShipRepository is used as an abstraction for fetching data. This allows us to separate the concerns of fetching data (API calls) from the business logic (in BLoCs).

UI - This is where the Flutter widgets for the app's UI are defined. The HomePage is the main widget of the application. It uses BlocBuilder to listen for state changes and re-renders the UI accordingly.

## Future Improvements
The current version of the application is quite basic and primarily focused on demonstrating Flutter with BLoC architecture and API usage. Future versions might include:

More detailed information about each ship.
Better error handling and loading states.
Enhancements to the user interface for a more attractive and user-friendly experience.