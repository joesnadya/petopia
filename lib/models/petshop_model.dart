// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:petopia/theme.dart';

class PetShop extends StatelessWidget {
  final String imagePath;
  final String title;
  final String address;
  final int rating;
  final void Function() onTapDetail;

  const PetShop({
    required this.imagePath,
    required this.title,
    required this.address,
    required this.rating,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapDetail,
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(10),
        child: Card(
          // color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: bodytitle,
                      ),
                      Text(
                        address,
                        style: bodyStyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) {
                              return Icon(
                                index < rating ? Icons.star : Icons.star_border,
                                color: Colors.yellow,
                              );
                            },
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
      ),
    );
  }
}
