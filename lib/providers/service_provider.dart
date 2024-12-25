import 'package:flutter/material.dart';
import '../models/service.dart';

class ServiceProvider with ChangeNotifier {
  final List<Service> _services = [
    Service(
      id: '1',
      title: 'House Cleaning',
      category: 'Home Services',
      imageUrl:
          'https://images.unsplash.com/photo-1517404215738-15263e9f9178?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Professional house cleaning services for your home.',
      providerName: 'John Doe',
      providerContact: '1234567890',
      providerProfession: 'Cleaner',
      price: 50.0,
      duration: 60,
      rating: 4.5,
      providerRating: 4.7,
    ),
    Service(
      id: '2',
      title: 'Plumbing',
      category: 'Home Services',
      imageUrl:
          'https://images.unsplash.com/photo-1517404215738-15263e9f9178?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Expert plumbing solutions for all your needs.',
      providerName: 'Jane Smith',
      providerContact: '9876543210',
      providerProfession: 'Plumber',
      price: 80.0,
      duration: 90,
      rating: 4.8,
      providerRating: 4.6,
    ),
    Service(
      id: '3',
      title: 'Furniture Assembly',
      category: 'Sofa Welding',
      imageUrl:
          'https://images.unsplash.com/photo-1517404215738-15263e9f9178?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      description: 'Expert furniture assembly solutions for your home.',
      providerName: 'Alice Brown',
      providerContact: '5551234567',
      providerProfession: 'Carpenter',
      price: 120.0,
      duration: 120,
      rating: 4.3,
      providerRating: 4.5,
    ),
    // Add more services as needed
  ];

  List<Service> get services => [..._services];

  List<Service> getCategories(String category) {
    return _services.where((service) => service.category == category).toList();
  }

  Service getServiceById(String id) {
    return _services.firstWhere((service) => service.id == id);
  }
}
