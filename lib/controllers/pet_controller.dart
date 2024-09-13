
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:petstore_api/api.dart';

class PetController extends GetxController {
  final petApi = PetApi();
  final pets = <Pet>[].obs;
  final error = "".obs;

  @override
  void onInit() {
    fetchPets();
    super.onInit();
  }

  Future<void> fetchPets() async {
    try {
      var response = await petApi.findPetsByStatus(status: "available");

      pets.addAll(response ?? []);
    } catch (e) {
      error.value = "Error fetching pets: $e";
    }
  }

  Future<void> deletePet(Pet petData) async {
    try {
      var res = await petApi.deletePetWithHttpInfo(petData.id!,
          apiKey: dotenv.env["API_KEY"]); // API KEY
      print(res.statusCode);
      pets.removeWhere((e) => e.id == petData.id);
      pets.refresh();
    } catch (e) {
      print(e);
      error.value = 'Failed to update pet: $e';
    }
  }
}
