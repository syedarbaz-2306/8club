class ExperienceModel {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String imageUrl;
  final String iconUrl;
  final int order;

  ExperienceModel({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.imageUrl,
    required this.iconUrl,
    required this.order,
  });

  // ---------- Factory Constructor ----------
  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      tagline: json['tagline'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['image_url'] ?? '',
      iconUrl: json['icon_url'] ?? '',
      order: json['order'] ?? 0,
    );
  }

  // ---------- To JSON ----------
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'tagline': tagline,
      'description': description,
      'image_url': imageUrl,
      'icon_url': iconUrl,
      'order': order,
    };
  }

  static List<ExperienceModel> fromJsonList(List<dynamic> list) {
    return list.map((item) => ExperienceModel.fromJson(item)).toList();
  }
}
