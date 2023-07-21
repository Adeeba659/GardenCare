class Plant {
  final String commonName;
  final String scientificName;
  final String description;
  final List<String> diseases;
  final List<String> diseases_desc;
  final List<String> treatements;
  final String plantImage;
  final List<String> diseaseImage;

  const Plant({
    required this.commonName,
    required this.description,
    required this.diseases,
    required this.scientificName,
    required this.diseases_desc,
    required this.treatements,
    required this.plantImage,
    required this.diseaseImage,
  });

  Map<String, dynamic> toJson() {
    return {
      'commonName': commonName,
      'scientificName': scientificName,
      'description': description,
      'diseases': diseases,
      'diseases_desc': diseases_desc,
      'treatements': treatements,
      'plantImage': plantImage,
      'diseaseImage': diseaseImage,
    };
  }

  factory Plant.fromJson(Map<String, dynamic> json) {
    return Plant(
      commonName: json['commonName'],
      scientificName: json['scientificName'],
      description: json['description'],
      diseases: List<String>.from(json['diseases']),
      diseases_desc: List<String>.from(json['diseases_desc']),
      treatements: List<String>.from(json['treatements']),
      plantImage: json['plantImage'],
      diseaseImage: List<String>.from(json['diseaseImage']),
    );
  }
}
