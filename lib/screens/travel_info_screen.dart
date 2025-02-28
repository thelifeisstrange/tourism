// lib/screens/travel_info_screen.dart

import 'package:flutter/material.dart';

class TravelInfoScreen extends StatelessWidget {
  const TravelInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ways to Reach Prayagraj (Allahabad)',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),
            
            // By Air
            _buildTravelOption(
              context,
              title: 'By Air',
              icon: Icons.flight,
              details: 'Prayagraj has its own domestic airport (Prayagraj Airport) located at Bamrauli, about 12 km from the city center. During Kumbh Mela, additional flights are scheduled to handle the increased traffic.',
              additionalInfo: [
                'Nearest International Airport: Varanasi Airport (125 km)',
                'Airport Transfers: Taxis and pre-paid cab services available',
                'Special Arrangements: During Kumbh, special shuttle services operate from the airport'
              ],
            ),
            
            const SizedBox(height: 15),
            
            // By Train
            _buildTravelOption(
              context,
              title: 'By Train',
              icon: Icons.train,
              details: 'Prayagraj is well connected by railways to all major cities in India. There are three main railway stations:',
              additionalInfo: [
                'Prayagraj Junction (formerly Allahabad Junction)',
                'Prayagraj Rambagh (formerly Allahabad City)',
                'Prayagraj Chheoki (south of the Yamuna river)',
                'During Kumbh Mela, Indian Railways runs special trains'
              ],
            ),
            
            const SizedBox(height: 15),
            
            // By Road
            _buildTravelOption(
              context,
              title: 'By Road',
              icon: Icons.directions_bus,
              details: 'Prayagraj is connected through a network of National Highways to major cities:',
              additionalInfo: [
                'NH-2 (Delhi-Kolkata highway) passes through Prayagraj',
                'Regular bus services from Varanasi, Lucknow, Kanpur',
                'State transport corporations operate special buses during Kumbh',
                'Distance from major cities: Delhi (650 km), Lucknow (200 km), Varanasi (120 km)',
              ],
            ),
            
            const SizedBox(height: 15),
            
            // Local Transport
            _buildTravelOption(
              context,
              title: 'Local Transport in Prayagraj',
              icon: Icons.commute,
              details: 'Once in Prayagraj, there are several options to move around:',
              additionalInfo: [
                'Auto rickshaws and e-rickshaws',
                'Cycle rickshaws for short distances',
                'City buses connecting major parts of the city',
                'Special shuttle services to Kumbh Mela grounds',
                'Boat rides across the Sangam',
              ],
            ),
            
            const SizedBox(height: 20),
            
            // Special Kumbh Arrangements
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Special Kumbh Mela Transport Arrangements',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('• Special trains from major cities'),
                  Text('• Temporary bus terminals near Mela grounds'),
                  Text('• Shuttle services from railway stations'),
                  Text('• Park-and-ride facilities at city outskirts'),
                  Text('• Golf carts for elderly and differently-abled visitors'),
                  Text('• Boat services across the rivers'),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Travel Tips
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Travel Tips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('• Book tickets and accommodation well in advance'),
                    Text('• Carry light luggage and comfortable footwear'),
                    Text('• Keep identity proof and required documents handy'),
                    Text('• Download offline maps of the area'),
                    Text('• Stay hydrated and carry necessary medications'),
                    Text('• Follow the crowd management instructions'),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildTravelOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required String details,
    required List<String> additionalInfo,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.deepOrange, size: 28),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(details),
                const SizedBox(height: 10),
                ...additionalInfo.map((info) => Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(info)),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}