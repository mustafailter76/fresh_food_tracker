import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fresh Food Tracker'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @fridge.
  ///
  /// In en, this message translates to:
  /// **'Fridge'**
  String get fridge;

  /// No description provided for @trash.
  ///
  /// In en, this message translates to:
  /// **'Trash'**
  String get trash;

  /// No description provided for @stomach.
  ///
  /// In en, this message translates to:
  /// **'Stomach'**
  String get stomach;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @fridgeTitle.
  ///
  /// In en, this message translates to:
  /// **'My Fridge'**
  String get fridgeTitle;

  /// No description provided for @trashTitle.
  ///
  /// In en, this message translates to:
  /// **'Trash'**
  String get trashTitle;

  /// No description provided for @stomachTitle.
  ///
  /// In en, this message translates to:
  /// **'Eating History'**
  String get stomachTitle;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @addFood.
  ///
  /// In en, this message translates to:
  /// **'Add Food'**
  String get addFood;

  /// No description provided for @selectFood.
  ///
  /// In en, this message translates to:
  /// **'Select Food'**
  String get selectFood;

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry Date'**
  String get expiryDate;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @place.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get place;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @eat.
  ///
  /// In en, this message translates to:
  /// **'Eat'**
  String get eat;

  /// No description provided for @trash_action.
  ///
  /// In en, this message translates to:
  /// **'Throw Away'**
  String get trash_action;

  /// No description provided for @fresh.
  ///
  /// In en, this message translates to:
  /// **'Fresh'**
  String get fresh;

  /// No description provided for @expiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Expiring Soon'**
  String get expiringSoon;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @expiredWarning.
  ///
  /// In en, this message translates to:
  /// **'This food has expired! You cannot eat it.'**
  String get expiredWarning;

  /// No description provided for @eatSuccess.
  ///
  /// In en, this message translates to:
  /// **'Enjoy your meal! Food added to eating history.'**
  String get eatSuccess;

  /// No description provided for @trashSuccess.
  ///
  /// In en, this message translates to:
  /// **'Food moved to trash.'**
  String get trashSuccess;

  /// No description provided for @trashHistory.
  ///
  /// In en, this message translates to:
  /// **'Trash History'**
  String get trashHistory;

  /// No description provided for @eatenHistory.
  ///
  /// In en, this message translates to:
  /// **'Eating History'**
  String get eatenHistory;

  /// No description provided for @trashedOn.
  ///
  /// In en, this message translates to:
  /// **'Trashed on'**
  String get trashedOn;

  /// No description provided for @eatenOn.
  ///
  /// In en, this message translates to:
  /// **'Eaten on'**
  String get eatenOn;

  /// No description provided for @addedOn.
  ///
  /// In en, this message translates to:
  /// **'Added on'**
  String get addedOn;

  /// No description provided for @totalTrashed.
  ///
  /// In en, this message translates to:
  /// **'Total Trashed'**
  String get totalTrashed;

  /// No description provided for @lastTrashed.
  ///
  /// In en, this message translates to:
  /// **'Last Trashed'**
  String get lastTrashed;

  /// No description provided for @totalEaten.
  ///
  /// In en, this message translates to:
  /// **'Total Eaten'**
  String get totalEaten;

  /// No description provided for @lastEaten.
  ///
  /// In en, this message translates to:
  /// **'Last Eaten'**
  String get lastEaten;

  /// No description provided for @noneYet.
  ///
  /// In en, this message translates to:
  /// **'None yet'**
  String get noneYet;

  /// No description provided for @emptyTrash.
  ///
  /// In en, this message translates to:
  /// **'There are no items in the trash yet.'**
  String get emptyTrash;

  /// No description provided for @emptyStomach.
  ///
  /// In en, this message translates to:
  /// **'No food has been eaten yet.'**
  String get emptyStomach;

  /// No description provided for @emptyFridge.
  ///
  /// In en, this message translates to:
  /// **'The fridge is empty. Add some food!'**
  String get emptyFridge;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get themeMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @resetDatabase.
  ///
  /// In en, this message translates to:
  /// **'Reset Database'**
  String get resetDatabase;

  /// No description provided for @resetDatabaseConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? Fridge, stomach, and trash history will be deleted. Default foods will be kept.'**
  String get resetDatabaseConfirm;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, Reset'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @databaseReset.
  ///
  /// In en, this message translates to:
  /// **'Database reset successfully.'**
  String get databaseReset;

  /// No description provided for @expiresIn.
  ///
  /// In en, this message translates to:
  /// **'Expires in {days} days'**
  String expiresIn(int days);

  /// No description provided for @expiredDaysAgo.
  ///
  /// In en, this message translates to:
  /// **'Expired {days} days ago'**
  String expiredDaysAgo(int days);

  /// No description provided for @expiresToday.
  ///
  /// In en, this message translates to:
  /// **'Expires today!'**
  String get expiresToday;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @banana.
  ///
  /// In en, this message translates to:
  /// **'Banana'**
  String get banana;

  /// No description provided for @milk.
  ///
  /// In en, this message translates to:
  /// **'Milk'**
  String get milk;

  /// No description provided for @cheese.
  ///
  /// In en, this message translates to:
  /// **'Cheese'**
  String get cheese;

  /// No description provided for @egg.
  ///
  /// In en, this message translates to:
  /// **'Egg'**
  String get egg;

  /// No description provided for @honey.
  ///
  /// In en, this message translates to:
  /// **'Honey'**
  String get honey;

  /// No description provided for @watermelon.
  ///
  /// In en, this message translates to:
  /// **'Watermelon'**
  String get watermelon;

  /// No description provided for @bread.
  ///
  /// In en, this message translates to:
  /// **'Bread'**
  String get bread;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
