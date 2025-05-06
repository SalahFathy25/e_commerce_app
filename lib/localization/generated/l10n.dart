// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `My Store`
  String get appName {
    return Intl.message('My Store', name: 'appName', desc: '', args: []);
  }

  /// `Continue`
  String get tContinue {
    return Intl.message('Continue', name: 'tContinue', desc: '', args: []);
  }

  /// `Choose your product`
  String get onBoardingTitle1 {
    return Intl.message(
      'Choose your product',
      name: 'onBoardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Select Payment Method`
  String get onBoardingTitle2 {
    return Intl.message(
      'Select Payment Method',
      name: 'onBoardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Deliver at your door step`
  String get onBoardingTitle3 {
    return Intl.message(
      'Deliver at your door step',
      name: 'onBoardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to a World of Limitless Choices - Your Perfect Product Awaits!`
  String get onBoardingSubTitle1 {
    return Intl.message(
      'Welcome to a World of Limitless Choices - Your Perfect Product Awaits!',
      name: 'onBoardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!`
  String get onBoardingSubTitle2 {
    return Intl.message(
      'For Seamless Transactions, Choose Your Payment Path - Your Convenience, Our Priority!',
      name: 'onBoardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!`
  String get onBoardingSubTitle3 {
    return Intl.message(
      'From Our Doorstep to Yours - Swift, Secure, and Contactless Delivery!',
      name: 'onBoardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `E-Mail`
  String get email {
    return Intl.message('E-Mail', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message('Username', name: 'username', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNo {
    return Intl.message('Phone Number', name: 'phoneNo', desc: '', args: []);
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `or sign in with`
  String get orSignInWith {
    return Intl.message(
      'or sign in with',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `I agree to`
  String get iAgreeTo {
    return Intl.message('I agree to', name: 'iAgreeTo', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms of use`
  String get termsOfUse {
    return Intl.message('Terms of use', name: 'termsOfUse', desc: '', args: []);
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Email`
  String get resendEmail {
    return Intl.message(
      'Resend Email',
      name: 'resendEmail',
      desc: '',
      args: [],
    );
  }

  /// `Resend email in`
  String get resendEmailIn {
    return Intl.message(
      'Resend email in',
      name: 'resendEmailIn',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back,`
  String get loginTitle {
    return Intl.message(
      'Welcome back,',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover Limitless Choices and Unmatched Convenience.`
  String get loginSubTitle {
    return Intl.message(
      'Discover Limitless Choices and Unmatched Convenience.',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let's create your account`
  String get signupTitle {
    return Intl.message(
      'Let\'s create your account',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPasswordTitle {
    return Intl.message(
      'Forget password',
      name: 'forgetPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry sometimes people can forget too, enter your email and we will send you a password reset link.`
  String get forgetPasswordSubTitle {
    return Intl.message(
      'Don\'t worry sometimes people can forget too, enter your email and we will send you a password reset link.',
      name: 'forgetPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Email Sent`
  String get changeYourPasswordTitle {
    return Intl.message(
      'Password Reset Email Sent',
      name: 'changeYourPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your Account Security is Our Priority! We've Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.`
  String get changeYourPasswordSubTitle {
    return Intl.message(
      'Your Account Security is Our Priority! We\'ve Sent You a Secure Link to Safely Change Your Password and Keep Your Account Protected.',
      name: 'changeYourPasswordSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verify your email address!`
  String get confirmEmail {
    return Intl.message(
      'Verify your email address!',
      name: 'confirmEmail',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.`
  String get confirmEmailSubTitle {
    return Intl.message(
      'Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World of Unrivaled Deals and Personalized Offers.',
      name: 'confirmEmailSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Didn't get the email? Check your junk/spam or resend it.`
  String get emailNotReceivedMessage {
    return Intl.message(
      'Didn\'t get the email? Check your junk/spam or resend it.',
      name: 'emailNotReceivedMessage',
      desc: '',
      args: [],
    );
  }

  /// `Your account successfully created!`
  String get yourAccountCreatedTitle {
    return Intl.message(
      'Your account successfully created!',
      name: 'yourAccountCreatedTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!`
  String get yourAccountCreatedSubTitle {
    return Intl.message(
      'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
      name: 'yourAccountCreatedSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Popular Products`
  String get popularProducts {
    return Intl.message(
      'Popular Products',
      name: 'popularProducts',
      desc: '',
      args: [],
    );
  }

  /// `Good day for shopping`
  String get homeAppbarTitle {
    return Intl.message(
      'Good day for shopping',
      name: 'homeAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Salah Fathy`
  String get homeAppbarSubTitle {
    return Intl.message(
      'Salah Fathy',
      name: 'homeAppbarSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search in Store`
  String get searchInStore {
    return Intl.message(
      'Search in Store',
      name: 'searchInStore',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  /// `My Address`
  String get address {
    return Intl.message('My Address', name: 'address', desc: '', args: []);
  }

  /// `Set Shopping delivery address`
  String get addressSubtitle {
    return Intl.message(
      'Set Shopping delivery address',
      name: 'addressSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get cart {
    return Intl.message('My Cart', name: 'cart', desc: '', args: []);
  }

  /// `Add, remove products and move to checkout`
  String get cartSubtitle {
    return Intl.message(
      'Add, remove products and move to checkout',
      name: 'cartSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get orders {
    return Intl.message('My Orders', name: 'orders', desc: '', args: []);
  }

  /// `In-progress and Completed orders`
  String get ordersSubtitle {
    return Intl.message(
      'In-progress and Completed orders',
      name: 'ordersSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Add, remove products and move to checkout`
  String get bankAccountSubtitle {
    return Intl.message(
      'Add, remove products and move to checkout',
      name: 'bankAccountSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `My Coupons`
  String get coupons {
    return Intl.message('My Coupons', name: 'coupons', desc: '', args: []);
  }

  /// `List of all the discount coupons`
  String get couponsSubtitle {
    return Intl.message(
      'List of all the discount coupons',
      name: 'couponsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Set any kind of notification message`
  String get notificationsSubtitle {
    return Intl.message(
      'Set any kind of notification message',
      name: 'notificationsSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Account Privacy`
  String get accountPrivacy {
    return Intl.message(
      'Account Privacy',
      name: 'accountPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Manage data usage and connected accounts`
  String get accountPrivacySubtitle {
    return Intl.message(
      'Manage data usage and connected accounts',
      name: 'accountPrivacySubtitle',
      desc: '',
      args: [],
    );
  }

  /// `App Settings`
  String get appSettings {
    return Intl.message(
      'App Settings',
      name: 'appSettings',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message('Theme', name: 'theme', desc: '', args: []);
  }

  /// `Set light or dark theme`
  String get themeSubtitle {
    return Intl.message(
      'Set light or dark theme',
      name: 'themeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Set application language`
  String get languageSubtitle {
    return Intl.message(
      'Set application language',
      name: 'languageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Safe Mode`
  String get safeMode {
    return Intl.message('Safe Mode', name: 'safeMode', desc: '', args: []);
  }

  /// `Search results is safe for all ages`
  String get safeModeSubtitle {
    return Intl.message(
      'Search results is safe for all ages',
      name: 'safeModeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `HD Image Quality`
  String get hdImage {
    return Intl.message(
      'HD Image Quality',
      name: 'hdImage',
      desc: '',
      args: [],
    );
  }

  /// `Set image quality to be seen`
  String get hdImageSubtitle {
    return Intl.message(
      'Set image quality to be seen',
      name: 'hdImageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Change Profile Picture`
  String get changePicture {
    return Intl.message(
      'Change Profile Picture',
      name: 'changePicture',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get profileInformation {
    return Intl.message(
      'Profile Information',
      name: 'profileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get userId {
    return Intl.message('User ID', name: 'userId', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Date of Birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Add New Address`
  String get addNewAddress {
    return Intl.message(
      'Add New Address',
      name: 'addNewAddress',
      desc: '',
      args: [],
    );
  }

  /// `Addresses`
  String get addresses {
    return Intl.message('Addresses', name: 'addresses', desc: '', args: []);
  }

  /// `Street`
  String get street {
    return Intl.message('Street', name: 'street', desc: '', args: []);
  }

  /// `Postal Code`
  String get postalCode {
    return Intl.message('Postal Code', name: 'postalCode', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `State`
  String get state {
    return Intl.message('State', name: 'state', desc: '', args: []);
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `Save Address`
  String get saveAddress {
    return Intl.message(
      'Save Address',
      name: 'saveAddress',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
