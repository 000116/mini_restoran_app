class YemekModel {
  final int id;
  final String ad;
  final String kategori;
  final double fiyat;
  final String aciklama;
  final String gorsel;
  final List<String> malzemeler;
  final int hazirlamaSuresi;
  final double puan;

  YemekModel({
    required this.id,
    required this.ad,
    required this.kategori,
    required this.fiyat,
    required this.aciklama,
    required this.gorsel,
    required this.malzemeler,
    required this.hazirlamaSuresi,
    required this.puan,
  });

  factory YemekModel.fromJson(Map<String, dynamic> json) {
    return YemekModel(
      id: json['id'],
      ad: json['ad'],
      kategori: json['kategori'],
      fiyat: json['fiyat'].toDouble(),
      aciklama: json['aciklama'],
      gorsel: json['gorsel'],
      malzemeler: List<String>.from(json['malzemeler']),
      hazirlamaSuresi: json['hazirlamaSuresi'],
      puan: json['puan'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ad': ad,
      'kategori': kategori,
      'fiyat': fiyat,
      'aciklama': aciklama,
      'gorsel': gorsel,
      'malzemeler': malzemeler,
      'hazirlamaSuresi': hazirlamaSuresi,
      'puan': puan,
    };
  }
}
