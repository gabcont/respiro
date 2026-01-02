import 'package:isar/isar.dart';

part 'tag_model.g.dart';

@collection
class Tag {
  Id id = Isar.autoIncrement;

  String? rawName;
  String? localizationKey;

  Tag({
    this.rawName,
    this.localizationKey,
  });
}
