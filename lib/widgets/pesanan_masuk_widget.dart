import 'package:flutter/material.dart';
import 'package:petopia/models/order_item.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:petopia/widgets/card_pesanan_widget.dart';

class PesananMasukWidget extends StatefulWidget {
  final List<OrderItem> listPesananMasuk;
  const PesananMasukWidget({super.key, required this.listPesananMasuk});

  @override
  State<PesananMasukWidget> createState() => _PesananMasukWidgetState();
}

class _PesananMasukWidgetState extends State<PesananMasukWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15),
      itemCount: widget.listPesananMasuk.length,
      itemBuilder: (context, index) {
        var data = widget.listPesananMasuk[index];
        return CardPesananWidget(
          dataOrder: data,
          textButton: "Batalkan Orderan",
          ontapButton: () {},
        );
      },
    );
  }
}
