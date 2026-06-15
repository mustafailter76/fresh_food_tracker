// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Taze Yiyecek Takipçisi';

  @override
  String get home => 'Ana Sayfa';

  @override
  String get fridge => 'Buzdolabı';

  @override
  String get trash => 'Çöp Kutusu';

  @override
  String get stomach => 'Mide';

  @override
  String get settings => 'Ayarlar';

  @override
  String get fridgeTitle => 'Buzdolabım';

  @override
  String get trashTitle => 'Çöp Kutusu';

  @override
  String get stomachTitle => 'Yeme Geçmişi';

  @override
  String get settingsTitle => 'Ayarlar';

  @override
  String get addFood => 'Yiyecek Ekle';

  @override
  String get selectFood => 'Yiyecek Seç';

  @override
  String get expiryDate => 'Son Kullanma Tarihi';

  @override
  String get selectDate => 'Tarih Seç';

  @override
  String get place => 'Koy';

  @override
  String get cancel => 'İptal';

  @override
  String get confirm => 'Onayla';

  @override
  String get eat => 'Ye';

  @override
  String get trash_action => 'Çöpe At';

  @override
  String get fresh => 'Taze';

  @override
  String get expiringSoon => 'Yakında Bitiyor';

  @override
  String get expired => 'Süresi Geçti';

  @override
  String get expiredWarning =>
      'Bu yiyeceğin son kullanma tarihi geçmiş! Yiyemezsiniz.';

  @override
  String get eatSuccess => 'Afiyet olsun! Yiyecek mide geçmişine eklendi.';

  @override
  String get trashSuccess => 'Yiyecek çöpe atıldı.';

  @override
  String get trashHistory => 'Çöp Geçmişi';

  @override
  String get eatenHistory => 'Yeme Geçmişi';

  @override
  String get trashedOn => 'Çöpe atılma tarihi';

  @override
  String get eatenOn => 'Yenilme tarihi';

  @override
  String get addedOn => 'Eklenme tarihi';

  @override
  String get totalTrashed => 'Toplam Çöpe Atılan';

  @override
  String get lastTrashed => 'Son Çöpe Atılan';

  @override
  String get totalEaten => 'Toplam Yenilen';

  @override
  String get lastEaten => 'Son Yenilen';

  @override
  String get noneYet => 'Henüz yok';

  @override
  String get emptyTrash => 'Çöp kutusunda henüz öğe yok.';

  @override
  String get emptyStomach => 'Henüz yiyecek yenilmedi.';

  @override
  String get emptyFridge => 'Buzdolabı boş. Yiyecek ekleyin!';

  @override
  String get themeMode => 'Koyu Tema';

  @override
  String get language => 'Dil';

  @override
  String get resetDatabase => 'Veritabanını Sıfırla';

  @override
  String get resetDatabaseConfirm =>
      'Emin misiniz? Buzdolabı, mide ve çöp geçmişi silinecek. Varsayılan yiyecekler korunacak.';

  @override
  String get yes => 'Evet, Sıfırla';

  @override
  String get no => 'Hayır';

  @override
  String get databaseReset => 'Veritabanı başarıyla sıfırlandı.';

  @override
  String expiresIn(int days) {
    return '$days gün sonra bitiyor';
  }

  @override
  String expiredDaysAgo(int days) {
    return '$days gün önce bitti';
  }

  @override
  String get expiresToday => 'Bugün bitiyor!';

  @override
  String get apple => 'Elma';

  @override
  String get banana => 'Muz';

  @override
  String get milk => 'Süt';

  @override
  String get cheese => 'Peynir';

  @override
  String get egg => 'Yumurta';

  @override
  String get honey => 'Bal';

  @override
  String get watermelon => 'Karpuz';

  @override
  String get bread => 'Ekmek';
}
