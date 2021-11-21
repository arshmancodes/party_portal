class AuthModel {
  String? mongodbId;
  String? name;
  String? email;
  String? phoneNumber;
  String? imageUrl;
  String? fcmToken;
  int? age;
  // List<Address>? address;
  // PaymentCard? paymentCard;

  AuthModel({
    this.mongodbId,
    this.name,
    this.email,
    this.phoneNumber,
    this.imageUrl,
    this.fcmToken,
    this.age,
    // this.address,
    // this.paymentCard
  });

  AuthModel.fromJson(Map<String, dynamic> json) {
    mongodbId = json['_id'];
    name = json['username'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    fcmToken = json['fcmToken'];
    age = json['age'];
    // address = json['address'];
    // paymentCard = json['paymentCard'];
  }
}
