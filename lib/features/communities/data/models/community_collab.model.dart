class CommunityCollabModel {
  const CommunityCollabModel({
    required this.image,
    required this.url,
    required this.name,
  });

  factory CommunityCollabModel.fromFirestore(Map<String, dynamic> json) {
    return CommunityCollabModel(
      image: json['image'].toString(),
      name: json['name'].toString(),
      url: json['url'].toString(),
    );
  }

  final String image;
  final String url;
  final String name;
}
