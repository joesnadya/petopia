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
    title: 'Welcome to \npetopia',
    subtitle:
        'Pamper Your Pets with Professional Grooming Services',
    image: 'assets/illustrasi_1.png',
  ),
  OnBoarding(
    title: 'Keep your pet cleans with\nexpert groomers',
    subtitle:
        'Trust Our Experienced Groomers for Your Pets Care',
    image: 'assets/illustrasi_2.png',
  ),
  OnBoarding(
    title: 'Create orders and\nassign them ',
    subtitle:
        'Schedule Grooming Appointments with a Few Taps',
    image: 'assets/illustrasi_3.png',
  ),
  // OnBoarding(
  //   title: 'Track your work\nGet results!',
  //   subtitle:
  //       'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium',
  //   image: 'assets/illustrasi_3.png',
  // ),
];