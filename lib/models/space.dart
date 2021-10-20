class Space {
  int id = 0;
  String name = "";
  String imageUrl = "";
  int price = 0;
  String city = "";
  String country = "";
  int rating = 0;
  String address = "";
  String phone = "";
  String mapUrl = "";
  List<String> photos = [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0;

  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchens,
    required this.numberOfBedrooms,
    required this.numberOfCupboards,
  });

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'].cast<String>();
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
  }

  // factory Space.fromJson(Map<String, dynamic> json) => Space(
  //       id: json["id"],
  //       name: json["name"],
  //       city: json["city"],
  //       country: json["country"],
  //       price: json["price"],
  //       imageUrl: json["image_url"],
  //       rating: json["rating"],
  //       address: json["address"],
  //       phone: json["phone"],
  //       mapUrl: json["map_url"],
  //       photos: List<String>.from(json["photos"].map((x) => x)),
  //       numberOfKitchens: json["number_of_kitchens"],
  //       numberOfBedrooms: json["number_of_bedrooms"],
  //       numberOfCupboards: json["number_of_cupboards"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "name": name,
  //       "city": city,
  //       "country": country,
  //       "price": price,
  //       "image_url": imageUrl,
  //       "rating": rating,
  //       "address": address,
  //       "phone": phone,
  //       "map_url": mapUrl,
  //       "photos": List<dynamic>.from(photos.map((x) => x)),
  //       "number_of_kitchens": numberOfKitchens,
  //       "number_of_bedrooms": numberOfBedrooms,
  //       "number_of_cupboards": numberOfCupboards,
  //     };
}
