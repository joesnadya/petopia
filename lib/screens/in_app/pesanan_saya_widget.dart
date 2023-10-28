import 'package:flutter/material.dart';
import 'package:petopia/models/order_item.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:petopia/widgets/card_pesanan_widget.dart';
import 'package:petopia/widgets/rating_widget.dart';

class PesananSayaWidget extends StatefulWidget {
  final List<OrderItem> listPesananSaya;
  const PesananSayaWidget({super.key, required this.listPesananSaya});

  @override
  State<PesananSayaWidget> createState() => _PesananSayaWidgetState();
}

class _PesananSayaWidgetState extends State<PesananSayaWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: widget.listPesananSaya.length,
      itemBuilder: (context, index) {
        var data = widget.listPesananSaya[index];

        bool onFinish = false;
        return CardPesananWidget(
          dataOrder: data,
          textButton: "Pelayanan Selesai",
        );
      },
    );
  }
}
