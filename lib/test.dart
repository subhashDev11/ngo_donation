// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
//
// void main() {
//   runApp(HelpingHandsApp());
// }
//
// class HelpingHandsApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Helping Hands NGO',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatelessWidget {
//   final List<String> imgList = [
//     'https://images.pexels.com/photos/26731972/pexels-photo-26731972/free-photo-of-tropea-summer-2024.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load',
//     'https://images.pexels.com/photos/26570536/pexels-photo-26570536/free-photo-of-estonian-suburbs.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//     'https://images.pexels.com/photos/26731972/pexels-photo-26731972/free-photo-of-tropea-summer-2024.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
//     'https://images.pexels.com/photos/25972573/pexels-photo-25972573/free-photo-of-leo_visions_-ig.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Helping Hands'),
//         actions: [
//           if (!isMobile(context)) ...[
//             TextButton(
//                 onPressed: () {},
//                 child: Text('About Us', style: TextStyle(color: Colors.white))),
//             TextButton(
//                 onPressed: () {},
//                 child: Text('Projects', style: TextStyle(color: Colors.white))),
//             TextButton(
//                 onPressed: () {},
//                 child: Text('Contact', style: TextStyle(color: Colors.white))),
//           ],
//         ],
//       ),
//       drawer: isMobile(context) ? Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'Helping Hands',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.info),
//               title: Text('About Us'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.work),
//               title: Text('Projects'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.contact_mail),
//               title: Text('Contact'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ) : null,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             BannerSlider(imgList: imgList),
//             Section(
//               title: 'About Us',
//               content:
//               'Helping Hands is dedicated to improving the lives of underprivileged communities. We focus on education, healthcare, and sustainable development.',
//             ),
//             Section(
//               title: 'Our Projects',
//               content:
//               '1. Education for All: Providing quality education to children in rural areas.\n\n2. Healthcare Initiative: Ensuring access to essential healthcare services.\n\n3. Sustainable Development: Promoting sustainable practices in communities.',
//             ),
//             DonateSection(),
//             Footer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool isMobile(BuildContext context) {
//     return MediaQuery.of(context).size.width < 600;
//   }
// }
//
// class BannerSlider extends StatelessWidget {
//   final List<String> imgList;
//
//   BannerSlider({required this.imgList});
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 400.0,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         enlargeCenterPage: true,
//       ),
//       items: imgList.map((item) => Container(
//         child: Center(
//           child: Image.network(item, fit: BoxFit.cover, width: 1000),
//         ),
//       )).toList(),
//     );
//   }
// }
//
// class Section extends StatelessWidget {
//   final String title;
//   final String content;
//
//   Section({required this.title, required this.content});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           Text(
//             content,
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DonateSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Donate Now',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Name',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Email',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           TextField(
//             decoration: InputDecoration(
//               labelText: 'Donation Amount',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {},
//             child: Text('Donate'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Footer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.grey[800],
//       padding: const EdgeInsets.all(20.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SocialMediaButton(
//                 label: 'Facebook',
//                 url: 'https://www.facebook.com',
//               ),
//               SocialMediaButton(
//                 label: 'Twitter',
//                 url: 'https://www.twitter.com',
//               ),
//               SocialMediaButton(
//                 label: 'Instagram',
//                 url: 'https://www.instagram.com',
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Text(
//             '© 2024 Helping Hands NGO. All rights reserved.',
//             style: TextStyle(color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SocialMediaButton extends StatelessWidget {
//   final String label;
//   final String url;
//
//   SocialMediaButton({required this.label, required this.url});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         launchURL(url);
//       },
//       child: Text(
//         label,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
//
//   void launchURL(String url) {
//     // Add your URL launch logic here
//   }
// }
