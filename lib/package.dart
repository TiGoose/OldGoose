class Package {
  final String title;
  final String imageUrl;
  final int adultPrice;
  final int childPrice;
  final String description;
  final String keywords;
  final String from;
  final String to;

  Package(
      {required this.title,
        required this.imageUrl,
        required this.adultPrice,
        required this.childPrice,
        required this.description,
        required this.keywords,
        required this.from,
        required this.to});
}

Map<String, dynamic> PackageToMap(Package package) {
  return {
    'title': package.title,
    'imageUrl': package.imageUrl,
    'adultPrice': package.adultPrice,
    'childPrice': package.childPrice,
    'description': package.description,
    'keywords': package.keywords,
    'from': package.from,
    'to': package.to,
  };
}

Package? PackageFromMap(Map<String, dynamic>? map) {
  if (map == null) {
    return null;
  }
  return Package(
    title: map['title'],
    imageUrl: map['imageUrl'],
    adultPrice: map['adultPrice'],
    childPrice: map['childPrice'],
    description: map['description'],
    keywords: map['keywords'],
    from: map['from'],
    to: map['to'],
  );
}

