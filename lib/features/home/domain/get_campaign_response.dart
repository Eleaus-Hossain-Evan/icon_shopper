import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import 'model/campaign_model.dart';

class GetCampaignResponse extends Equatable {
  final String status;
  final IList<CampaignModel> campaigns;
  const GetCampaignResponse({
    required this.status,
    required this.campaigns,
  });

  GetCampaignResponse copyWith({
    String? status,
    IList<CampaignModel>? campaigns,
  }) {
    return GetCampaignResponse(
      status: status ?? this.status,
      campaigns: campaigns ?? this.campaigns,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'campaigns': campaigns.map((x) => x.toMap()).toList(),
    };
  }

  factory GetCampaignResponse.fromMap(Map<String, dynamic> map) {
    return GetCampaignResponse(
      status: map['status'] ?? '',
      campaigns: List<CampaignModel>.from(
              map['campaigns']?.map((x) => CampaignModel.fromMap(x)) ??
                  const [])
          .lock,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCampaignResponse.fromJson(String source) =>
      GetCampaignResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'GetCampaignResponse(status: $status, campaigns: $campaigns)';

  @override
  List<Object> get props => [status, campaigns];
}
