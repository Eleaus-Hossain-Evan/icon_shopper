import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/contact_info_model.dart';

class ContactInfoResponse extends Equatable {
  final bool success;
  final ContactInfoModel data;
  const ContactInfoResponse({
    required this.success,
    required this.data,
  });

  ContactInfoResponse copyWith({
    bool? success,
    ContactInfoModel? data,
  }) {
    return ContactInfoResponse(
      success: success ?? this.success,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.toMap(),
    };
  }

  factory ContactInfoResponse.fromMap(Map<String, dynamic> map) {
    return ContactInfoResponse(
      success: map['success'] ?? false,
      data: ContactInfoModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactInfoResponse.fromJson(String source) =>
      ContactInfoResponse.fromMap(json.decode(source));

  @override
  String toString() => 'ContactInfoResponse(success: $success, data: $data)';

  @override
  List<Object> get props => [success, data];
}
