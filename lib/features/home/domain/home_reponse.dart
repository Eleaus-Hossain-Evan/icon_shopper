import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'model/category_model.dart';
import 'model/slider_model.dart';
import 'new_arrival_response.dart';

class HomeResponse extends Equatable {
  final bool success;
  final List<CategoryModel> categories;
  final NewArrivalResponse newArrival;
  final List<SliderModel> slider;
  final String alternativeSlider;

  const HomeResponse({
    required this.success,
    required this.categories,
    required this.newArrival,
    required this.slider,
    required this.alternativeSlider,
  });

  HomeResponse copyWith({
    bool? success,
    List<CategoryModel>? data,
    NewArrivalResponse? newArrival,
    List<SliderModel>? slider,
    String? alternativeSlider,
  }) {
    return HomeResponse(
      success: success ?? this.success,
      categories: data ?? categories,
      newArrival: newArrival ?? this.newArrival,
      slider: slider ?? this.slider,
      alternativeSlider: alternativeSlider ?? this.alternativeSlider,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': categories.map((x) => x.toMap()).toList(),
      'new_arrival': newArrival.toMap(),
      'slider': slider.map((x) => x.toMap()).toList(),
      'alternative_slider': alternativeSlider,
    };
  }

  factory HomeResponse.fromMap(Map<String, dynamic> map) {
    return HomeResponse(
      success: map['success'] ?? false,
      categories: List<CategoryModel>.from(
          map['data']?.map((x) => CategoryModel.fromMap(x)) ?? const []),
      newArrival: NewArrivalResponse.fromMap(map['new_arrival']),
      slider: List<SliderModel>.from(
          map['slider']?.map((x) => SliderModel.fromMap(x)) ?? const []),
      alternativeSlider: map['alternative_slider'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeResponse.fromJson(String source) =>
      HomeResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeResponse(success: $success, data: $categories, new_arrival: $newArrival, slider: $slider, alternative_slider: $alternativeSlider)';
  }

  @override
  List<Object> get props {
    return [
      success,
      categories,
      newArrival,
      slider,
      alternativeSlider,
    ];
  }
}
