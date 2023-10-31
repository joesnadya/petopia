import 'package:flutter/material.dart';
import 'package:petopia/widgets/pesanan_masuk_widget.dart';
import 'package:petopia/widgets/pesanan_saya_widget.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/utils/list_petshop.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int screenSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkWhiteColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Column(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kPurpleColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              screenSelected = 0;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Pesanan Saya",
                                  style: bodyStyle.copyWith(
                                    color: kDarkWhiteColor,
                                  ),
                                ),
                                Visibility(
                                  visible: screenSelected == 0 ? true : false,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: kDarkWhiteColor,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: kDarkWhiteColor,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              screenSelected = 1;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Pesanan Masuk",
                                  style: bodyStyle.copyWith(
                                    color: kDarkWhiteColor,
                                  ),
                                ),
                                Visibility(
                                  visible: screenSelected == 1 ? true : false,
                                  child: const Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.circle,
                                      color: kDarkWhiteColor,
                                      size: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: screenSelected == 0
                    ? PesananSayaWidget(
                        listPesananSaya: listPesananSaya,
                      )
                    : PesananMasukWidget(
                        listPesananMasuk: listPesananMasuk,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
