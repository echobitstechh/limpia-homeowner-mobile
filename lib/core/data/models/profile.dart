import 'package:limpia/core/data/models/country.dart';
import 'package:limpia/core/data/models/discount.dart';
import 'package:limpia/core/data/models/product.dart';

class Profile {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? status;
  Address? address;
  String? token;
  String? refreshToken;
  String? createdAt;
  String? updatedAt;

  Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.status,
    this.address,
    this.token,
    this.refreshToken,
    this.createdAt,
    this.updatedAt,
  });

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    role = json['role'];
    status = json['status'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    token = json['token'];
    refreshToken = json['refreshToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['status'] = status;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Address {
  String? id;
  String? address;
  String? street;
  String? unitNumber;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  Location? location;
  String? createdAt;
  String? updatedAt;

  Address({
    this.id,
    this.address,
    this.street,
    this.unitNumber,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.location,
    this.createdAt,
    this.updatedAt,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    street = json['street'];
    unitNumber = json['unitNumber'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipCode = json['zipCode'];
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['street'] = street;
    data['unitNumber'] = unitNumber;
    data['city'] = city;
    data['state'] = state;
    data['country'] = country;
    data['zipCode'] = zipCode;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Location {
  double? lat;
  double? long;

  Location({this.lat, this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    return data;
  }
}

// Model for NotificationPreferences
class NotificationPreferences {
  bool? platformNotifications;
  bool? appNotifications;
  bool? generalNotifications;
  String? id;

  NotificationPreferences({
    this.platformNotifications,
    this.appNotifications,
    this.generalNotifications,
    this.id,
  });

  NotificationPreferences.fromJson(Map<String, dynamic> json) {
    platformNotifications = json['platform_notifications'];
    appNotifications = json['app_notifications'];
    generalNotifications = json['general_notifications'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['platform_notifications'] = platformNotifications;
    data['app_notifications'] = appNotifications;
    data['general_notifications'] = generalNotifications;
    data['_id'] = id;
    return data;
  }
}


class Wallet {
  String? id;
  int? balance;
  String? created;
  String? updated;

  Wallet({this.id, this.balance, this.created, this.updated});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['balance'] = balance;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }
}

class Shipping {
  String? id;
  String? shippingFirstname;
  String? shippingLastname;
  String? shippingPhone;
  String? shippingAdditionalPhone;
  String? shippingAddress;
  String? shippingAdditionalAddress;
  String? shippingState;
  String? shippingCity;
  int? shippingZipCode;
  bool? isDefault;

  Shipping(
      {this.id,
      this.shippingFirstname,
      this.shippingLastname,
      this.shippingPhone,
      this.shippingAdditionalPhone,
      this.shippingAddress,
      this.shippingAdditionalAddress,
      this.shippingState,
      this.isDefault,
      this.shippingCity,
      this.shippingZipCode});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingFirstname = json['shipping_firstname'];
    shippingLastname = json['shipping_lastname'];
    shippingPhone = json['shipping_phone'];
    shippingAdditionalPhone = json['shipping_additional_phone'];
    shippingAddress = json['shipping_address'];
    isDefault = json['default'];
    shippingAdditionalAddress = json['shipping_additional_address'];
    shippingState = json['shipping_state'];
    shippingCity = json['shipping_city'];
    shippingZipCode = json['shipping_zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shipping_firstname'] = shippingFirstname;
    data['shipping_lastname'] = shippingLastname;
    data['shipping_phone'] = shippingPhone;
    data['shipping_additional_phone'] = shippingAdditionalPhone;
    data['shipping_address'] = shippingAddress;
    data['default'] = isDefault;
    data['shipping_additional_address'] = shippingAdditionalAddress;
    data['shipping_state'] = shippingState;
    data['shipping_city'] = shippingCity;
    data['shipping_zip_code'] = shippingZipCode;
    return data;
  }
}
