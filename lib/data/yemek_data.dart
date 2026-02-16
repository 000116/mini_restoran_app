import '../models/yemek_model.dart';

class YemekData {
  static List<YemekModel> tumYemekler = [
    YemekModel(
      id: 1,
      ad: 'İskender Kebap',
      kategori: 'Ana Yemek',
      fiyat: 180.0,
      aciklama: 'Yoğurt üzerine tereyağı ve domates soslu özel izgara et dilimlerimiz',
      gorsel: '🥙',
      malzemeler: ['Dana Et', 'Yoğurt', 'Pide', 'Tereyağı', 'Domates Sosu'],
      hazirlamaSuresi: 25,
      puan: 4.8,
    ),
    YemekModel(
      id: 2,
      ad: 'Adana Kebap',
      kategori: 'Ana Yemek',
      fiyat: 165.0,
      aciklama: 'Özel baharatlarla hazırlanmış acılı kıyma kebabımız',
      gorsel: '🍢',
      malzemeler: ['Dana Kıyma', 'Biber', 'Baharatlar', 'Bulgur Pilavı'],
      hazirlamaSuresi: 20,
      puan: 4.7,
    ),
    YemekModel(
      id: 3,
      ad: 'Tavuk Şiş',
      kategori: 'Ana Yemek',
      fiyat: 145.0,
      aciklama: 'Marine edilmiş tavuk göğüs parçalarından izgara şiş',
      gorsel: '🍗',
      malzemeler: ['Tavuk Göğsü', 'Soğan', 'Limon', 'Baharatlar'],
      hazirlamaSuresi: 18,
      puan: 4.6,
    ),
    YemekModel(
      id: 4,
      ad: 'Mantı',
      kategori: 'Ana Yemek',
      fiyat: 135.0,
      aciklama: 'El açması hamur içinde özel kıymalı mantımız, yoğurt ve tereyağı ile',
      gorsel: '🥟',
      malzemeler: ['Hamur', 'Dana Kıyma', 'Yoğurt', 'Sarımsak', 'Tereyağı'],
      hazirlamaSuresi: 30,
      puan: 4.9,
    ),
    YemekModel(
      id: 5,
      ad: 'Margarita Pizza',
      kategori: 'Pizza',
      fiyat: 120.0,
      aciklama: 'Mozzarella peyniri, domates sosu ve fesleğen',
      gorsel: '🍕',
      malzemeler: ['Mozzarella', 'Domates Sosu', 'Fesleğen', 'Hamur'],
      hazirlamaSuresi: 15,
      puan: 4.5,
    ),
    YemekModel(
      id: 6,
      ad: 'Karışık Pizza',
      kategori: 'Pizza',
      fiyat: 155.0,
      aciklama: 'Sucuk, sosis, mısır, mantar ve zeytinli pizza',
      gorsel: '🍕',
      malzemeler: ['Sucuk', 'Sosis', 'Mısır', 'Mantar', 'Zeytin', 'Kaşar'],
      hazirlamaSuresi: 15,
      puan: 4.6,
    ),
    YemekModel(
      id: 7,
      ad: 'Künefe',
      kategori: 'Tatlı',
      fiyat: 95.0,
      aciklama: 'Tel kadayıf arası özel peynirli, üzeri fıstıklı tatlımız',
      gorsel: '🧀',
      malzemeler: ['Tel Kadayıf', 'Peynir', 'Şerbet', 'Antep Fıstığı'],
      hazirlamaSuresi: 12,
      puan: 4.9,
    ),
    YemekModel(
      id: 8,
      ad: 'Baklava',
      kategori: 'Tatlı',
      fiyat: 85.0,
      aciklama: 'Fıstıklı geleneksel Türk baklavası',
      gorsel: '🥮',
      malzemeler: ['Yufka', 'Antep Fıstığı', 'Tereyağı', 'Şerbet'],
      hazirlamaSuresi: 10,
      puan: 4.8,
    ),
    YemekModel(
      id: 9,
      ad: 'Sütlaç',
      kategori: 'Tatlı',
      fiyat: 55.0,
      aciklama: 'Fırında pişmiş geleneksel sütlaç',
      gorsel: '🍮',
      malzemeler: ['Süt', 'Pirinç', 'Şeker', 'Tarçın'],
      hazirlamaSuresi: 8,
      puan: 4.7,
    ),
    YemekModel(
      id: 10,
      ad: 'Türk Kahvesi',
      kategori: 'İçecek',
      fiyat: 35.0,
      aciklama: 'Özel çekirdeklerden hazırlanan geleneksel Türk kahvesi',
      gorsel: '☕',
      malzemeler: ['Kahve', 'Su'],
      hazirlamaSuresi: 5,
      puan: 4.6,
    ),
    YemekModel(
      id: 11,
      ad: 'Ayran',
      kategori: 'İçecek',
      fiyat: 15.0,
      aciklama: 'Ev yapımı soğuk ayran',
      gorsel: '🥛',
      malzemeler: ['Yoğurt', 'Su', 'Tuz'],
      hazirlamaSuresi: 2,
      puan: 4.5,
    ),
    YemekModel(
      id: 12,
      ad: 'Taze Sıkılmış Portakal Suyu',
      kategori: 'İçecek',
      fiyat: 45.0,
      aciklama: 'Taze portakallardan sıkılmış doğal meyve suyu',
      gorsel: '🍊',
      malzemeler: ['Portakal'],
      hazirlamaSuresi: 3,
      puan: 4.7,
    ),
  ];

  static List<YemekModel> kategoriFiltrele(String kategori) {
    if (kategori == 'Tümü') {
      return tumYemekler;
    }
    return tumYemekler.where((yemek) => yemek.kategori == kategori).toList();
  }

  static List<String> tumKategoriler() {
    List<String> kategoriler = ['Tümü'];
    for (var yemek in tumYemekler) {
      if (!kategoriler.contains(yemek.kategori)) {
        kategoriler.add(yemek.kategori);
      }
    }
    return kategoriler;
  }

  static YemekModel? idIleYemekBul(int id) {
    try {
      return tumYemekler.firstWhere((yemek) => yemek.id == id);
    } catch (e) {
      return null;
    }
  }
}
