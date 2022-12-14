import '../languages.dart';

class LanguageHi extends Languages {

  ///sidebar
  @override
  String get language => "भाषा";

  @override
  String get welcomeText => "स्वागत हे";

  @override
  String get home => "मुख पृष्ठ";

  @override
  String get calculator => "गणना-यंत्र";

  @override
  String get jokes => "चुटकुले";

  @override
  String get myForm => "फार्म";

  @override
  String get theme => "थीम सेटिंग";

  @override
  String get va => "आवाज सहायक";

  @override
  String get anim => "एनिमेशन";

  ///home
  @override
  String get homeLabel => "आपने यह बटन इतनी बार दबाया है:";

  @override
  String get wifiConnected => "वाईफाई जुड़ा हुआ है";

  @override
  String get mobileNetworkConnected => "मोबाइल नेटवर्क जुड़ा हुआ है";

  @override
  String get noInternet => "कोई इंटरनेट कनेक्शन नहीं है";

  ///joke
  @override
  String get jokeMessage => "नया चुटकुला बनाने के लिए बटन पर क्लिक करें!";

  ///form
  @override
  String get formNameLabel => "नाम";

  @override
  String get formNameHint => "आपका नाम";

  @override
  String get formGenderLabel => "लिंग";

  @override
  String get formGenderMale => "पुरुष";

  @override
  String get formGenderFemale => "महिला";

  @override
  String get formPasswordLabel => "पासवर्ड";

  @override
  String get formPasswordHint => "आपका पासवर्ड";

  @override
  String get formExperienceLabel => "अपना अनुभव साझा करें";

  @override
  String get formExperienceFirstTime => "पहली बार उपयोगकर्ता";

  @override
  String get formExperienceUsedBefore => "पहले इस ऐप का इस्तेमाल किया है";

  @override
  String get formCheckboxLabel => "मैंने यह फॉर्म भर दिया है";

  @override
  String get formDone => "समाप्त";

  @override
  String get formFieldError => "यह स्थान खाली नहीं रह सकता";

  @override
  String get formFieldPasswordLengthError => "पासवर्ड की लंबाई कम से कम 8 होनी चाहिए";

  @override
  String get formFieldCheckboxError => "कृपया चेकबॉक्स पर क्लिक करें";

  @override
  String get formFieldGenderError => "कृपया अपना लिंग चुनें";

}