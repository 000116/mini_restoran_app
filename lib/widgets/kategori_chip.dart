import 'package:flutter/material.dart';

// Kategori seçimi için özel chip widget'ı
class KategoriChip extends StatelessWidget {
  final String kategori;
  final bool seciliMi;
  final VoidCallback onTap;

  const KategoriChip({
    super.key,
    required this.kategori,
    required this.seciliMi,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: seciliMi ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
          boxShadow: seciliMi
              ? [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Text(
          kategori,
          style: TextStyle(
            color: seciliMi ? Colors.white : Colors.black87,
            fontWeight: seciliMi ? FontWeight.bold : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
