import 'dart:convert';

import 'package:collection/collection.dart';

import 'weight.dart';

class BreedModel {
  BreedWeight? weight;
  String? id;
  String? name;
  String? cfaUrl;
  String? vetstreetUrl;
  String? vcahospitalsUrl;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;

  BreedModel({
    this.weight,
    this.id,
    this.name,
    this.cfaUrl,
    this.vetstreetUrl,
    this.vcahospitalsUrl,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
  });

  @override
  String toString() {
    return 'BreedModel(weight: $weight, id: $id, name: $name, cfaUrl: $cfaUrl, vetstreetUrl: $vetstreetUrl, vcahospitalsUrl: $vcahospitalsUrl, temperament: $temperament, origin: $origin, countryCodes: $countryCodes, countryCode: $countryCode, description: $description, lifeSpan: $lifeSpan, indoor: $indoor, lap: $lap, altNames: $altNames, adaptability: $adaptability, affectionLevel: $affectionLevel, childFriendly: $childFriendly, dogFriendly: $dogFriendly, energyLevel: $energyLevel, grooming: $grooming, healthIssues: $healthIssues, intelligence: $intelligence, sheddingLevel: $sheddingLevel, socialNeeds: $socialNeeds, strangerFriendly: $strangerFriendly, vocalisation: $vocalisation, experimental: $experimental, hairless: $hairless, natural: $natural, rare: $rare, rex: $rex, suppressedTail: $suppressedTail, shortLegs: $shortLegs, wikipediaUrl: $wikipediaUrl, hypoallergenic: $hypoallergenic, referenceImageId: $referenceImageId)';
  }

  String getImageUrl() {
    return "https://cdn2.thecatapi.com/images/$referenceImageId.jpg";
  }

  factory BreedModel.fromMap(Map<String, dynamic> data) => BreedModel(
        weight: data['weight'] == null
            ? null
            : BreedWeight.fromMap(data['weight'] as Map<String, dynamic>),
        id: data['id'] as String?,
        name: data['name'] as String?,
        cfaUrl: data['cfa_url'] as String?,
        vetstreetUrl: data['vetstreet_url'] as String?,
        vcahospitalsUrl: data['vcahospitals_url'] as String?,
        temperament: data['temperament'] as String?,
        origin: data['origin'] as String?,
        countryCodes: data['country_codes'] as String?,
        countryCode: data['country_code'] as String?,
        description: data['description'] as String?,
        lifeSpan: data['life_span'] as String?,
        indoor: data['indoor'] as int?,
        lap: data['lap'] as int?,
        altNames: data['alt_names'] as String?,
        adaptability: data['adaptability'] as int?,
        affectionLevel: data['affection_level'] as int?,
        childFriendly: data['child_friendly'] as int?,
        dogFriendly: data['dog_friendly'] as int?,
        energyLevel: data['energy_level'] as int?,
        grooming: data['grooming'] as int?,
        healthIssues: data['health_issues'] as int?,
        intelligence: data['intelligence'] as int?,
        sheddingLevel: data['shedding_level'] as int?,
        socialNeeds: data['social_needs'] as int?,
        strangerFriendly: data['stranger_friendly'] as int?,
        vocalisation: data['vocalisation'] as int?,
        experimental: data['experimental'] as int?,
        hairless: data['hairless'] as int?,
        natural: data['natural'] as int?,
        rare: data['rare'] as int?,
        rex: data['rex'] as int?,
        suppressedTail: data['suppressed_tail'] as int?,
        shortLegs: data['short_legs'] as int?,
        wikipediaUrl: data['wikipedia_url'] as String?,
        hypoallergenic: data['hypoallergenic'] as int?,
        referenceImageId: data['reference_image_id'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'weight': weight?.toMap(),
        'id': id,
        'name': name,
        'cfa_url': cfaUrl,
        'vetstreet_url': vetstreetUrl,
        'vcahospitals_url': vcahospitalsUrl,
        'temperament': temperament,
        'origin': origin,
        'country_codes': countryCodes,
        'country_code': countryCode,
        'description': description,
        'life_span': lifeSpan,
        'indoor': indoor,
        'lap': lap,
        'alt_names': altNames,
        'adaptability': adaptability,
        'affection_level': affectionLevel,
        'child_friendly': childFriendly,
        'dog_friendly': dogFriendly,
        'energy_level': energyLevel,
        'grooming': grooming,
        'health_issues': healthIssues,
        'intelligence': intelligence,
        'shedding_level': sheddingLevel,
        'social_needs': socialNeeds,
        'stranger_friendly': strangerFriendly,
        'vocalisation': vocalisation,
        'experimental': experimental,
        'hairless': hairless,
        'natural': natural,
        'rare': rare,
        'rex': rex,
        'suppressed_tail': suppressedTail,
        'short_legs': shortLegs,
        'wikipedia_url': wikipediaUrl,
        'hypoallergenic': hypoallergenic,
        'reference_image_id': referenceImageId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [BreedModel].
  factory BreedModel.fromJson(String data) {
    return BreedModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [BreedModel] to a JSON string.
  String toJson() => json.encode(toMap());

  BreedModel copyWith({
    BreedWeight? weight,
    String? id,
    String? name,
    String? cfaUrl,
    String? vetstreetUrl,
    String? vcahospitalsUrl,
    String? temperament,
    String? origin,
    String? countryCodes,
    String? countryCode,
    String? description,
    String? lifeSpan,
    int? indoor,
    int? lap,
    String? altNames,
    int? adaptability,
    int? affectionLevel,
    int? childFriendly,
    int? dogFriendly,
    int? energyLevel,
    int? grooming,
    int? healthIssues,
    int? intelligence,
    int? sheddingLevel,
    int? socialNeeds,
    int? strangerFriendly,
    int? vocalisation,
    int? experimental,
    int? hairless,
    int? natural,
    int? rare,
    int? rex,
    int? suppressedTail,
    int? shortLegs,
    String? wikipediaUrl,
    int? hypoallergenic,
    String? referenceImageId,
  }) {
    return BreedModel(
      weight: weight ?? this.weight,
      id: id ?? this.id,
      name: name ?? this.name,
      cfaUrl: cfaUrl ?? this.cfaUrl,
      vetstreetUrl: vetstreetUrl ?? this.vetstreetUrl,
      vcahospitalsUrl: vcahospitalsUrl ?? this.vcahospitalsUrl,
      temperament: temperament ?? this.temperament,
      origin: origin ?? this.origin,
      countryCodes: countryCodes ?? this.countryCodes,
      countryCode: countryCode ?? this.countryCode,
      description: description ?? this.description,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      indoor: indoor ?? this.indoor,
      lap: lap ?? this.lap,
      altNames: altNames ?? this.altNames,
      adaptability: adaptability ?? this.adaptability,
      affectionLevel: affectionLevel ?? this.affectionLevel,
      childFriendly: childFriendly ?? this.childFriendly,
      dogFriendly: dogFriendly ?? this.dogFriendly,
      energyLevel: energyLevel ?? this.energyLevel,
      grooming: grooming ?? this.grooming,
      healthIssues: healthIssues ?? this.healthIssues,
      intelligence: intelligence ?? this.intelligence,
      sheddingLevel: sheddingLevel ?? this.sheddingLevel,
      socialNeeds: socialNeeds ?? this.socialNeeds,
      strangerFriendly: strangerFriendly ?? this.strangerFriendly,
      vocalisation: vocalisation ?? this.vocalisation,
      experimental: experimental ?? this.experimental,
      hairless: hairless ?? this.hairless,
      natural: natural ?? this.natural,
      rare: rare ?? this.rare,
      rex: rex ?? this.rex,
      suppressedTail: suppressedTail ?? this.suppressedTail,
      shortLegs: shortLegs ?? this.shortLegs,
      wikipediaUrl: wikipediaUrl ?? this.wikipediaUrl,
      hypoallergenic: hypoallergenic ?? this.hypoallergenic,
      referenceImageId: referenceImageId ?? this.referenceImageId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BreedModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      weight.hashCode ^
      id.hashCode ^
      name.hashCode ^
      cfaUrl.hashCode ^
      vetstreetUrl.hashCode ^
      vcahospitalsUrl.hashCode ^
      temperament.hashCode ^
      origin.hashCode ^
      countryCodes.hashCode ^
      countryCode.hashCode ^
      description.hashCode ^
      lifeSpan.hashCode ^
      indoor.hashCode ^
      lap.hashCode ^
      altNames.hashCode ^
      adaptability.hashCode ^
      affectionLevel.hashCode ^
      childFriendly.hashCode ^
      dogFriendly.hashCode ^
      energyLevel.hashCode ^
      grooming.hashCode ^
      healthIssues.hashCode ^
      intelligence.hashCode ^
      sheddingLevel.hashCode ^
      socialNeeds.hashCode ^
      strangerFriendly.hashCode ^
      vocalisation.hashCode ^
      experimental.hashCode ^
      hairless.hashCode ^
      natural.hashCode ^
      rare.hashCode ^
      rex.hashCode ^
      suppressedTail.hashCode ^
      shortLegs.hashCode ^
      wikipediaUrl.hashCode ^
      hypoallergenic.hashCode ^
      referenceImageId.hashCode;
}
