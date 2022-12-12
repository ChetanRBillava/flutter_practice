import '../languages.dart';

class LanguageEn extends Languages {

  ///Sidebar
  @override
  String get language => "Languages";

  @override
  String get welcomeText => "Welcome";

  @override
  String get home => "Home Page";

  @override
  String get calculator => "Calculator";

  @override
  String get jokes => "Random jokes";

  @override
  String get myForm => "My form";

  @override
  String get theme => "Theme setting";

  @override
  String get va => "Voice Assistant";

  @override
  String get anim => "Animations";

  ///home
  @override
  String get homeLabel => "You have pushed the button this many times:";

  @override
  String get wifiConnected => "WiFi connected";

  @override
  String get mobileNetworkConnected => "Mobile network connected";

  @override
  String get noInternet => "No internet connection";

  ///joke
  @override
  String get jokeMessage => "Click on the button to generate a new joke!";

  ///form
  @override
  String get formNameLabel => "Name";

  @override
  String get formNameHint => "Your name";

  @override
  String get formGenderLabel => "Gender";

  @override
  String get formGenderMale => "Male";

  @override
  String get formGenderFemale => "Female";

  @override
  String get formPasswordLabel => "Password";

  @override
  String get formPasswordHint => "Your password";

  @override
  String get formExperienceLabel => "Share your experience";

  @override
  String get formExperienceFirstTime => "First time user";

  @override
  String get formExperienceUsedBefore => "Used this app before";

  @override
  String get formCheckboxLabel => "I have filled this form";

  @override
  String get formDone => "DONE";

  @override
  String get formFieldError => "This field cannot be empty";

  @override
  String get formFieldPasswordLengthError => "Length should be atleast 8";

  @override
  String get formFieldCheckboxError => "Please click the checkbox";

  @override
  String get formFieldGenderError => "Please choose the gender";

}