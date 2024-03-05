import 'package:crud_dart/services/climbing_gear_service.dart';
import 'package:crud_dart/models/climbing_gear_model.dart';
import 'dart:io';

void main() {
  ClimbingGearService gearService = ClimbingGearService();
  var input = '';

  // Menu ya ges
  do {
    print("\nPilih operasi:");
    print("1. Tambah Barang Panjat");
    print("2. Lihat Daftar Barang Panjat");
    print("3. Update Status Peminjaman");
    print("4. Hapus Barang Panjat");
    print("5. Keluar");

    // Input dulu dung
    print("Masukkan pilihan Anda: ");
    input = stdin.readLineSync() ?? '';

    // sistem kerja nooo
    switch (input) {
      case '1':
        print("Masukkan nama barang panjat:");
        var itemName = stdin.readLineSync();
        if (itemName != null && itemName.isNotEmpty) {
          gearService.addGear(itemName);
          print("Barang panjat berhasil ditambahkan.");
        } else {
          print("Nama barang panjat tidak valid.");
        }
        break;

      case '2':
        List<ClimbingGear> gearList = gearService.getGearList();
        if (gearList.isEmpty) {
          print("Daftar Barang Panjat kosong.");
        } else {
          print("\nDaftar Barang Panjat:");
          for (var gear in gearList) {
            print(
                "${gear.id}. ${gear.itemName} - Dipinjam: ${gear.isBorrowed}");
          }
        }
        break;
      case '3':
        print("Masukkan ID barang panjat:");
        var id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) {
          print("Masukkan status peminjaman (true/false):");
          var isBorrowed = (stdin.readLineSync()?.toLowerCase() == 'true');
          gearService.updateGearStatus(id, isBorrowed);
          print("Status peminjaman berhasil diperbarui.");
        } else {
          print("ID tidak valid.");
        }
        break;
      case '4':
        print("Masukkan ID barang panjat:");
        var id = int.tryParse(stdin.readLineSync() ?? '');
        if (id != null) {
          gearService.deleteGear(id);
          print("Barang panjat berhasil dihapus.");
        } else {
          print("ID tidak valid.");
        }
        break;
      case '5':
        print("Terima kasih! Keluar dari program.");
        break;
      default:
        print("Pilihan tidak valid. Silakan coba lagi.");
    }
  } while (input != '5');
}
