// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ItemFilterModel {
  String item;
  ItemFilterModel({
    required this.item,
  });

  ItemFilterModel copyWith({
    String? item,
  }) {
    return ItemFilterModel(
      item: item ?? this.item,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'item': item,
    };
  }

  factory ItemFilterModel.fromMap(Map<String, dynamic> map) {
    return ItemFilterModel(
      item: map['item'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemFilterModel.fromJson(String source) =>
      ItemFilterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemFilterModel(item: $item)';

  @override
  bool operator ==(covariant ItemFilterModel other) {
    if (identical(this, other)) return true;

    return other.item == item;
  }

  @override
  int get hashCode => item.hashCode;
}
