import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class MyModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  bool title;

  MyModel({
    required this.id,
    required this.title,
  });
}

class MyModelAdapter extends TypeAdapter<MyModel> {
  @override
  final typeId = 0;

  @override
  MyModel read(BinaryReader reader) {
    return MyModel(
      id: reader.read(),
      title: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, MyModel obj) {
    writer.write(obj.id);
    writer.write(obj.title);
  }
}
