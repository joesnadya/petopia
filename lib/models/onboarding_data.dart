class OnBoarding {
  String title;
  String subtitle;
  String image;

  OnBoarding({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

List<OnBoarding> onboardingContents = [
  OnBoarding(
    title: 'Get notified when\nwork happens',
    subtitle:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    image: 'assets/illustrasi_1.png',
  ),
  OnBoarding(
    title: 'Stay organized with\nproject and team',
    subtitle:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    image: 'assets/illustrasi_2.png',
  ),
  OnBoarding(
    title: 'Create tasks and\nassign them ',
    subtitle:
        'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
    image: 'assets/illustrasi_3.png',
  ),
  // OnBoarding(
  //   title: 'Track your work\nGet results!',
  //   subtitle:
  //       'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
  //   image: 'assets/illustrasi_3.png',
  // ),
];