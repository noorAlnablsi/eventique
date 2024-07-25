//taghreed
class Vendor {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String description;
  final String days;
  final String time;
  String? imageUrl;
  String? coverImageUrl;

  Vendor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.description,
    required this.days,
    required this.time,
    this.imageUrl,
    this.coverImageUrl,
  });
}
