// lib/screens/emergency_contacts_screen.dart

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContactsScreen extends StatelessWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> emergencyContacts = [
      {
        'title': 'Police Control Room',
        'number': '100',
        'icon': Icons.local_police,
        'color': Colors.blue,
      },
      {
        'title': 'Medical Emergency',
        'number': '108',
        'icon': Icons.medical_services,
        'color': Colors.red,
      },
      {
        'title': 'Fire Emergency',
        'number': '101',
        'icon': Icons.fireplace,
        'color': Colors.orange,
      },
      {
        'title': 'Women Helpline',
        'number': '1090',
        'icon': Icons.female,
        'color': Colors.pink,
      },
      {
        'title': 'Missing Persons',
        'number': '1094',
        'icon': Icons.person_search,
        'color': Colors.teal,
      },
      {
        'title': 'Tourist Helpline',
        'number': '1800111363',
        'icon': Icons.travel_explore,
        'color': Colors.green,
      },
    ];

    // final List<Map<String, dynamic>> medicalFacilities = [
    //   {
    //     'name': 'Kumbh Emergency Hospital',
    //     'address': 'Sector 1, Kumbh Mela Ground',
    //     'contact': '0532-1234567',
    //   },
    //   {
    //     'name': 'Swaroop Rani Nehru Hospital',
    //     'address': 'Medical College, Prayagraj',
    //     'contact': '0532-2256789',
    //   },
    //   {
    //     'name': 'Kamla Nehru Memorial Hospital',
    //     'address': 'Tagore Town, Prayagraj',
    //     'contact': '0532-3456781',
    //   },
    // ];

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Card
            Card(
              color: Colors.red.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.red.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Colors.red,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Emergency?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Press the SOS button at the bottom right of your screen for immediate assistance.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Emergency Contacts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 10),

            // Emergency Contacts Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.5,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: emergencyContacts.length,
              itemBuilder: (context, index) {
                final contact = emergencyContacts[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      _makePhoneCall(contact['number']);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            contact['icon'],
                            color: contact['color'],
                            size: 32,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            contact['title'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            contact['number'],
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // const Text(
            //   'Medical Facilities',
            //   style: TextStyle(
            //     fontSize: 22,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.deepOrange,
            //   ),
            // ),
            // const SizedBox(height: 10),

            // // Medical Facilities List
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: medicalFacilities.length,
            //   itemBuilder: (context, index) {
            //     final facility = medicalFacilities[index];
            //     return Card(
            //       margin: const EdgeInsets.only(bottom: 10),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: ListTile(
            //         leading: const CircleAvatar(
            //           backgroundColor: Colors.red,
            //           child: Icon(Icons.local_hospital, color: Colors.white),
            //         ),
            //         title: Text(facility['name']),
            //         subtitle: Text(facility['address']),
            //         trailing: IconButton(
            //           icon: const Icon(Icons.phone, color: Colors.green),
            //           onPressed: () {
            //             _makePhoneCall(facility['contact']);
            //           },
            //         ),
            //       ),
            //     );
            //   },
            // ),

            // const SizedBox(height: 20),

            // Safety Tips Card
            Card(
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Safety Tips For Your Visit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildSafetyTip('Stay hydrated, carry water bottles'),
                    _buildSafetyTip('Keep your identification with you'),
                    _buildSafetyTip('Follow crowd management instructions'),
                    _buildSafetyTip('Be aware of your belongings'),
                    _buildSafetyTip(
                        'Set a meeting point in case you get separated'),
                    _buildSafetyTip('Use authorized transportation services'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(tip)),
        ],
      ),
    );
  }

  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }
}
