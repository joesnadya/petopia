import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petopia/screens/in_app/add_petshop.dart';
import 'package:petopia/screens/in_app/chatbot.dart';
import 'package:petopia/screens/in_app/detail_petshop.dart';
import 'package:petopia/screens/in_app/profile_page.dart';
import 'package:petopia/theme.dart';

import 'package:petopia/models/petshop_model.dart';
import 'package:petopia/utils/list_petshop.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Petopia',
                      style: GoogleFonts.lobster(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPurpleColor,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.chat_rounded,
                            color: kPurpleColor,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.person,
                            color: kPurpleColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfilePage(),
                              ),
                            );
                          },
                        ),
                        // IconButton(
                        //   icon: const Icon(
                        //     Icons.message,
                        //     color: kPurpleColor,
                        //   ),
                        //   onPressed: () {},
                        // ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kYellowColor.withOpacity(0.5),
                  ),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Hello", style: kSubtitleOnboarding),
                            const SizedBox(width: 3),
                            FutureBuilder<String?>(
                              future: SharedPreferences.getInstance()
                                  .then((prefs) => prefs.getString('name')),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else if (snapshot.hasData &&
                                    snapshot.data != null) {
                                  return Text(snapshot.data!,
                                      style: kTitleOnboarding);
                                } else {
                                  return Text("Username",
                                      style: kTitleOnboarding);
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text("Ready for an amazing and lucky experience",
                            style: kSubtitleOnboarding),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Services', style: kTitleOnboarding),
                const SizedBox(height: 20),
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2,
                  children: [
                    _buildCard('assets/shower.png', 'Grooming'),
                    _buildCard('assets/hospital.png', 'Emergency'),
                    _buildCard('assets/bone.png', 'Food'),
                    _buildCard('assets/bed.png', 'Hotel'),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Pet Shop', style: kTitleOnboarding),
                const SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listPetShop.length,
                    itemBuilder: (context, index) {
                      var petShop = listPetShop[index];
                      return PetShop(
                        imagePath: petShop.petshopImage,
                        title: petShop.petshopName,
                        address: petShop.petshopAddress,
                        rating: petShop.rating,
                        onTapDetail: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPetShopPage(
                                petshopData: petShop,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: SizedBox(
      //   width: 150,
      //   height: 50,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const ChatBotScreen(),
      //         ),
      //       );
      //     },
      //     backgroundColor: kPurpleColor,
      //     child: const Text(
      //       'CHAT BOT HERE',
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildCard(String imagePath, String text) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPurpleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
