import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:petopia/models/service_model.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/utils/get_location.dart';
import 'package:petopia/utils/image_picker.dart';
import 'package:petopia/utils/list_petshop.dart';
import 'package:petopia/widgets/bubble_widget.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:petopia/widgets/popup_widget.dart';
import 'package:petopia/widgets/success_page.dart';

class AddPetShopPage extends StatefulWidget {
  const AddPetShopPage({super.key});

  @override
  State<AddPetShopPage> createState() => _AddPetShopPageState();
}

class _AddPetShopPageState extends State<AddPetShopPage> {
  String? selectedFoto;
  List<ServicePetshop> listServiceSelected = [];
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController descController = TextEditingController();

  bool isComplete = false;

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

  checker() {
    if (selectedFoto != null &&
        listServiceSelected.isNotEmpty &&
        namaController.text != "" &&
        alamatController.text != "" &&
        descController.text != "") {
      setState(() {
        isComplete = true;
      });
    } else {
      setState(() {
        isComplete = false;
      });
    }
  }

  final String _baseUrl =
      "https://emsifa.github.io/api-wilayah-indonesia/api/provinces.json";
  String? _selectedProvinceId;
  String _selectedProvinceName = "Select Province";
  List<Map<String, dynamic>> _dataProvince = [];

  void getProvince() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      var listData = jsonDecode(response.body);
      setState(() {
        _dataProvince = List<Map<String, dynamic>>.from(listData);
      });
      print("data : $listData");
    } else {
      // Handle the case where the API returned an error
      print("API Error: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    super.initState();
    getProvince();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: kPurpleColor,
          title: const Text(
            "Tambah Pet Shop Anda",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   "Tambah Pet Shop Anda",
                //   style: bodytitle,
                // ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    pickImageFromGallery(
                      onSelect: (v) {
                        setState(() {
                          selectedFoto = v;
                        });
                      },
                    );
                  },
                  child: selectedFoto == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    style: BorderStyle.solid,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add_a_photo,
                                  ),
                                )),
                          ],
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(selectedFoto ?? ""),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: namaController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Pet Shop',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kLightBlackColor),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: DropdownButton<String>(
                      hint: Text(_selectedProvinceName),
                      value: _selectedProvinceId,
                      underline: Container(),
                      items: _dataProvince.map((item) {
                        return DropdownMenuItem<String>(
                          value: item['id'].toString(),
                          child: Text(item['name']),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        final selectedProvince = _dataProvince.firstWhere(
                          (item) => item['id'].toString() == value,
                          orElse: () => {'name': "Select Province", 'id': -1},
                        );
                        setState(() {
                          _selectedProvinceId = value;
                          _selectedProvinceName = selectedProvince['name'];
                        });
                      },
                    ),
                  ),
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
                      labelText: 'Tag Lokasi Pet Shopmu',
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
                TextFormField(
                  controller: descController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kLightBlackColor),
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
                  children: services.map(
                    (e) {
                      bool isSelected = listServiceSelected.contains(e);
                      return InkWell(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              listServiceSelected.remove(e);
                            } else {
                              listServiceSelected.add(e);
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
                  height: 35,
                ),
                buttonWidget(
                  context,
                  onTap: () {
                    checker();
                    if (isComplete == true) {
                      // Logic Shared Preference
                      //
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuccessPage(
                            content:
                                "Selamat! berhasil menambahkan Pet Shop anda.",
                          ),
                        ),
                        (route) => false,
                      );
                    } else {
                      showPopup(
                        context,
                        title: "Perhatian",
                        content: "Harap lengkapi semua data terlebih dahulu.",
                        ontap: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                  textButton: "Tambah Pet Shop",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
