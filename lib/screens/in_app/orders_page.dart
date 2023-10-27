import 'package:flutter/material.dart';
import 'package:petopia/theme.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SafeArea(child: Text('ho')),
    );
  }
}