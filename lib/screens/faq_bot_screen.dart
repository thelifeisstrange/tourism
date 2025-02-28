// lib/screens/tourism_faq_bot_screen.dart

import 'package:flutter/material.dart';

class FaqBotScreen extends StatefulWidget {
  const FaqBotScreen({Key? key}) : super(key: key);

  @override
  _FaqBotScreenState createState() => _FaqBotScreenState();
}

class _FaqBotScreenState extends State<FaqBotScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> faqData = [
    {
      'question': 'How do I book a hotel?',
      'answer':
          'You can book hotels in the "Accommodations" tab. Browse through our curated selection of hotels, select your check-in and check-out dates, choose your room type, and confirm your booking with our secure payment system.'
    },
    {
      'question': 'What are the popular attractions?',
      'answer':
          'Our "Attractions" tab features the top-rated tourist destinations with reviews, photos, and entrance fees. You can filter attractions by categories like Historical Sites, Natural Wonders, Cultural Experiences, and Family-Friendly options.'
    },
    {
      'question': 'How can I book flights?',
      'answer':
          'Visit the "Travel" tab to book flights. Enter your departure and arrival cities, dates, number of travelers, and we\'ll show you the best available options. You can sort by price, duration, or airline preference.'
    },
    {
      'question': 'Do you offer guided tours?',
      'answer':
          'Yes! Check out our "Tours" section for both private and group guided experiences. You can book in advance and pay securely through the app. Our local expert guides provide authentic insights and are available in multiple languages.'
    },
    {
      'question': 'What transportation options are available?',
      'answer':
          'Under the "Transportation" tab, you can book taxis, rent cars, find public transit information, and even arrange airport transfers. We also offer information on local transport passes that can save you money.'
    },
    {
      'question': 'Are there any current deals or discounts?',
      'answer':
          'Visit our "Deals" section for the latest promotions, seasonal discounts, and package offers. We regularly update with new savings opportunities. You can also enable notifications to get alerts about flash deals.'
    },
    {
      'question': 'How do I create an itinerary?',
      'answer':
          'Use our "Itinerary Builder" feature to create a custom travel plan. Add attractions, restaurants, and activities to specific dates, and we\'ll optimize your route. You can share your itinerary with travel companions and export it to your calendar.'
    },
    {
      'question': 'What dining options are recommended?',
      'answer':
          'Our "Dining" section features top-rated restaurants, cafes, and local eateries. Filter by cuisine type, price range, or dietary restrictions. You can make reservations directly through the app for partner restaurants.'
    },
    {
      'question': 'How do I find local events and festivals?',
      'answer':
          'Check the "Events" calendar for upcoming local festivals, concerts, exhibitions, and cultural celebrations. You can purchase tickets for many events directly through our app.'
    },
    {
      'question': 'What should I know about local currency and payments?',
      'answer':
          'The "Travel Tips" section includes information about local currency, tipping customs, and accepted payment methods. We also offer a currency converter tool to help you understand costs in your home currency.'
    },
  ];

  @override
  void initState() {
    super.initState();

    // Add a welcome message from the bot
    _addBotMessage(
        'Welcome to your Personal Travel Assistant! How can I help with your travel plans today?');

    // Add some suggested questions
    _addBotMessage('You can ask me about:\n'
        '• Hotel bookings\n'
        '• Popular attractions\n'
        '• Flight reservations\n'
        '• Guided tours\n'
        '• Transportation options\n'
        '• Local dining\n'
        '• And more!');
  }

  void _addBotMessage(String message) {
    setState(() {
      _messages.add({
        'message': message,
        'isUser': false,
      });
    });
  }

  void _handleUserMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'message': message,
        'isUser': true,
      });
      _messageController.clear();
    });

    _scrollToBottom();

    // Simulate bot "typing"
    Future.delayed(const Duration(milliseconds: 500), () {
      _getBotResponse(message);
    });
  }

  void _getBotResponse(String message) {
    String response =
        'I don\'t have specific information on that. Try asking about hotels, attractions, flights, tours, transportation, or local dining options.';

    // Simple keyword matching for FAQ
    String lowercaseMessage = message.toLowerCase();

    // Check for matches in FAQ data
    for (final faq in faqData) {
      if (lowercaseMessage.contains(faq['question']!.toLowerCase()) ||
          _containsKeywords(lowercaseMessage, faq['question']!.toLowerCase())) {
        response = faq['answer']!;
        break;
      }
    }

    // Some additional specific responses
    if (lowercaseMessage.contains('hello') ||
        lowercaseMessage.contains('hi') ||
        lowercaseMessage.contains('hey')) {
      response = 'Hello! How can I help you plan your perfect trip today?';
    } else if (lowercaseMessage.contains('thank')) {
      response =
          'You\'re welcome! If you have any more questions about your travel plans, I\'m here to help.';
    } else if (lowercaseMessage.contains('bye')) {
      response =
          'Goodbye! Happy travels and don\'t hesitate to return if you need more assistance with your journey.';
    } else if (lowercaseMessage.contains('booking') ||
        lowercaseMessage.contains('reservation')) {
      response =
          'You can make bookings for hotels, flights, tours, and restaurants in their respective sections. Would you like me to direct you to a specific booking service?';
    } else if (lowercaseMessage.contains('cancel') ||
        lowercaseMessage.contains('refund')) {
      response =
          'To cancel a booking or request a refund, please go to "My Bookings" in your profile, select the reservation you wish to cancel, and follow the cancellation process. Our cancellation policies vary by service provider.';
    } else if (lowercaseMessage.contains('payment') ||
        lowercaseMessage.contains('pay')) {
      response =
          'We accept various payment methods including credit/debit cards, PayPal, and Apple/Google Pay. All transactions are secure and encrypted. For specific payment queries, please visit the "Payment Options" section.';
    } else if (lowercaseMessage.contains('weather')) {
      response =
          'You can check the weather forecast for your destination in the "Weather" tab. We provide 7-day forecasts to help you pack appropriately and plan outdoor activities.';
    } else if (lowercaseMessage.contains('luggage') ||
        lowercaseMessage.contains('baggage')) {
      response =
          'For information about luggage allowances, check the "Travel Tips" section or your specific airline booking details. We also offer packing lists tailored to your destination and season of travel.';
    } else if (lowercaseMessage.contains('wifi') ||
        lowercaseMessage.contains('internet')) {
      response =
          'Information about WiFi availability at hotels and public spaces can be found in our "Connectivity" guide. We also offer eSIM and portable WiFi rental services in many destinations.';
    } else if (lowercaseMessage.contains('language') ||
        lowercaseMessage.contains('translator')) {
      response =
          'Our app includes a "Translator" tool with common phrases in multiple languages. You can also download language packs for offline use during your travels.';
    } else if (lowercaseMessage.contains('emergency') ||
        lowercaseMessage.contains('help')) {
      response =
          'For emergencies, please use the SOS button at the top-right of the screen. This provides local emergency contacts and your exact location. Important numbers: Police: 911, Medical: 112, Our 24/7 Support: +1-888-TRAVEL-HELP.';
    }

    setState(() {
      _messages.add({
        'message': response,
        'isUser': false,
      });
    });

    _scrollToBottom();
  }

  bool _containsKeywords(String message, String question) {
    List<String> keywords = question
        .split(' ')
        .where((word) => word.length > 3)
        .map((word) => word.toLowerCase().replaceAll(RegExp(r'[^\w\s]+'), ''))
        .toList();

    int matchCount = 0;
    for (String keyword in keywords) {
      if (message.contains(keyword)) {
        matchCount++;
      }
    }

    // If more than 50% of significant keywords match, consider it a match
    return matchCount >= (keywords.length / 2).ceil();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(
                  message['message'],
                  message['isUser'],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, -1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.mic, color: Colors.blueGrey),
                  onPressed: () {
                    // Voice input functionality would be implemented here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Voice input coming soon!')),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ask about travel, bookings, attractions...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: _handleUserMessage,
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.send),
                  onPressed: () {
                    _handleUserMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 8),
          //   color: Colors.grey.shade50,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       _buildQuickActionButton(Icons.hotel, 'Hotels', () {
          //         _handleUserMessage('How do I book a hotel?');
          //       }),
          //       _buildQuickActionButton(Icons.flight, 'Flights', () {
          //         _handleUserMessage('How can I book flights?');
          //       }),
          //       _buildQuickActionButton(Icons.tour, 'Tours', () {
          //         _handleUserMessage('Do you offer guided tours?');
          //       }),
          //       _buildQuickActionButton(Icons.restaurant, 'Dining', () {
          //         _handleUserMessage('What dining options are recommended?');
          //       }),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildQuickActionButton(
      IconData icon, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String message, bool isUser) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.travel_explore, color: Colors.blue),
            ),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isUser ? Colors.blue : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isUser ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isUser)
            CircleAvatar(
              backgroundColor: Colors.blue.shade300,
              child: const Icon(Icons.person, color: Colors.white),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
