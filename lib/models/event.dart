// --- Event Model ---
class Event {
  final int id;
  final String title;
  final String description;
  final String date;
  final double price;
  final String image;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.price,
    required this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }
}