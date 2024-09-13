# Skills OpenAPI Generator

Welcome to the **Skills OpenAPI Generator** app! This application is designed to showcase my skills and achievements as a software engineer, while also demonstrating the use of the OpenAPI Petstore API to manage pets.

## Features

### Skills Screen
- **Skills Overview**: Highlights various skills and technologies with visually appealing icons.
- **Achievements**: List of accomplishments, presented in a scrollable format.

### Pets Screen
- **Pet List**: Displays a list of available pets fetched from the OpenAPI Petstore.
- **Delete Functionality**: Allows users to delete specific pets with a confirmation prompt.

## Technologies Used

- Flutter
- GetX for state management
- Flutter SVG for icons
- OpenAPI Petstore

## Folder Structure

The project is organized into the following structure:

```
skills_openapi_generator/
│
├── lib/
│   ├── controllers/             # Contains GetX controllers for state management
│   │   ├── pet_controller.dart  # Controller for managing pet data
│   ├── screens/                 # Contains screen widgets
│   │   ├── pet_screen.dart     # Screen for displaying available pets
│   │   ├── skills_screen.dart   # Screen for showcasing skills and achievements
│
├── api_client/                  # Contains API client classes for interacting with the OpenAPI Petstore
│   ├── pet_api_client.dart      # API client for managing pets
│   └── ...                      # Other API client files
│
├── assets/                      # Contains assets such as images and SVG files
│   ├── icons/                   # SVG icons used in the app
│   └── ...                      # Other assets
│
├── pubspec.yaml                 # Project configuration file
```

## Snapshots 📸

### Skills Screen
![Skills screen](https://github.com/user-attachments/assets/04b00580-eed2-4cc8-b553-b870f6e798ab)



### Pets Screen
![pet screen](https://github.com/user-attachments/assets/6c9b7a83-5c31-4870-8476-01815e8874df)
![pet screen 2](https://github.com/user-attachments/assets/2bfa5e21-2026-4e11-87c4-89f808ccf209)
