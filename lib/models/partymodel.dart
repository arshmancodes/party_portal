class PartyModel {
  String? createdBy;
  String? partySize;
  int? hostCount;
  int? guestCount;
  List<String?>? partyImages = [];
  String? partyInfo;
  String? startingDate;
  String? endingDate;
  Location? location;
  List<String>? drinks = [];
  List<String>? games = [];
  String? partyRating;
  String? howLong;

  PartyModel(
      {this.createdBy,
      this.partySize,
      this.hostCount,
      this.guestCount,
      this.partyImages,
      this.partyInfo,
      this.startingDate,
      this.endingDate,
      this.location,
      this.drinks,
      this.games,
      this.partyRating,
      this.howLong});

  PartyModel.fromJson(Map<String, dynamic> json) {
    createdBy = json['createdBy'];
    partySize = json['partySize'];
    hostCount = json['hostCount'];
    guestCount = json['guestCount'];
    partyImages = json['partyImages'];
    partyInfo = json['partyInfo'];
    startingDate = json['startingDate'];
    endingDate = json['endingDate'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    drinks = json['drinks'].cast<String>();
    games = json['games'].cast<String>();
    partyRating = json['partyRating'];
    howLong = json['howLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['partySize'] = this.partySize;
    data['hostCount'] = this.hostCount;
    data['guestCount'] = this.guestCount;
    data['partyImages'] = this.partyImages;
    data['partyInfo'] = this.partyInfo;
    data['startingDate'] = this.startingDate;
    data['endingDate'] = this.endingDate;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['drinks'] = this.drinks;
    data['games'] = this.games;
    data['partyRating'] = this.partyRating;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;
  String? locationName;

  Location({this.latitude, this.longitude, this.locationName});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationName = json['locationName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['locationName'] = this.locationName;
    return data;
  }
}
