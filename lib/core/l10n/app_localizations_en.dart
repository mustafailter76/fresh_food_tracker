// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Fresh Food Tracker';

  @override
  String get home => 'Home';

  @override
  String get fridge => 'Fridge';

  @override
  String get trash => 'Trash';

  @override
  String get stomach => 'Stomach';

  @override
  String get settings => 'Settings';

  @override
  String get fridgeTitle => 'My Fridge';

  @override
  String get trashTitle => 'Trash';

  @override
  String get stomachTitle => 'Eating History';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get addFood => 'Add Food';

  @override
  String get selectFood => 'Select Food';

  @override
  String get expiryDate => 'Expiry Date';

  @override
  String get selectDate => 'Select Date';

  @override
  String get place => 'Place';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get eat => 'Eat';

  @override
  String get trash_action => 'Throw Away';

  @override
  String get fresh => 'Fresh';

  @override
  String get expiringSoon => 'Expiring Soon';

  @override
  String get expired => 'Expired';

  @override
  String get expiredWarning => 'This food has expired! You cannot eat it.';

  @override
  String get eatSuccess => 'Enjoy your meal! Food added to eating history.';

  @override
  String get trashSuccess => 'Food moved to trash.';

  @override
  String get trashHistory => 'Trash History';

  @override
  String get eatenHistory => 'Eating History';

  @override
  String get trashedOn => 'Trashed on';

  @override
  String get eatenOn => 'Eaten on';

  @override
  String get addedOn => 'Added on';

  @override
  String get totalTrashed => 'Total Trashed';

  @override
  String get lastTrashed => 'Last Trashed';

  @override
  String get totalEaten => 'Total Eaten';

  @override
  String get lastEaten => 'Last Eaten';

  @override
  String get noneYet => 'None yet';

  @override
  String get emptyTrash => 'There are no items in the trash yet.';

  @override
  String get emptyStomach => 'No food has been eaten yet.';

  @override
  String get emptyFridge => 'The fridge is empty. Add some food!';

  @override
  String get themeMode => 'Dark Theme';

  @override
  String get language => 'Language';

  @override
  String get resetDatabase => 'Reset Database';

  @override
  String get resetDatabaseConfirm =>
      'Are you sure? Fridge, stomach, and trash history will be deleted. Default foods will be kept.';

  @override
  String get yes => 'Yes, Reset';

  @override
  String get no => 'No';

  @override
  String get databaseReset => 'Database reset successfully.';

  @override
  String expiresIn(int days) {
    return 'Expires in $days days';
  }

  @override
  String expiredDaysAgo(int days) {
    return 'Expired $days days ago';
  }

  @override
  String get expiresToday => 'Expires today!';

  @override
  String get apple => 'Apple';

  @override
  String get banana => 'Banana';

  @override
  String get milk => 'Milk';

  @override
  String get cheese => 'Cheese';

  @override
  String get egg => 'Egg';

  @override
  String get honey => 'Honey';

  @override
  String get watermelon => 'Watermelon';

  @override
  String get bread => 'Bread';
}
