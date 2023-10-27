// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemModel {
  String itemId;
  String itemName;
  String itemPrice;
  String itemImage;
  String timeQuery;
  String itemType;
  ItemModel({
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.itemImage,
    required this.timeQuery,
    required this.itemType,
  });

  ItemModel copyWith({
    String? itemId,
    String? itemName,
    String? itemPrice,
    String? itemImage,
    String? timeQuery,
    String? itemType,
  }) {
    return ItemModel(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemPrice: itemPrice ?? this.itemPrice,
      itemImage: itemImage ?? this.itemImage,
      timeQuery: timeQuery ?? this.timeQuery,
      itemType: itemType ?? this.itemType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemId': itemId,
      'itemName': itemName,
      'itemPrice': itemPrice,
      'itemImage': itemImage,
      'timeQuery': timeQuery,
      'itemType': itemType,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      itemId: map['itemId'] as String,
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as String,
      itemImage: map['itemImage'] as String,
      timeQuery: map['timeQuery'] as String,
      itemType: map['itemType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemModel(itemId: $itemId, itemName: $itemName, itemPrice: $itemPrice, itemImage: $itemImage, timeQuery: $timeQuery, itemType: $itemType)';
  }

  @override
  bool operator ==(covariant ItemModel other) {
    if (identical(this, other)) return true;

    return other.itemId == itemId &&
        other.itemName == itemName &&
        other.itemPrice == itemPrice &&
        other.itemImage == itemImage &&
        other.timeQuery == timeQuery &&
        other.itemType == itemType;
  }

  @override
  int get hashCode {
    return itemId.hashCode ^
        itemName.hashCode ^
        itemPrice.hashCode ^
        itemImage.hashCode ^
        timeQuery.hashCode ^
        itemType.hashCode;
  }
}
