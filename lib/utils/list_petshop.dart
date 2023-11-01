import 'package:petopia/models/order_item.dart';
import 'package:petopia/models/petshop_item.dart';
import 'package:petopia/models/service_model.dart';

String description =
    "Selamat datang di Pet Shop Kalisari, destinasi utama untuk perawatan hewan peliharaan yang profesional dan kasih sayang tak terbatas. Kami adalah tujuan terpercaya bagi Anda yang mencintai hewan peliharaan Anda sebanyak keluarga..";

List<ServicePetshop> services = [
  ServicePetshop(
    serviceName: "Grooming",
    servicePrice: 135000,
  ),
  ServicePetshop(
    serviceName: "Emergency",
    servicePrice: 100000,
  ),
  ServicePetshop(
    serviceName: "Food",
    servicePrice: 74500,
  ),
  ServicePetshop(
    serviceName: "Hotel",
    servicePrice: 267300,
  ),
];

List<PetShopItem> listPetShop = [
  PetShopItem(
      petshopImage: 'assets/petshop.jpg',
      petshopName: 'Petshop Kalisari',
      petshopAddress: 'Jalan Rambutan 2, Jakarta Selatan, Indonesia',
      rating: 2,
      petshopDesc: description,
      services: [
        services[1],
        services[3],
      ]),
  PetShopItem(
      petshopImage: 'assets/petshop_2.jpeg',
      petshopName: 'Kitty Pet Shop',
      petshopAddress: 'Jalan Moh.Gobil 15, Jakarta Timur, Indonesia',
      rating: 4,
      petshopDesc: description,
      services: [
        services[0],
        services[3],
      ]),
  PetShopItem(
      petshopImage: 'assets/hospital.png',
      petshopName: 'Peduli Petshop',
      petshopAddress: 'Jalan Kalimantan Sukur, Tangerang, Indonesia',
      rating: 5,
      petshopDesc: description,
      services: [
        services[0],
        services[1],
        services[2],
      ]),
  PetShopItem(
      petshopImage: 'assets/bed.png',
      petshopName: 'Petshop Si Meong',
      petshopAddress:
          'Jalan Makmur Jaya Sentosa Rt 001 Rw 015, Kalimantan Selatan, Indonesia',
      rating: 4,
      petshopDesc: description,
      services: [
        services[0],
        services[1],
        services[2],
        services[3],
      ]),
  PetShopItem(
      petshopImage: 'assets/bone.png',
      petshopName: 'Akang Petshop',
      petshopAddress: 'Jalan Lembah Hijau 666, Depok, Indonesia',
      rating: 3,
      petshopDesc: description,
      services: [
        services[0],
        services[1],
        services[2],
      ]),
];

List<OrderItem> listPesananSaya = [
  OrderItem(
      petshopImage: 'assets/bed.png',
      orderame: 'Petshop Iyaiya',
      orderAddress: 'Jalan Rambutan 2, Jakarta Selatan, Indonesia',
      rating: 2,
      totalBiaya: 150000,
      services: [
        services[1],
        services[3],
      ]),
  OrderItem(
      petshopImage: 'assets/hospital.png',
      orderame: 'Peduli Petshop',
      orderAddress: 'Jalan Kalimantan Sukur, Tangerang, Indonesia',
      rating: 5,
      totalBiaya: 274500,
      services: [
        services[0],
        services[1],
        services[2],
      ]),
];

List<OrderItem> listPesananMasuk = [
  OrderItem(
      petshopImage: '',
      orderame: 'Petshop Si Meong',
      orderAddress:
          'Jalan Makmur Jaya Sentosa Rt 001 Rw 015, Kalimantan Selatan, Indonesia',
      rating: 4,
      totalBiaya: 376000,
      services: [
        services[0],
        services[1],
        services[2],
        services[3],
      ]),
  OrderItem(
      petshopImage: '',
      orderame: 'Akang Petshop',
      orderAddress: 'Jalan Lembah Hijau 666, Depok, Indonesia',
      rating: 3,
      totalBiaya: 155000,
      services: [
        services[0],
        services[1],
        services[2],
      ]),
];
