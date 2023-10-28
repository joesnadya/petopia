import 'package:petopia/models/service_model.dart';

class OrderItem {
  final String petshopImage;

  final int rating;
  final int? totalBiaya;
  final String? orderame;
  final String? orderAddress;
  final List<ServicePetshop> services;
  OrderItem({
    required this.petshopImage,
    required this.rating,
    this.totalBiaya,
    this.orderame,
    this.orderAddress,
    required this.services,
  });
}
