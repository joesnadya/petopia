// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:petopia/models/petshop_item.dart';
import 'package:petopia/models/service_model.dart';
import 'package:petopia/screens/in_app/detail_pemesanan.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/widgets/bubble_widget.dart';
import 'package:petopia/widgets/button_widget.dart';

class DetailPetShopPage extends StatefulWidget {
  final PetShopItem petshopData;
  const DetailPetShopPage({
    super.key,
    required this.petshopData,
  });

  @override
  State<DetailPetShopPage> createState() => _DetailPetShopPageState();
}

class _DetailPetShopPageState extends State<DetailPetShopPage> {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Image.asset(
                widget.petshopData.petshopImage,
                width: MediaQuery.of(context).size.width,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 25, 18, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.petshopData.petshopName,
                      style: kTitleOnboarding,
                    ),
                    Text(
                      widget.petshopData.petshopAddress,
                      style: bodyStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              index < widget.petshopData.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.yellow,
                            );
                          },
                        ),
                      ),
                    ),
                    Text(
                      widget.petshopData.petshopDesc,
                      style: bodyStyle,
                      textAlign: TextAlign.justify,
                    ),
                    Visibility(
                      visible:
                          widget.petshopData.services.isEmpty ? false : true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: widget.petshopData.services
                              .map(
                                (e) => bubbleWidget(e.serviceName),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: buttonWidget(
          context,
          onTap: () {
            modalPesanPetShop(
              context,
              petshopData: widget.petshopData,
            );
          },
          textButton: "Pesan Sekarang",
          circularButton: 0,
        ),
      ),
    );
  }
}

modalPesanPetShop(context, {required PetShopItem petshopData}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, modalState) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(18, 20, 18, 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              height: MediaQuery.of(context).size.height / 1.3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.close),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          "Detail Pemesanan",
                          style: bodytitle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  // Body Pemesanan
                  DetailPemesananWidget(petshopData: petshopData),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
