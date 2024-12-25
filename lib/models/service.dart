class Service {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final String description;
  final String providerName;
  final String providerContact;
  final String providerProfession; // Added profession of the provider
  final double price; // Added price of the service
  final int duration; // Added duration for the service in minutes
  final double rating; // Added service rating
  final double providerRating; // Added rating of the provider

  Service({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.providerName,
    required this.providerContact,
    required this.providerProfession,
    required this.price,
    required this.duration,
    required this.rating,
    required this.providerRating,
  });
}
