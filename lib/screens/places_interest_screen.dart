// lib/screens/places_interest_screen.dart

import 'package:flutter/material.dart';

class PlacesInterestScreen extends StatefulWidget {
  const PlacesInterestScreen({Key? key}) : super(key: key);

  @override
  _PlacesInterestScreenState createState() => _PlacesInterestScreenState();
}

class _PlacesInterestScreenState extends State<PlacesInterestScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.orangeAccent,
          child: SafeArea(
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  tabs: const [
                    Tab(text: 'HOTELS'),
                    Tab(text: 'FOOD'),
                    Tab(text: 'ATTRACTIONS'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Hotels Tab
          _buildHotelsTab(),

          // Food Tab
          _buildFoodTab(),

          // Attractions Tab
          _buildAttractionsTab(),
        ],
      ),
    );
  }

  Widget _buildHotelsTab() {
    final List<Map<String, dynamic>> hotels = [
      {
        'name': 'Hotel Prayag Palace',
        'address': 'Civil Lines, Prayagraj',
        'priceRange': '₹2,500 - ₹5,000',
        'rating': 4.2,
        'amenities': 'Wi-Fi, Restaurant, Room Service',
      },
      {
        'name': 'Hotel Kanha Shyam',
        'address': 'Near Railway Station, Prayagraj',
        'priceRange': '₹1,800 - ₹3,500',
        'rating': 3.8,
        'amenities': 'Wi-Fi, Restaurant, Parking',
      },
      {
        'name': 'Sangam Grand Hotel',
        'address': 'MG Road, Prayagraj',
        'priceRange': '₹3,000 - ₹6,000',
        'rating': 4.5,
        'amenities': 'Wi-Fi, Pool, Restaurant, Gym',
      },
      {
        'name': 'Kumbh Accommodation Camp',
        'address': 'Near Kumbh Mela Grounds',
        'priceRange': '₹500 - ₹1,500',
        'rating': 3.5,
        'amenities': 'Basic Amenities, Meals included',
      },
      {
        'name': 'Triveni Guest House',
        'address': 'Jhusi, Prayagraj',
        'priceRange': '₹1,200 - ₹2,000',
        'rating': 3.7,
        'amenities': 'Wi-Fi, Restaurant, Parking',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hotels.length,
      itemBuilder: (context, index) {
        final hotel = hotels[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.grey.shade300,
                ),
                child: Center(
                  child: Icon(
                    Icons.hotel,
                    size: 60,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotel['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                hotel['rating'].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(hotel['address']),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.attach_money,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(hotel['priceRange']),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.room_service,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(hotel['amenities']),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Show dialog with more details
                          },
                          child: const Text('MORE INFO'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Booking functionality
                          },
                          child: const Text('BOOK NOW'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFoodTab() {
    final List<Map<String, dynamic>> foodPlaces = [
      {
        'name': 'Prayagraj Express',
        'type': 'Train',
        'route': 'Delhi - Prayagraj',
        'duration': '7-8 hours',
        'price': '₹500 - ₹1200',
      },
      {
        'name': 'UP State Transport',
        'type': 'Bus',
        'route': 'Lucknow - Prayagraj',
        'duration': '5-6 hours',
        'price': '₹250 - ₹450',
      },
      {
        'name': 'IndiGo Airlines',
        'type': 'Flight',
        'route': 'Delhi - Prayagraj',
        'duration': '1.5 hours',
        'price': '₹2500 - ₹5000',
      },
      {
        'name': 'Ola Outstation',
        'type': 'Taxi',
        'route': 'Local & Outstation',
        'duration': 'As per destination',
        'price': '₹8/km + ₹100/hour waiting',
      },
      {
        'name': 'Kumbh Special',
        'type': 'Train',
        'route': 'Multiple Routes to Prayagraj',
        'duration': 'Varies by origin',
        'price': '₹300 - ₹1000',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foodPlaces.length,
      itemBuilder: (context, index) {
        final place = foodPlaces[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      place['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        place['type'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.restaurant_menu,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Expanded(child: Text('Route: ${place['route']}')),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.attach_money,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(place['duration']),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(place['price']),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        // Show on map functionality
                      },
                      icon: const Icon(Icons.map),
                      label: const Text('VIEW ON MAP'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAttractionsTab() {
    final List<Map<String, dynamic>> attractions = [
      {
        "name": "Taj Mahal, Agra",
        "description":
            "A UNESCO World Heritage Site, the Taj Mahal is a white marble mausoleum built by Mughal Emperor Shah Jahan in memory of his wife Mumtaz Mahal. Known for its breathtaking architecture and symmetrical gardens.",
        "timings": "Sunrise to Sunset (Closed on Fridays)",
        "entryFee": "₹50 for Indians, ₹1100 for foreigners",
        "imageUrl": "assets/taj_mahal.jpeg"
      },
      {
        "name": "City Palace, Jaipur",
        "description":
            "The City Palace of Jaipur blends Rajput, Mughal, and European architecture. It houses royal museums, courtyards, and the iconic Peacock Gate.",
        "timings": "9:30 AM - 5:00 PM",
        "entryFee": "₹200 for Indians, ₹700 for foreigners",
        "imageUrl": "assets/city_palace.jpeg"
      },
      {
        "name": "Kerala (God's Own Country)",
        "description":
            "A tropical paradise known for backwaters, hill stations, beaches, and rich cultural heritage. Famous for houseboat cruises, tea plantations, and Ayurvedic retreats.",
        "timings": "Open 24 hours",
        "entryFee": "Varies by attraction",
        "imageUrl": "assets/kerala.jpeg"
      },
      {
        "name": "Charminar, Hyderabad",
        "description":
            "Built in 1591, the Charminar is an iconic symbol of Hyderabad, showcasing Indo-Islamic architecture. The surrounding markets are popular for bangles, pearls, and street food.",
        "timings": "9:30 AM - 5:30 PM",
        "entryFee": "₹25 for Indians, ₹300 for foreigners",
        "imageUrl": "assets/charminar.jpeg"
      },
      {
        "name": "Hampi, Karnataka",
        "description":
            "Hampi, a UNESCO World Heritage Site in Karnataka, India, is a breathtaking historical and cultural destination. Once the glorious capital of the Vijayanagara Empire.",
        "timings": "9:30 AM - 5:30 PM",
        "entryFee": "₹25 for Indians, ₹300 for foreigners",
        "imageUrl": "assets/hampi.jpeg"
      },
      {
        "name": "Qutub Minar, Delhi",
        "description":
            "The tallest brick minaret in the world with Indo-Islamic architecture. A UNESCO World Heritage Site with lush gardens and historical ruins.",
        "timings": "7:00 AM - 5:00 PM",
        "entryFee": "₹40 for Indians, ₹600 for foreigners",
        "imageUrl": "assets/qutub.jpeg"
      }
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: attractions.length,
      itemBuilder: (context, index) {
        final attraction = attractions[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                // Replace the placeholder with actual image
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.asset(
                    attraction['imageUrl'],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // Fallback if image fails to load
                      return Container(
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(
                            Icons.photo,
                            size: 60,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attraction['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(attraction['description']),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.access_time,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(attraction['timings']),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.money, color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        Text(attraction['entryFee']),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            // Book functionality
                          },
                          icon: const Icon(Icons.bookmark_border),
                          label: const Text('BOOK'),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.green,
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          onPressed: () {
                            // Show on map functionality
                          },
                          icon: const Icon(Icons.map),
                          label: const Text('VIEW ON MAP'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
