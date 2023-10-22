// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentData {
  String rollNo;
  String name;
  String phone;
  StudentData({
    required this.rollNo,
    required this.name,
    required this.phone,
  });

  StudentData copyWith({
    String? rollNo,
    String? name,
    String? phone,
  }) {
    return StudentData(
      rollNo: rollNo ?? this.rollNo,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollNo': rollNo,
      'name': name,
      'phone': phone,
    };
  }

  factory StudentData.fromMap(Map<String, dynamic> map) {
    return StudentData(
      rollNo: map['rollNo'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentData.fromJson(String source) =>
      StudentData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'StudentData(rollNo: $rollNo, name: $name, phone: $phone)';

  @override
  bool operator ==(covariant StudentData other) {
    if (identical(this, other)) return true;

    return other.rollNo == rollNo && other.name == name && other.phone == phone;
  }

  @override
  int get hashCode => rollNo.hashCode ^ name.hashCode ^ phone.hashCode;
}
