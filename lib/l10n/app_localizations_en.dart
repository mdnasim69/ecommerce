// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get version => 'version';

  @override
  String get login => 'Login';

  @override
  String get enterYourEmailAndPassword => 'Enter your email and password ';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get dontHaveAccount => 'Don\'t have an account';

  @override
  String get signup => 'Sign Up';

  @override
  String get alreadyHaveAccount => 'Already have account';

  @override
  String get createAnAccount => 'Create an account';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get phone => 'Mobile';

  @override
  String get lastName => 'Last Name';

  @override
  String get firstName => 'First Name';

  @override
  String get theCodeWillExpairIn120Second =>
      'The code will expire in 120 second';

  @override
  String get a4DigitCodeHasBeenSentToYourEmailAddress =>
      'A 4 digit code has been sent to your email address';

  @override
  String get resendCode => 'resend code';

  @override
  String get done => 'Done';
}
