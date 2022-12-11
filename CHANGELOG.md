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


## [1.1.7] - 11-12-2022

### Added
- Speech to text plugin to recognise voice input
- Text to speech plugin to pronounce the speech input text
- Permissions in android manifest file
- Voice assistant screen for voice input interface
- Voice assistant bloc set
- Initialisation function for speech to text plugin in Voice assistant bloc
- Voice navigation logic in bloc listener section of Voice assistant screen

### Changed
- Kannada language's code from 'ka' to 'kn'
- App icon
- Change theme function call in splash screen to cubit function inside app theme cubit


## [1.1.6] - 7-12-2022

### Added
- Color inverted logo for dark mode
- App theme cubit
- Theme setting screen
- Theme setting shared preference
- Function call in splash screen to manage the device changed theme states

### Changed
- Theme colors from static to inherited classes
- All the theme color references throughout the screens and widgets


## [1.1.5] - 6-12-2022

### Added
- Shared preferences plugin to store app data locally
- Shared preference variable to store language code

### Changed
- Static internet message in home page to multi lingual keywords
- Connection status in Internet cubit


## [1.1.4] - 6-12-2022

### Added
- Enums file to store internet connection enums
- "Connectivity plus" plugin to check the connection state of the device
- Internet cubit sets
- Error states in "Random jokes state"
- Internet connection message in home screen
- Appropriate return statements on api error/failure

### Changed
- Return structure of "Random jokes repository"
- Api calling method to integrate with the internet connection state in "Random jokes screen"

### Removed
- Build context parameter for fetch jokes function


## [1.1.3] - 6-12-2022

### Added
- Bloc folder in test/logic folder
- Bloc test file for bloc unit test
- Invalid format state in Calculator states
- Build listener inside calculator screen to display invalid format snackbar

### Changed
- Bloc states by extending Equatable
- Backspace event by adding Invalid format state condition

### Removed
- Build context parameter for Get result event


## [1.1.2] - 6-12-2022

### Added
- logic/cubit folder in test folder
- Test file for Home screen cubit and My form cubit
- bloc test plugin for unit test
- Equatable plugin for cubit states

### Changed
- Cubit states by extending Equatable class
- Incrementer function in Home screen cubit by adding parameter in the function call
- All the functions in My form cubit to Future<bool> return type from void
- Appropriate logics in My form screen


## [1.1.1] - 3-12-2022

### Added
- Assets folder for storing assets
- Images folder inside assets folder to store image
- App logo in splash screen
- Localisations folder to handle multiple languages
- Languages screen to handle language change
- "flutter_localizations" plugin to handle multiple languages

### Changed
- Replaced all the static strings in screens, widgets and cubits with localised multi lingual keywords


## [1.1.0] - 2-12-2022

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