

class UpdateProfileRes {
  dynamic message;
  dynamic status;
  Data? data;

  UpdateProfileRes({
    this.message,
    this.status,
    this.data,
  });

  factory UpdateProfileRes.fromMap(Map<String, dynamic> json) => UpdateProfileRes(
    message: json["message"],
    status: json["status"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "status": status,
    "data": data!.toMap(),
  };
}

class Data {
  dynamic id;
  dynamic name;
  dynamic phone;
  dynamic email;
  dynamic password;
  dynamic imgUrl;
  dynamic location;
  dynamic language;
  dynamic ipAddress;
  DateTime? createdOn;

  Data({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.imgUrl,
    this.location,
    this.language,
    this.ipAddress,
    this.createdOn,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    imgUrl: json["img_url"],
    location: json["location"],
    language: json["language"],
    ipAddress: json["ip_address"],
    createdOn: DateTime.parse(json["created_on"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "img_url": imgUrl,
    "location": location,
    "language": language,
    "ip_address": ipAddress,
    "created_on": createdOn!.toIso8601String(),
  };
}
