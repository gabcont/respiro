import 'package:isar/isar.dart';

import 'package:respiro/profiles/domain/models/step_model.dart';

part 'profile_model.g.dart';

@collection 
class BreathingProfile {

  Id id = Isar.autoIncrement;
  final String title;
  final String shortDescription;
  final String longDescription;
  final List<BreathingStep> steps;

  BreathingProfile({
    this.title = '',
    this.shortDescription = '',
    this.longDescription = '',
    this.steps = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'shortDescription': shortDescription,
      'longDescription': longDescription,
      'steps': steps.map((e) => e.toJson()).toList(),
    };
  }

  factory BreathingProfile.fromJson(Map<String, dynamic> json) {
    final profile = BreathingProfile(
      title: json['title'] as String? ?? '',
      shortDescription: json['shortDescription'] as String? ?? '',
      longDescription: json['longDescription'] as String? ?? '',
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => BreathingStep.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
    );
    if (json['id'] != null) {
      profile.id = json['id'] as int;
    }
    return profile;
  }
}

