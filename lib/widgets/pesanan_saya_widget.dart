import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petopia/models/order_item.dart';
import 'package:petopia/widgets/card_pesanan_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PesananSayaWidget extends StatefulWidget {
  final List<OrderItem> listPesananSaya;
  const PesananSayaWidget({super.key, required this.listPesananSaya});

  @override
  State<PesananSayaWidget> createState() => _PesananSayaWidgetState();
}

class _PesananSayaWidgetState extends State<PesananSayaWidget> {
  List<OrderItem> listPesananSaya = [];

  @override
  void initState() {
    super.initState();
    getSavedOrders();
  }

  Future<void> getSavedOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final orderItemJsonList = prefs.getStringList('orders') ?? [];

    for (final orderItemJson in orderItemJsonList) {
      final orderItem = OrderItem.fromJson(
          Map<String, dynamic>.from(jsonDecode(orderItemJson)));
      listPesananSaya.add(orderItem);
    }
  }

  // Future<void> removeOrderFromSharedPreferences(int index) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final orderItemJsonList = prefs.getStringList('orders') ?? [];

  //   // Remove the order at the specified index
  //   if (index >= 0 && index < orderItemJsonList.length) {
  //     orderItemJsonList.removeAt(index);
  //     await prefs.setStringList('orders', orderItemJsonList);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: listPesananSaya.length,
      itemBuilder: (context, index) {
        final orderJson = listPesananSaya[index];

        // bool onFinish = false;
        return CardPesananWidget(
          dataOrder: orderJson,
          textButton: "Pelayanan Selesai",
          //  ontapButton: () {
          //   // Add code to remove the order when the "Pelayanan Selesai" button is pressed.
          //   removeOrderFromSharedPreferences(index);
          //   setState(() {
          //     listPesananSaya.removeAt(index);
          //   });
          // },
        );
      },
    );
  }
}
