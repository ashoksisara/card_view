class PropertyModel {
  PropertyModel({
      this.status, 
      this.message, 
      this.data,});

  PropertyModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.properties, 
      this.count, 
      this.propertyIds,});

  Data.fromJson(dynamic json) {
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(Properties.fromJson(v));
      });
    }
    count = json['count'];
    propertyIds = json['property_ids'] != null ? json['property_ids'].cast<num>() : [];
  }
  List<Properties>? properties;
  num? count;
  List<num>? propertyIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (properties != null) {
      map['properties'] = properties?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['property_ids'] = propertyIds;
    return map;
  }

}

class Properties {
  Properties({
      this.id, 
      this.userId, 
      this.addressStreetName, 
      this.addressArea, 
      this.addressCity, 
      this.addressPostcode, 
      this.addressCountry, 
      this.addressCityCode, 
      this.addressCountryCode, 
      this.latitude, 
      this.longitude, 
      this.propertyType, 
      this.listingType, 
      this.roomType, 
      this.monthlyPrice, 
      this.personPrice, 
      this.bedrooms, 
      this.bathrooms, 
      this.moveInDate, 
      this.lengthOfStay, 
      this.type, 
      this.isSuitableForStudent, 
      this.depositAmount, 
      this.currentFlatmates, 
      this.flatmateGender, 
      this.floorPlan, 
      this.description, 
      this.slug, 
      this.nearestLatitude, 
      this.nearestLongitude, 
      this.nearestLocation, 
      this.nearestLocationTime, 
      this.nearestLocationType, 
      this.createdBy, 
      this.updatedBy, 
      this.createdAt, 
      this.updatedAt, 
      this.deletedAt, 
      this.propertyUrl, 
      this.status, 
      this.isFreeToContact, 
      this.freeToContact, 
      this.freeWithinDays, 
      this.user, 
      this.propertyVideos, 
      this.propertyImages, 
      this.propertyFloorPlans, 
      this.keyFeatures,});

  Properties.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    addressStreetName = json['address_street_name'];
    addressArea = json['address_area'];
    addressCity = json['address_city'];
    addressPostcode = json['address_postcode'];
    addressCountry = json['address_country'];
    addressCityCode = json['address_city_code'];
    addressCountryCode = json['address_country_code'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    propertyType = json['property_type'];
    listingType = json['listing_type'];
    roomType = json['room_type'];
    monthlyPrice = json['monthly_price'];
    personPrice = json['person_price'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    moveInDate = json['move_in_date'];
    lengthOfStay = json['length_of_stay'];
    type = json['type'];
    isSuitableForStudent = json['is_suitable_for_student'];
    depositAmount = json['deposit_amount'];
    currentFlatmates = json['current_flatmates'];
    flatmateGender = json['flatmate_gender'];
    floorPlan = json['floor_plan'];
    description = json['description'];
    slug = json['slug'];
    nearestLatitude = json['nearest_latitude'];
    nearestLongitude = json['nearest_longitude'];
    nearestLocation = json['nearest_location'];
    nearestLocationTime = json['nearest_location_time'];
    nearestLocationType = json['nearest_location_type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    propertyUrl = json['property_url'];
    status = json['status'];
    isFreeToContact = json['is_free_to_contact'];
    freeToContact = json['free_to_contact'];
    freeWithinDays = json['free_within_days'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['property_videos'] != null) {
      propertyVideos = [];
      json['property_videos'].forEach((v) {
        propertyVideos?.add(PropertyVideos.fromJson(v));
      });
    }
    if (json['property_images'] != null) {
      propertyImages = [];
      json['property_images'].forEach((v) {
        propertyImages?.add(PropertyImages.fromJson(v));
      });
    }
    if (json['property_floor_plans'] != null) {
      propertyFloorPlans = [];
      json['property_floor_plans'].forEach((v) {
        propertyFloorPlans?.add(v);
      });
    }
    if (json['key_features'] != null) {
      keyFeatures = [];
      json['key_features'].forEach((v) {
        keyFeatures?.add(KeyFeatures.fromJson(v));
      });
    }
  }
  num? id;
  num? userId;
  String? addressStreetName;
  String? addressArea;
  String? addressCity;
  String? addressPostcode;
  dynamic addressCountry;
  dynamic addressCityCode;
  String? addressCountryCode;
  num? latitude;
  num? longitude;
  String? propertyType;
  String? listingType;
  String? roomType;
  num? monthlyPrice;
  num? personPrice;
  num? bedrooms;
  num? bathrooms;
  String? moveInDate;
  String? lengthOfStay;
  String? type;
  num? isSuitableForStudent;
  num? depositAmount;
  num? currentFlatmates;
  dynamic flatmateGender;
  dynamic floorPlan;
  String? description;
  String? slug;
  num? nearestLatitude;
  num? nearestLongitude;
  String? nearestLocation;
  String? nearestLocationTime;
  String? nearestLocationType;
  num? createdBy;
  num? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? propertyUrl;
  String? status;
  bool? isFreeToContact;
  String? freeToContact;
  String? freeWithinDays;
  User? user;
  List<PropertyVideos>? propertyVideos;
  List<PropertyImages>? propertyImages;
  List<dynamic>? propertyFloorPlans;
  List<KeyFeatures>? keyFeatures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['address_street_name'] = addressStreetName;
    map['address_area'] = addressArea;
    map['address_city'] = addressCity;
    map['address_postcode'] = addressPostcode;
    map['address_country'] = addressCountry;
    map['address_city_code'] = addressCityCode;
    map['address_country_code'] = addressCountryCode;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['property_type'] = propertyType;
    map['listing_type'] = listingType;
    map['room_type'] = roomType;
    map['monthly_price'] = monthlyPrice;
    map['person_price'] = personPrice;
    map['bedrooms'] = bedrooms;
    map['bathrooms'] = bathrooms;
    map['move_in_date'] = moveInDate;
    map['length_of_stay'] = lengthOfStay;
    map['type'] = type;
    map['is_suitable_for_student'] = isSuitableForStudent;
    map['deposit_amount'] = depositAmount;
    map['current_flatmates'] = currentFlatmates;
    map['flatmate_gender'] = flatmateGender;
    map['floor_plan'] = floorPlan;
    map['description'] = description;
    map['slug'] = slug;
    map['nearest_latitude'] = nearestLatitude;
    map['nearest_longitude'] = nearestLongitude;
    map['nearest_location'] = nearestLocation;
    map['nearest_location_time'] = nearestLocationTime;
    map['nearest_location_type'] = nearestLocationType;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['property_url'] = propertyUrl;
    map['status'] = status;
    map['is_free_to_contact'] = isFreeToContact;
    map['free_to_contact'] = freeToContact;
    map['free_within_days'] = freeWithinDays;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (propertyVideos != null) {
      map['property_videos'] = propertyVideos?.map((v) => v.toJson()).toList();
    }
    if (propertyImages != null) {
      map['property_images'] = propertyImages?.map((v) => v.toJson()).toList();
    }
    if (propertyFloorPlans != null) {
      map['property_floor_plans'] = propertyFloorPlans?.map((v) => v.toJson()).toList();
    }
    if (keyFeatures != null) {
      map['key_features'] = keyFeatures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class KeyFeatures {
  KeyFeatures({
      this.id, 
      this.type, 
      this.name, 
      this.darkIcon, 
      this.colorIcon, 
      this.darkIconUrl, 
      this.colorIconUrl, 
      this.pivot,});

  KeyFeatures.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    darkIcon = json['dark_icon'];
    colorIcon = json['color_icon'];
    darkIconUrl = json['dark_icon_url'];
    colorIconUrl = json['color_icon_url'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
  num? id;
  String? type;
  String? name;
  String? darkIcon;
  String? colorIcon;
  String? darkIconUrl;
  String? colorIconUrl;
  Pivot? pivot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['name'] = name;
    map['dark_icon'] = darkIcon;
    map['color_icon'] = colorIcon;
    map['dark_icon_url'] = darkIconUrl;
    map['color_icon_url'] = colorIconUrl;
    if (pivot != null) {
      map['pivot'] = pivot?.toJson();
    }
    return map;
  }

}

class Pivot {
  Pivot({
      this.propertyId, 
      this.keyFeatureId,});

  Pivot.fromJson(dynamic json) {
    propertyId = json['property_id'];
    keyFeatureId = json['key_feature_id'];
  }
  num? propertyId;
  num? keyFeatureId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = propertyId;
    map['key_feature_id'] = keyFeatureId;
    return map;
  }

}

class PropertyImages {
  PropertyImages({
      this.id, 
      this.userId, 
      this.propertyId, 
      this.path, 
      this.type, 
      this.thumbnail,});

  PropertyImages.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    path = json['path'];
    type = json['type'];
    thumbnail = json['thumbnail'];
  }
  num? id;
  num? userId;
  num? propertyId;
  String? path;
  String? type;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['property_id'] = propertyId;
    map['path'] = path;
    map['type'] = type;
    map['thumbnail'] = thumbnail;
    return map;
  }

}

class PropertyVideos {
  PropertyVideos({
      this.id, 
      this.userId, 
      this.propertyId, 
      this.path, 
      this.type, 
      this.thumbnail,});

  PropertyVideos.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    propertyId = json['property_id'];
    path = json['path'];
    type = json['type'];
    thumbnail = json['thumbnail'];
  }
  num? id;
  num? userId;
  num? propertyId;
  String? path;
  String? type;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['property_id'] = propertyId;
    map['path'] = path;
    map['type'] = type;
    map['thumbnail'] = thumbnail;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.profileImage, 
      this.name, 
      this.profileImageUrl,});

  User.fromJson(dynamic json) {
    id = json['id'];
    profileImage = json['profile_image'];
    name = json['name'];
    profileImageUrl = json['profile_image_url'];
  }
  num? id;
  String? profileImage;
  String? name;
  String? profileImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['profile_image'] = profileImage;
    map['name'] = name;
    map['profile_image_url'] = profileImageUrl;
    return map;
  }

}