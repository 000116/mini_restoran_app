# 🍽️ Mini Restoran Uygulaması

Flutter ile geliştirilmiş modern restoran menü uygulaması.

## 🚀 Kurulum

1. Flutter SDK'nın kurulu olduğundan emin olun:
```bash
flutter --version
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## 📱 Özellikler

- ✅ Ana Sayfa - Hoş geldiniz ekranı
- ✅ Menü Listesi - GridView ile yemek kartları
- ✅ Kategori Filtreleme - Ana Yemek, Pizza, Tatlı, İçecek
- ✅ Yemek Detayı - Malzemeler ve açıklama
- ✅ Sepet Sistemi - Ürün ekleme/çıkarma

## 🎯 Proje Yapısı

```
lib/
├── main.dart                    # Uygulama giriş noktası
├── models/
│   └── yemek_model.dart        # Veri modeli
├── data/
│   └── yemek_data.dart         # Örnek veriler
├── screens/
│   ├── ana_sayfa.dart          # Ana sayfa
│   ├── menu_listesi_sayfa.dart # Menü listesi
│   ├── yemek_detay_sayfa.dart  # Detay sayfası
│   └── sepet_sayfa.dart        # Sepet
└── widgets/
    ├── kategori_chip.dart      # Kategori chip
    └── yemek_kart.dart         # Yemek kartı
```

## 📚 Öğrenilen Konular

- Widget yapısı
- Navigator ve routing
- StatefulWidget
- GridView ve ListView
- State management
- Custom widgets

## 🎨 Ekran Görüntüleri

Uygulama modern gradient tasarım, card-based layout ve Material Design 3 ile geliştirilmiştir.

## 📄 Lisans

Eğitim amaçlı proje - Serbestçe kullanılabilir
