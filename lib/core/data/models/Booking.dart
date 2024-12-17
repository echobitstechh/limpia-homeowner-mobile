class Booking {
  final String id;
  final String? images;
  final String status;
  final String propertyType;
  final String? cleanerId;
  final String propertyId;
  final String numberOfRooms;
  final String numberOfBathrooms;
  final String? rescheduleReason;
  final String? cancelReason;
  final String cleanerPreferences;
  final String staffingType;
  final String? cleaningType;
  final DateTime cleaningTime;
  final ChecklistDetails checklistDetails;
  final double? price;
  final String? paymentStatus;
  final String bookingStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Property property;

  Booking({
    required this.id,
    this.images,
    required this.status,
    required this.propertyType,
    this.cleanerId,
    required this.propertyId,
    required this.numberOfRooms,
    required this.numberOfBathrooms,
    this.rescheduleReason,
    this.cancelReason,
    required this.cleanerPreferences,
    required this.staffingType,
    this.cleaningType,
    required this.cleaningTime,
    required this.checklistDetails,
    this.price,
    this.paymentStatus,
    required this.bookingStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.property,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      images: json['images'],
      status: json['status'],
      propertyType: json['propertyType'],
      cleanerId: json['cleanerId'],
      propertyId: json['propertyId'],
      numberOfRooms: json['numberOfRooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      rescheduleReason: json['rescheduleReason'],
      cancelReason: json['cancelReason'],
      cleanerPreferences: json['cleanerPreferences'],
      staffingType: json['staffingType'],
      cleaningType: json['cleaningType'],
      cleaningTime: DateTime.parse(json['cleaningTime']),
      checklistDetails: ChecklistDetails.fromJson(json['checklistDetails']),
      price: json['price'] != null ? double.tryParse(json['price'].toString()) : null,
      paymentStatus: json['paymentStatus'],
      bookingStatus: json['bookingStatus'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      property: Property.fromJson(json['property']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
      'status': status,
      'propertyType': propertyType,
      'cleanerId': cleanerId,
      'propertyId': propertyId,
      'numberOfRooms': numberOfRooms,
      'numberOfBathrooms': numberOfBathrooms,
      'rescheduleReason': rescheduleReason,
      'cancelReason': cancelReason,
      'cleanerPreferences': cleanerPreferences,
      'staffingType': staffingType,
      'cleaningType': cleaningType,
      'cleaningTime': cleaningTime.toIso8601String(),
      'checklistDetails': checklistDetails.toJson(),
      'price': price,
      'paymentStatus': paymentStatus,
      'bookingStatus': bookingStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'property': property.toJson(),
    };
  }
}

class ChecklistDetails {
  final List<Task> kitchenTasks;
  final List<Task> bathroomTasks;
  final List<Task> generalAreasTasks;

  ChecklistDetails({
    required this.kitchenTasks,
    required this.bathroomTasks,
    required this.generalAreasTasks,
  });

  factory ChecklistDetails.fromJson(Map<String, dynamic> json) {
    return ChecklistDetails(
      kitchenTasks: (json['kitchenTasks'] as List).map((e) => Task.fromJson(e)).toList(),
      bathroomTasks: (json['bathroomTasks'] as List).map((e) => Task.fromJson(e)).toList(),
      generalAreasTasks: (json['generalAreasTasks'] as List).map((e) => Task.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kitchenTasks': kitchenTasks.map((e) => e.toJson()).toList(),
      'bathroomTasks': bathroomTasks.map((e) => e.toJson()).toList(),
      'generalAreasTasks': generalAreasTasks.map((e) => e.toJson()).toList(),
    };
  }
}

class Task {
  final String taskName;
  final bool completed;

  Task({required this.taskName, required this.completed});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskName: json['taskName'],
      completed: json['completed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskName': taskName,
      'completed': completed,
    };
  }
}

class Property {
  final String id;
  final String type;
  final String nameOfProperty;
  final String? numberOfUnits;
  final String? numberOfRooms;
  final String? numberOfBathrooms;
  final String addressId;
  final String? images;
  final String status;
  final String ownerId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Address address;

  Property({
    required this.id,
    required this.type,
    required this.nameOfProperty,
    this.numberOfUnits,
    this.numberOfRooms,
    this.numberOfBathrooms,
    required this.addressId,
    this.images,
    required this.status,
    required this.ownerId,
    required this.createdAt,
    required this.updatedAt,
    required this.address,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      type: json['type'],
      nameOfProperty: json['nameOfProperty'],
      numberOfUnits: json['numberOfUnits'],
      numberOfRooms: json['numberOfRooms'],
      numberOfBathrooms: json['numberOfBathrooms'],
      addressId: json['addressId'],
      images: json['images'],
      status: json['status'],
      ownerId: json['ownerId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      address: Address.fromJson(json['address']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'nameOfProperty': nameOfProperty,
      'numberOfUnits': numberOfUnits,
      'numberOfRooms': numberOfRooms,
      'numberOfBathrooms': numberOfBathrooms,
      'addressId': addressId,
      'images': images,
      'status': status,
      'ownerId': ownerId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'address': address.toJson(),
    };
  }
}

class Address {
  final String id;
  final String address;
  final String street;
  final String? unitNumber;
  final String city;
  final Location location;
  final String state;
  final String country;
  final String zipCode;
  final DateTime createdAt;
  final DateTime updatedAt;

  Address({
    required this.id,
    required this.address,
    required this.street,
    this.unitNumber,
    required this.city,
    required this.location,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      address: json['address'],
      street: json['street'],
      unitNumber: json['unitNumber'],
      city: json['city'],
      location: Location.fromJson(json['location']),
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'street': street,
      'unitNumber': unitNumber,
      'city': city,
      'location': location.toJson(),
      'state': state,
      'country': country,
      'zipCode': zipCode,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Location {
  final double lat;
  final double long;

  Location({required this.lat, required this.long});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: double.parse(json['lat'].toString()),
      long: double.parse(json['long'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }
}
