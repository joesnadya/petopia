import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petopia/models/petshop_item.dart';
import 'package:petopia/models/service_model.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/utils/convert_rupiah.dart';
import 'package:petopia/utils/get_location.dart';
import 'package:petopia/widgets/bubble_widget.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:petopia/widgets/popup_widget.dart';
import 'package:petopia/widgets/success_page.dart';

class DetailPemesananWidget extends StatefulWidget {
  final PetShopItem petshopData;
  const DetailPemesananWidget({
    super.key,
    required this.petshopData,
  });

  @override
  State<DetailPemesananWidget> createState() => _DetailPemesananWidgetState();
}

class _DetailPemesananWidgetState extends State<DetailPemesananWidget> {
  List<ServicePetshop> listServiceSelected = [];
  TextEditingController alamatController = TextEditingController();
  double totalBiayaService = 0;
  double biayaPengiriman = 15000;
  Position? position;

  Future<String> getAddress(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String address =
          '${placemark.thoroughfare}, ${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}';
      setState(() {
        alamatController.text = address;
      });
      return address;
    } else {
      return 'Address not found';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tag Lokasi Anda",
          style: bodytitle,
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () async {
            position = await getPosition();

            setState(() {
              getAddress(
                position?.latitude ?? 0,
                position?.longitude ?? 0,
              );
            });
          },
          child: TextFormField(
            controller: alamatController,
            enabled: false,
            decoration: InputDecoration(
              labelText: 'Tag Lokasi Anda',
              prefixIcon: const Icon(Icons.location_history),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: kLightBlackColor),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Pilih Service",
          style: bodytitle,
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: widget.petshopData.services.map(
            (e) {
              bool isSelected = listServiceSelected.contains(e);
              return InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      listServiceSelected.remove(e);
                      if (totalBiayaService > 0) {
                        totalBiayaService -= e.servicePrice;
                      }
                    } else {
                      listServiceSelected.add(e);
                      totalBiayaService += e.servicePrice;
                    }
                  });
                },
                child: bubbleWidget(
                  e.serviceName,
                  isSelected: isSelected,
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "Rincian Harga",
          style: bodytitle,
        ),
        const SizedBox(
          height: 15,
        ),
        rincianHargaWidget(),
        const SizedBox(
          height: 25,
        ),
        buttonWidget(
          context,
          onTap: () {
            if (listServiceSelected.isNotEmpty) {
              // Logic Shared Preference
              //

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SuccessPage(
                    content:
                        "Berhasil melakukan pemesanan. Pesanan kamu akan diproses.",
                  ),
                ),
              );
            } else {
              showPopup(
                context,
                title: "Perhatian",
                content: "Pilih service yang ingin dipesan terlebih dahulu.",
                ontap: () {
                  Navigator.pop(context);
                },
              );
            }
          },
          textButton: "Pesan",
        ),
      ],
    );
  }

  Widget rincianHargaWidget() {
    return Column(
      children: [
        rincianHarga(
          namaRincian: "Biaya service",
          harga: totalBiayaService,
        ),
        rincianHarga(
          namaRincian: "Biaya Pengiriman",
          harga: biayaPengiriman,
        ),
        const Divider(
          thickness: 2,
        ),
        rincianHarga(
          namaRincian: "Biaya Pengiriman",
          harga: biayaPengiriman + totalBiayaService,
        ),
      ],
    );
  }

  Widget rincianHarga({required String namaRincian, required double harga}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            namaRincian,
            style: bodyStyle,
          ),
          Text(
            stringtoRupiah(harga),
            style: bodyStyle,
          ),
        ],
      ),
    );
  }
}
