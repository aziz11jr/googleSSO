//class Sites {
// late int index;
// late int reference;
// late String placeLabel;
// late String placeLabelE;
// late String heritage;
// late String wikicode;
// late String longitude;
// late String latitude;
// late String uNESCO;
// late String image;
// late String anglaisCenterOfInterest;
// late String franaisCentresIntrt;
// late String anglaisfiltre;
// late String franaisfilter;
// late double category;
// late String instanceFrench;
// late String instanceEnglish;
// late double score2;
// late double distance2;
// late String distance;
// late double type;

// Sites(
//     {required this.index,
//     required this.reference,
//     required this.placeLabel,
//     required this.placeLabelE,
//     required this.heritage,
//     required this.wikicode,
//     required this.longitude,
//     required this.latitude,
//     required this.uNESCO,
//     required this.image,
//     required this.anglaisCenterOfInterest,
//     required this.franaisCentresIntrt,
//     required this.anglaisfiltre,
//     required this.franaisfilter,
//     required this.category,
//     required this.instanceFrench,
//     required this.instanceEnglish,
//     required this.score2,
//     required this.distance2,
//     required this.distance,
//     required this.type});

// Sites.fromJson(Map<String, dynamic> json) {
//   index = json['index'];
//   reference = json['Reference'];
//   placeLabel = json['placeLabel'];
//   placeLabelE = json['placeLabelE'];
//   heritage = json['heritage'];
//   wikicode = json['wikicode'];
//   longitude = json['longitude'];
//   latitude = json['latitude'];
//   uNESCO = json['UNESCO'];
//   image = json['image'];
//   anglaisCenterOfInterest = json['AnglaisCenterOfInterest'];
//   franaisCentresIntrt = json['FrançaisCentresIntérêt'];
//   anglaisfiltre = json['Anglaisfiltre'];
//   franaisfilter = json['Françaisfilter'];
//   category = json['category'];
//   instanceFrench = json['InstanceFrench'];
//   instanceEnglish = json['InstanceEnglish'];
//   score2 = json['Score2'];
//   distance2 = json['distance2'];
//   distance = json['distance'];
//   type = json['Type'];
// }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = Map<String, dynamic>();
//   data['index'] = index;
//   data['Reference'] = reference;
//   data['placeLabel'] = placeLabel;
//   data['placeLabelE'] = placeLabelE;
//   data['heritage'] = heritage;
//   data['wikicode'] = wikicode;
//   data['longitude'] = longitude;
//   data['latitude'] = latitude;
//   data['UNESCO'] = uNESCO;
//   data['image'] = image;
//   data['AnglaisCenterOfInterest'] = anglaisCenterOfInterest;
//   data['FrançaisCentresIntérêt'] = franaisCentresIntrt;
//   data['Anglaisfiltre'] = anglaisfiltre;
//   data['Françaisfilter'] = franaisfilter;
//   data['category'] = category;
//   data['InstanceFrench'] = instanceFrench;
//   data['InstanceEnglish'] = instanceEnglish;
//   data['Score2'] = score2;
//   data['distance2'] = distance2;
//   data['distance'] = distance;
//   data['Type'] = type;
//   return data;
// }
//}

class Sites {
  late int index;
  late int reference;
  late String placeLabel;
  late String placeLabelE;
  late String heritage;
  late String wikicode;
  late String longitude;
  late String latitude;
  late String image;
  late String anglaisfiltre;
  late int category;
  late double score2;
  late double distance2;
  late String distance;
  late int type;
  late String englishfiltre;
  late String uNESCO;
  late String anglaisCenterOfInterest;
  late String franaisCentresIntrt;
  late String franaisfilter;
  late String instanceFrench;
  late String instanceEnglish;

  Sites(
      {required this.index,
      required this.reference,
      required this.placeLabel,
      required this.placeLabelE,
      required this.heritage,
      required this.wikicode,
      required this.longitude,
      required this.latitude,
      required this.image,
      required this.anglaisfiltre,
      required this.category,
      required this.score2,
      required this.distance2,
      required this.distance,
      required this.type,
      required this.englishfiltre,
      required this.uNESCO,
      required this.anglaisCenterOfInterest,
      required this.franaisCentresIntrt,
      required this.franaisfilter,
      required this.instanceFrench,
      required this.instanceEnglish});

  Sites.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    reference = json['reference'];
    placeLabel = json['placeLabel'];
    placeLabelE = json['placeLabelE'];
    heritage = json['heritage'];
    wikicode = json['wikicode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    image = json['image'];
    anglaisfiltre = json['Anglaisfiltre'];
    category = json['category'];
    score2 = json['score2'];
    distance2 = json['distance2'];
    distance = json['distance'];
    type = json['type'];
    anglaisfiltre = json['anglaisfiltre'];
    uNESCO = json['UNESCO'];
    anglaisCenterOfInterest = json['AnglaisCenterOfInterest'];
    franaisCentresIntrt = json['FrançaisCentresIntérêt'];
    franaisfilter = json['Françaisfilter'];
    instanceFrench = json['InstanceFrench'];
    instanceEnglish = json['InstanceEnglish'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['index'] = index;
    data['reference'] = reference;
    data['placeLabel'] = placeLabel;
    data['placeLabelE'] = placeLabelE;
    data['heritage'] = heritage;
    data['wikicode'] = wikicode;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['image'] = image;
    data['Anglaisfiltre'] = anglaisfiltre;
    data['category'] = category;
    data['score2'] = score2;
    data['distance2'] = distance2;
    data['distance'] = distance;
    data['type'] = type;
    data['anglaisfiltre'] = anglaisfiltre;
    data['UNESCO'] = uNESCO;
    data['AnglaisCenterOfInterest'] = anglaisCenterOfInterest;
    data['FrançaisCentresIntérêt'] = franaisCentresIntrt;
    data['Françaisfilter'] = franaisfilter;
    data['InstanceFrench'] = instanceFrench;
    data['InstanceEnglish'] = instanceEnglish;
    return data;
  }
}
