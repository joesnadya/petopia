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

  Map<String, dynamic> toJson() {
    return {
      'petshopImage': petshopImage,
      'rating': rating,
      'totalBiaya': totalBiaya,
      'orderame': orderame,
      'orderAddress': orderAddress,
      'services': services.map((service) => service.toJson()).toList(),
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    final List<dynamic> servicesList = json['services'] ?? [];
    return OrderItem(
      petshopImage: json['petshopImage'],
      rating: json['rating'],
      totalBiaya: json['totalBiaya'],
      orderame: json['orderame'],
      orderAddress: json['orderAddress'],
      services: servicesList.map((serviceJson) => ServicePetshop.fromJson(serviceJson)).toList(),
    );
  }
}
