import 'dart:convert';

import 'package:collection/collection.dart';

class BreedWeight {
  String? imperial;
  String? metric;

  BreedWeight({this.imperial, this.metric});

  @override
  String toString() => 'BreedWeight(imperial: $imperial, metric: $metric)';

  factory BreedWeight.fromMap(Map<String, dynamic> data) => BreedWeight(
        imperial: data['imperial'] as String?,
        metric: data['metric'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'imperial': imperial,
        'metric': metric,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BreedWeight].
  factory BreedWeight.fromJson(String data) {
    return BreedWeight.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BreedWeight] to a JSON string.
  String toJson() => json.encode(toMap());

  BreedWeight copyWith({
    String? imperial,
    String? metric,
  }) {
    return BreedWeight(
      imperial: imperial ?? this.imperial,
      metric: metric ?? this.metric,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BreedWeight) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => imperial.hashCode ^ metric.hashCode;
}
