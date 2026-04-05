class ByokKey {
  final String id;
  final String providerId;
  final String providerName;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;

  const ByokKey({
    required this.id,
    required this.providerId,
    required this.providerName,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  factory ByokKey.fromJson(Map<String, dynamic> json) {
    return ByokKey(
      id: json['id'] as String,
      providerId: json['provider_id'] as String,
      providerName: json['provider_name'] as String? ?? json['provider_id'] as String,
      isEnabled: json['is_enabled'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdBy: json['created_by'] as String,
    );
  }

  ByokKey copyWith({
    String? id,
    String? providerId,
    String? providerName,
    bool? isEnabled,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
  }) {
    return ByokKey(
      id: id ?? this.id,
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      isEnabled: isEnabled ?? this.isEnabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }
}

class ByokSupportedModels {
  final Map<String, List<String>> models;

  const ByokSupportedModels({required this.models});

  factory ByokSupportedModels.fromJson(Map<String, dynamic> json) {
    final result = <String, List<String>>{};
    for (final entry in json.entries) {
      result[entry.key] = (entry.value as List).map((e) => e.toString()).toList();
    }
    return ByokSupportedModels(models: result);
  }

  List<String> get providers => models.keys.toList()..sort();
}

class ByokTestResult {
  final bool success;
  final String message;

  const ByokTestResult({required this.success, required this.message});

  factory ByokTestResult.fromJson(Map<String, dynamic> json) {
    return ByokTestResult(
      success: json['success'] as bool,
      message: json['message'] as String,
    );
  }
}
