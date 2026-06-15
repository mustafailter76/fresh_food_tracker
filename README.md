# Fresh Food Tracker

Yiyeceklerinizi takip edin, son kullanma tarihlerini kontrol edin ve yiyecek israfını azaltın.

## Özellikler

- 🍎 **Buzdolabı**: 6 slotlu buzdolabı görünümü, renk kodlu son kullanma tarihi
- 🗑️ **Çöp Kutusu**: Çöpe atılan yiyeceklerin geçmişi ve istatistikleri
- 🍽️ **Mide**: Yenilen yiyeceklerin geçmişi ve istatistikleri
- ⚙️ **Ayarlar**: Koyu/açık tema, dil değiştirme (TR/EN), veritabanı sıfırlama

## Düzeltilen Sorunlar

- ✅ Tüm sayfalarda geri butonu eklendi (AppBar leading)
- ✅ `fridge_screen.dart` — `emptyFridge` metni yanlış yerde kullanılıyordu, düzeltildi
- ✅ `stomach_screen.dart` — `List<dynamic>` yerine `List<EatenHistoryModel>` kullanıldı
- ✅ `fridge_food_action_dialog.dart` — "Ye" butonu süresi geçmiş yiyecekte artık disabled
- ✅ `stat_card.dart` — İki ayrı dosya yerine tek dosya, `iconColor` parametresi eklendi
- ✅ `theme.dart` — Mixed relative/package imports düzeltildi; `secondaryContainer`/`errorContainer` eklendi
- ✅ `core/database/` — Relative importlar package importa çevrildi
- ✅ `core/l10n/` — Relative importlar package importa çevrildi
- ✅ `home_screen.dart` — `automaticallyImplyLeading: false` eklendi
- ✅ Buzdolabı UI — Gradient arka plan, cam efekti kartlar, daha iyi görünüm
- ✅ `trash_tile.dart` / `eaten_tile.dart` — Renkli CircleAvatar eklendi

## Kurulum

```yaml
dependencies:
  flutter_riverpod: ^2.5.1
  go_router: ^13.2.0
  sqflite: ^2.3.2
  path: ^1.9.0
  shared_preferences: ^2.2.3
  intl: ^0.19.0
```
