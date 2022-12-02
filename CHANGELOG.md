# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - dd-mm-yyyy
Here we write the updates of future releases.

1.1.xx belongs to Advance topics

### Added
- Advance topics such as testing, push notifications, languages etc.,

### Changed

### Deprecated

### Removed

### Fixed

### Security


## [1.1.0] - 30-11-2022

### Added
- Custom app icon files
- Custom form field widget
- Custom dialog box widget
- Screen to take form input
- Cubit sets to manage the operations

### Changed
- Renamed custom button class and filename


## [1.0.9] - 30-11-2022

### Added
- Data folder for API execution
- http, models and repositories folders inside "Data" folder
- Random jokes screen
- Cubit set for random jokes
- HTTP plugin for api calls
- URL of jokes api
- Model to store the data
- Repository to execute the api

### Changed
- apk name in build type releases of "android/app/build.gradle"


## [1.0.8] - 28-11-2022

### Added
- Calculator screen which includes basic calculator operations
- Integrated bloc sets for the same
- Sidebar / Drawer widget
- Actions parameter in app bar widget

### Changed
- Integrated an option to open the sidebar / drawer in screens
- Splash property of Inkwell in custom button widget by wrapping the container with "Ink" widget


## [1.0.7] - 28-11-2022

### Added
- Button widget
- Logics folder
- Cubits folder
- Cubit set for home screen logic
- Color styles for button in "App theme" file

### Changed
- Replaced the floating button in "Home Screen" with custom button widget
- Replaced internal function logic of home screen with cubit functions


## [1.0.6] - 27-11-2022

### Added
- Splash screen
- Routing option for splash screen

### Changed
- Replaced the initial route option to "splash"


## [1.0.5] - 27-11-2022

### Added
- Integrated "Sizer" plugin for responsive font sizes
- Constants folder
- Images, Strings and bools file in constants folder
- Custom print file for dynamic management of print statements

### Changed
- Replaced constant font values with Sizer properties for responsive font behaviour
- Passed App title value from the constant value declared in "Strings" constant file


## [1.0.4] - 27-11-2022

### Added
- Themes folder
- App theme file for customised color combination in the app
- Widgets folder
- Custom app bar widget

### Changed
- Replaced generic app bar with custom app bar widget
- Replaced hard coded colors with custom app theme colors


## [1.0.3] - 27-11-2022

### Added
- Router folder
- App router file
- Core folder
- Exceptions folder
- Route exception file

### Changed
- Routing format in main file from generic to generated routes based on App router file


## [1.0.2] - 27-11-2022

### Added
- Utils folder
- App Texts file

### Changed
- Replaced generic app text widget with custom app text widget


## [1.0.1] - 25-11-2022

### Added
- Presentation folder
- Screens folder

### Changed
- Refactored home screen to different directory


## [1.0.0] - 23-11-2022

### Added
- Changelog file

### Changed
- Changed pubspec file by deleting the commented lines
- Renamed package name from "com.crb.flutter_practice.flutter_practice" to "com.crb.flutter_practice"
- Changed the app label in manifest file