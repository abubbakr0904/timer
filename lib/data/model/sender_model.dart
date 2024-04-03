class SenderModel{
  final String brandImage;
  final String name;
  final String location;

  SenderModel({
    required  this.brandImage,
    required this.name,
    required this.location,
  });

  factory SenderModel.fromJson(Map<String, dynamic> json) {
    return SenderModel(
      brandImage: json['brand_image'] as String? ?? '',
      name: json['name'] as String? ?? '',
      location: json['location'] as String? ?? '',
    );
  }
}