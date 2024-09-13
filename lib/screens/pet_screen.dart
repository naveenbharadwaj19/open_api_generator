import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petstore_api/api.dart';
import '../controllers/pet_controller.dart';

class PetScreen extends StatelessWidget {
  final PetController petController = Get.put(PetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
        ),
        child: Obx(() {
          if (petController.error.isNotEmpty) {
            return Center(
              child: Text(
                petController.error.value,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          if (petController.pets.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blueGrey.shade700,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: petController.pets.length,
            itemBuilder: (context, index) {
              final pet = petController.pets[index];
              return GestureDetector(
                onTap: () {},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueGrey.shade200,
                        child: Icon(
                          Icons.pets,
                          color: Colors.blueGrey.shade700,
                          size: 30,
                        ),
                      ),
                      title: Text(
                        pet.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                      subtitle: Text(
                        'Status: ${pet.status.toString().split('.').last} \nID: ${pet.id}',
                        style: TextStyle(color: Colors.blueGrey.shade600),
                      ),
                      trailing: InkWell(
                        child: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                          size: 28,
                        ),
                        onTap: () {
                          _showDeleteConfirmationDialog(context, pet);
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, Pet pet) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return ScaleTransition(
          scale: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              'Delete Pet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text('Are you sure you want to delete pet "${pet.name}"?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<PetController>().deletePet(pet);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }
}
