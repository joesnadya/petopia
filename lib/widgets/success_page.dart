import 'package:flutter/material.dart';
import 'package:petopia/navbar.dart';
import 'package:petopia/theme.dart';
import 'package:petopia/widgets/button_widget.dart';

class SuccessPage extends StatelessWidget {
  final String content;
  const SuccessPage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(18),
          decoration: const BoxDecoration(
            color: kPurpleColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: kDarkWhiteColor,
                size: 100,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Berhasil",
                style: kTitleOnboarding.copyWith(
                  color: kDarkWhiteColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                content,
                style: bodyStyle.copyWith(
                  color: kDarkWhiteColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              buttonWidget(
                context,
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NavBar()),
                    (route) => false,
                  );
                },
                colorButton: kDarkWhiteColor,
                colorText: kPurpleColor,
                textButton: "Kembali ke halaman Home",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
