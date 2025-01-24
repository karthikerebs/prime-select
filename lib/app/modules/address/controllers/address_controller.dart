import 'package:get/get.dart';

class AddressController extends GetxController {
  final RxList<AddressModel> addresses = <AddressModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Load dummy addresses
    addresses.addAll([
      AddressModel(
        type: 'House',
        address: '2118 Thornridge Cir. Syracuse, Connecticut 35624',
      ),
      AddressModel(
        type: 'House',
        address: '2118 Thornridge Cir. Syracuse, Connecticut 35624',
      ),
    ]);
  }

  void deleteAddress(int index) {
    addresses.removeAt(index);
  }
}

class AddressModel {
  final String type;
  final String address;

  AddressModel({
    required this.type,
    required this.address,
  });
}
