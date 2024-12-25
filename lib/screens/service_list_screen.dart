import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/service_provider.dart';

class ServiceListScreen extends StatelessWidget {
  final String category;

  ServiceListScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final services =
        Provider.of<ServiceProvider>(context).getCategories(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: const Color(0xFF16423C), // Dark Green Theme
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (ctx, index) {
          final service = services[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: GestureDetector(
              onTap: () {
                context.go('/home/servicesList/serviceDetails',
                    extra: service.id);
              },
              child: Card(
                color: const Color(0xFFDCE7E1), // Light Green Theme
                clipBehavior: Clip.hardEdge,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Service Image
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.network(
                            service.imageUrl,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFF16423C), // Dark Green
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "\$50 per",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Service Info
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150'), // Placeholder for provider image
                      ),
                      title: Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              SizedBox(width: 4),
                              Text(
                                "4.8 (1000+)",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Text(
                            "${service.providerName} • Plumber",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF16423C), // Dark Green
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          // Book Now Action
                        },
                        child: const Text(
                          "Book now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
