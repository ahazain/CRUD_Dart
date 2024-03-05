// lib/services/climbing_gear_service.dart

import 'package:instalasi_tue/models/climbing_gear_model.dart';

class ClimbingGearService {
  List<ClimbingGear> gearList = [];

  void addGear(String itemName) {
    int id = gearList.length + 1;
    gearList.add(ClimbingGear(id: id, itemName: itemName, isBorrowed: false));
  }

  List<ClimbingGear> getGearList() {
    return gearList;
  }

  void updateGearStatus(int id, bool isBorrowed) {
    ClimbingGear? gear = gearList.firstWhere((element) => element.id == id,
        orElse: () => ClimbingGear(id: -1, itemName: "", isBorrowed: false));

    if (gear.id != -1) {
      gear.isBorrowed = isBorrowed;
      print("Status peminjaman ${gear.itemName} berhasil diperbarui.");
    } else {
      print("Barang tidak ditemukan.");
    }
  }

  void deleteGear(int id) {
    gearList.removeWhere((gear) => gear.id == id);
    print("Barang berhasil dihapus.");
  }
}
