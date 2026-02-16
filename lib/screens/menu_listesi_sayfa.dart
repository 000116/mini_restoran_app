import 'package:flutter/material.dart';
import '../models/yemek_model.dart';
import '../data/yemek_data.dart';
import '../widgets/yemek_kart.dart';
import '../widgets/kategori_chip.dart';
import 'yemek_detay_sayfa.dart';
import 'sepet_sayfa.dart';

// Menü listesi ve kategori filtreleme sayfası
class MenuListesiSayfa extends StatefulWidget {
  const MenuListesiSayfa({super.key});

  @override
  State<MenuListesiSayfa> createState() => _MenuListesiSayfaState();
}

class _MenuListesiSayfaState extends State<MenuListesiSayfa> {
  String _seciliKategori = 'Tümü';
  final List<YemekModel> _sepet = [];

  @override
  Widget build(BuildContext context) {
    // Seçili kategoriye göre filtrelenmiş yemekler
    List<YemekModel> filtrelenmisYemekler =
        YemekData.kategoriFiltrele(_seciliKategori);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Menümüz',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          // Sepet butonu
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black87),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SepetSayfa(sepetListesi: _sepet),
                    ),
                  );
                },
              ),
              if (_sepet.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: Text(
                      '${_sepet.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hoş geldiniz mesajı
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Size ne sunabiliriz?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${filtrelenmisYemekler.length} lezzetli seçenek',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          
          // Kategori filtreleri
          Container(
            height: 60,
            color: Colors.white,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              scrollDirection: Axis.horizontal,
              itemCount: YemekData.tumKategoriler().length,
              itemBuilder: (context, index) {
                String kategori = YemekData.tumKategoriler()[index];
                return KategoriChip(
                  kategori: kategori,
                  seciliMi: _seciliKategori == kategori,
                  onTap: () {
                    setState(() {
                      _seciliKategori = kategori;
                    });
                  },
                );
              },
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Yemek listesi (GridView)
          Expanded(
            child: filtrelenmisYemekler.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant_menu,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Bu kategoride yemek bulunamadı',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: filtrelenmisYemekler.length,
                    itemBuilder: (context, index) {
                      YemekModel yemek = filtrelenmisYemekler[index];
                      return YemekKart(
                        yemek: yemek,
                        onTap: () async {
                          // Detay sayfasına git ve sepete ekleme sonucunu al
                          final sonuc = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => YemekDetaySayfa(
                                yemek: yemek,
                              ),
                            ),
                          );
                          
                          // Eğer sepete eklendi ise state'i güncelle
                          if (sonuc == true) {
                            setState(() {
                              _sepet.add(yemek);
                            });
                            
                            // Başarı mesajı göster
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${yemek.ad} sepete eklendi'),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.green,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
