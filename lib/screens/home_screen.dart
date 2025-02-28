// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism/login_page.dart';
import 'package:tourism/screens/emergence_contacts_screen.dart';
import 'package:tourism/screens/kumbh_info_screen';
import 'travel_info_screen.dart';
import 'places_interest_screen.dart';
import 'faq_bot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final List<Widget> _screens = [
    // const KumbhInfoScreen(),
    // const TravelInfoScreen(),
    const PlacesInterestScreen(),
    const EmergencyContactsScreen(),
    const FaqBotScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Desi Trip'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.red,
      //   child: const Icon(Icons.sos),
      //   onPressed: () {
      //     _showSOSDialog();
      //   },
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.info),
          //   label: 'Kumbh Info',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.directions),
          //   label: 'Travel',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency),
            label: 'Emergency',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Help Desk',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // void _showSOSDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Emergency SOS'),
  //       content: const Text('Do you want to make an emergency call?'),
  //       actions: [
  //         TextButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: const Text('Cancel'),
  //         ),
  //         TextButton(
  //           style: TextButton.styleFrom(
  //             foregroundColor: Colors.white,
  //             backgroundColor: Colors.red,
  //           ),
  //           onPressed: () {
  //             // Make emergency call functionality
  //             // For now, just showing a snackbar
  //             Navigator.of(context).pop();
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text('Emergency call initiated'),
  //                 backgroundColor: Colors.red,
  //               ),
  //             );
  //           },
  //           child: const Text('Call Emergency'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
