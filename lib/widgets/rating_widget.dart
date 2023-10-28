// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingBarWidget({required Function(double v) onUpdateRating}) {
  return RatingBar.builder(
    initialRating: 0, // Initial rating value
    minRating: 0, // Minimum rating
    direction: Axis.horizontal,
    allowHalfRating: false, // Allow half ratings
    itemCount: 5, // Total number of rating stars
    itemSize: 30, // Size of each star
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
      print("Rating: $rating");
      onUpdateRating(rating);
    },
  );
}
