import 'package:flutter/material.dart';
import 'package:petopia/models/order_item.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/utils/convert_rupiah.dart';
import 'package:petopia/widgets/bubble_widget.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:petopia/widgets/rating_widget.dart';

class CardPesananWidget extends StatefulWidget {
  final OrderItem dataOrder;
  final String textButton;
  final void Function()? ontapButton;

  const CardPesananWidget({
    super.key,
    required this.dataOrder,
    required this.textButton,
    this.ontapButton,
  });

  @override
  State<CardPesananWidget> createState() => _CardPesananWidgetState();
}

class _CardPesananWidgetState extends State<CardPesananWidget> {
  int ratingPerItem = 0;
  bool onFinish = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: <Widget>[
                Visibility(
                  visible: (widget.dataOrder.petshopImage == "") ? false : true,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(widget.dataOrder.petshopImage,
                        fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.dataOrder.orderame ?? "",
                          style: bodytitle,
                        ),
                        Text(
                          widget.dataOrder.orderAddress ?? '',
                          style: bodyStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Harga: ${stringtoRupiah(widget.dataOrder.totalBiaya)}",
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.dataOrder.services.map(
                      (e) {
                        return bubbleWidget(
                          e.serviceName,
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  onFinish == true
                      ? ratingBarWidget(
                          onUpdateRating: (rating) {
                            setState(() {
                              ratingPerItem = rating.round();
                            });
                          },
                        )
                      : buttonWidget(
                          context,
                          onTap: widget.ontapButton ??
                              () {
                                setState(() {
                                  onFinish = true;
                                });
                              },
                          textButton: widget.textButton,
                        ),
                  // widget.showWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}