import 'package:petopia/models/service_model.dart';

class PetShopItem{
  final String petshopImage;
  final String petshopName;
  final String petshopAddress;
  final String petshopDesc;
  final int rating;
  final List<ServicePetshop> services;
  PetShopItem({
    required this.petshopImage,
    required this.petshopName,
    required this.petshopAddress,
    required this.petshopDesc,
    required this.rating,
    required this.services,
  });
}