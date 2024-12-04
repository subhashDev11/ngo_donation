import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_grid_count_view/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import 'firestore_service.dart';

class DonationSliderModel {
  final String image;
  final String title;
  final String content;

  const DonationSliderModel({
    required this.image,
    required this.title,
    required this.content,
  });
}

const List<DonationSliderModel> donationSliders = [
  DonationSliderModel(
      image: 'assets/miss/1.jpg',
      title: 'Support Clean Water Initiatives',
      content:
          'Your donation helps provide clean and safe drinking water to communities in need around the world.'),
  DonationSliderModel(
      image: 'assets/miss/2.jpg',
      title: 'Empower Education for All',
      content:
          'Contribute to educational programs that give children in underserved areas access to quality education.'),
  DonationSliderModel(
      image: 'assets/miss/3.jpg',
      title: 'Feed the Hungry',
      content:
          'Help us combat hunger by supporting food distribution programs in impoverished regions.'),
  DonationSliderModel(
      image: 'assets/miss/4.jpg',
      title: 'Aid Disaster Relief Efforts',
      content:
          'Your generosity aids rapid response efforts, providing relief to those affected by natural disasters.'),
  DonationSliderModel(
      image: 'assets/miss/5.jpg',
      title: 'Protect Wildlife Habitats',
      content:
          'Support conservation projects that protect endangered species and preserve natural habitats.'),
];

void main() {
  setupPaymentCallback();
  runApp(const MyApp());
}

void setupPaymentCallback() {
  js.context['paymentSuccessCallback'] = (response) {
    onPaymentSuccess(response);
  };
}

final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  primaryColor: Colors.pink,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.easeInCubic,
      title: 'MAB CORP Foundation',
      theme: ThemeData.light(
        //scheme: FlexScheme.redWine,
        useMaterial3: true,
      ).copyWith(
        primaryColor: lightTheme.primaryColor,
        textTheme: lightTheme.textTheme.copyWith(
          titleLarge: lightTheme.textTheme.titleLarge?.copyWith(
            fontFamily: GoogleFonts.playfair().fontFamily,
          ),
          titleMedium: lightTheme.textTheme.titleMedium?.copyWith(
            fontFamily: GoogleFonts.playfair().fontFamily,
          ),
          titleSmall: lightTheme.textTheme.titleSmall?.copyWith(
            fontFamily: GoogleFonts.playfair().fontFamily,
          ),
          bodyLarge: lightTheme.textTheme.bodyLarge?.copyWith(
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
          bodyMedium: lightTheme.textTheme.bodyMedium?.copyWith(
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
          bodySmall: lightTheme.textTheme.bodySmall?.copyWith(
            fontFamily: GoogleFonts.lora().fontFamily,
          ),
        ),
        appBarTheme: lightTheme.appBarTheme.copyWith(
          backgroundColor: lightTheme.primaryColor,
          titleTextStyle: lightTheme.appBarTheme.titleTextStyle?.copyWith(
            color: Colors.white,
            fontFamily: GoogleFonts.playfair().fontFamily,
          ),
          toolbarTextStyle: lightTheme.appBarTheme.toolbarTextStyle?.copyWith(
            color: Colors.white,
            fontFamily: GoogleFonts.playfair().fontFamily,
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MAB CORP Foundation',
          style: Theme.of(context).appBarTheme.toolbarTextStyle?.copyWith(
                color: Colors.white,
              ),
        ),
        titleTextStyle:
            Theme.of(context).appBarTheme.toolbarTextStyle?.copyWith(
                  color: Colors.white,
                ),
      ),
      body: ListView(
        children: const [
          HeroSection(),
          AboutSection(),
          DonationSection(),
          MissionSection(),
          ContactSection(),
          Footer(),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (_, i, v) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(donationSliders[i].image),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                donationSliders[i].title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                donationSliders[i].content,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        );
      },
      itemCount: donationSliders.length,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.37,
        initialPage: 0,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: Image.asset('assets/img-2.jpeg'),
          ),
          const SizedBox(width: 20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What We Do & Why We Do',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'At MAB CORP foundation, we believe that everyone deserves the chance to live a healthy and fulfilling life. Our mission is to improve the lives of people in need by providing access to basic necessities such as food, shelter, education, and healthcare.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Through our fundraising efforts and the generous support of our donors, we are able to make a positive impact on the lives of thousands of people every year. Whether it\'s providing a warm meal to someone in need or helping a child receive an education, we are dedicated to making a difference in our community and beyond.',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: DonateButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

const items = [
  DonationBox(
    image: 'assets/don/clothing.png',
    title: 'Clothes',
    description:
        'Give your clothes a second chance: donate them today and help make a difference.',
  ),
  DonationBox(
    image: 'assets/don/sneakers.png',
    title: 'Footware',
    description:
        'Step up and make a difference: donate your footwear today and help those in need.',
  ),
  DonationBox(
    image: 'assets/don/salary.png',
    title: 'Fund',
    description:
        'Your donation can make a world of difference: give today to support our cause and help those in need.',
  ),
  DonationBox(
    image: 'assets/don/gadgets.png',
    title: 'Gadgets',
    description:
        'Unlock the power of giving: donate your gadgets today and help bridge the digital divide for those in need.',
  ),
  DonationBox(
    image: 'assets/don/book.png',
    title: 'Stationary',
    description:
        'Make a mark in someone\'s life: donate your stationery today and help provide educational resources for those in need.',
  ),
  DonationBox(
    image: 'assets/don/shopping-bag.png',
    title: 'Food',
    description:
        'Feed a hungry mouth today: donate food and help fight hunger in your community.',
  ),
];

class DonationSection extends StatelessWidget {
  const DonationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'We Manage Wastage or Donation like..',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomGridCountView(
            actionProps: ActionProps(
              backgroundColor: Colors.black12,
              leftAction: [],
              rightAction: [],
            ),
            gridViewProps: GridViewProps(
              builder: (_, i) {
                return items[i];
              },
              itemCount: items.length,
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Text(
            'Our Mission',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'At MAB CORP Foundation, our mission is to improve the lives of people in need by providing access to basic necessities such as food, shelter, education, and healthcare. We believe that everyone deserves the chance to live a healthy and fulfilling life, and we are committed to making a positive impact in our community and beyond.',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              MissionCard(
                title: 'Food for All',
                description: 'We provide food to those who need it most.',
                icon: Icons.food_bank,
              ),
              MissionCard(
                title: 'Shelter for All',
                description: 'We provide shelter to those who are homeless.',
                icon: Icons.home,
              ),
              MissionCard(
                title: 'Education for All',
                description:
                    'We provide education to those who cannot afford it.',
                icon: Icons.school,
              ),
              MissionCard(
                title: 'Healthcare for All',
                description:
                    'We ensure access to quality healthcare for everyone.',
                icon: Icons.local_hospital,
              ),
              MissionCard(
                title: 'Disaster Relief',
                description:
                    'We provide aid to those affected by natural disasters.',
                icon: Icons.warning,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MissionCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const MissionCard(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Icon(icon, size: 40),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Column(
        children: [
          Text(
            'Get in Touch',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Have a question or want to get involved? We\'d love to hear from you!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ContactCard(
                title: 'Phone',
                value: '+1 555 1234',
                icon: Icons.phone,
              ),
              ContactCard(
                title: 'Email',
                value: 'info@mabcorp.org',
                icon: Icons.email,
              ),
              ContactCard(
                title: 'Address',
                value: '123 Main St, Anytown, USA',
                icon: Icons.location_on,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const ContactCard(
      {super.key,
      required this.title,
      required this.value,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 40),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Copyright 2024 MAB CORP Foundation',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        const Text(
          'All rights reserved.',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(10),
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: 10,
              ),
              SocialMediaIcon(
                icon: Icons.facebook,
                onPressed: () {
                  // Handle Facebook press
                },
              ),
              const SizedBox(
                width: 10,
              ),
              SocialMediaIcon(
                icon: Icons.facebook,
                onPressed: () {
                  // Handle Twitter press
                },
              ),
              const SizedBox(
                width: 10,
              ),
              SocialMediaIcon(
                icon: Icons.facebook,
                onPressed: () {
                  // Handle Instagram press
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SocialMediaIcon extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;

  const SocialMediaIcon(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 30,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class DonationBox extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const DonationBox(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonateButton extends StatefulWidget {
  const DonateButton({super.key});

  @override
  _DonateButtonState createState() => _DonateButtonState();
}

class _DonateButtonState extends State<DonateButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    HapticFeedback.heavyImpact();

    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      _isHovered = true;
    });
  }

  void _handleMouseExit(PointerExitEvent event) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _handleMouseEnter,
      onExit: _handleMouseExit,
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        onTap: () {
          // Handle the donate action
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _isPressed
                  ? [Colors.blueAccent, Colors.blue]
                  : [Colors.lightBlueAccent, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: _isPressed
                ? []
                : [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, 5),
                    ),
                  ],
            border: Border.all(
              color: _isHovered ? Colors.white : Colors.transparent,
              width: 2.0,
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.circleDollarToSlot, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Donate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
