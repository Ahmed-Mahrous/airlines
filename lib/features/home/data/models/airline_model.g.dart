part of 'airline_model.dart';

class AirlineModelAdapter extends TypeAdapter<AirlineModel> {
  @override
  final int typeId = 0;

  @override
  AirlineModel read(BinaryReader reader) {
    return AirlineModel(
      name: reader.readString(),
      logo: reader.readString(),
      phone: reader.readString(),
      website: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, AirlineModel obj) {
    writer.writeString(obj.name);
    writer.writeString(obj.logo);
    writer.writeString(obj.phone);
    writer.writeString(obj.website);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AirlineModelAdapter && other.typeId == typeId;
  }

  @override
  int get hashCode => typeId.hashCode;
}
