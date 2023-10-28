import 'package:petopia/models/order_item.dart';
import 'package:petopia/models/petshop_item.dart';
import 'package:petopia/models/service_model.dart';

String description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
      petshopImage: 'assets/bed.png',
      petshopName: 'Petshop Iyaiya',
      petshopAddress: 'Jalan Rambutan 2, Jakarta Selatan, Indonesia',
      rating: 2,
      petshopDesc: description,
      services: [
        services[1],
        services[3],
      ]),
  PetShopItem(
      petshopImage: 'assets/bone.png',
      petshopName: 'Petshop Kamu',
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
      petshopAddress: 'Jalan Aing Maung 666, Depok, Indonesia',
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
      orderAddress: 'Jalan Aing Maung 666, Depok, Indonesia',
      rating: 3,
      totalBiaya: 155000,
      services: [
        services[0],
        services[1],
        services[2],
      ]),
];
