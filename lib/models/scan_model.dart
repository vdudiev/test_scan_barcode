// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

class ScanModelAdapter extends TypeAdapter<ScanModel> {
  final int _typeId = 0;
  @override
  ScanModel read(BinaryReader reader) {
    final scan = reader.readString();
    final scanDate = reader.readString();
    return ScanModel(scan: scan, scanDate: scanDate);
  }

  @override
  int get typeId => _typeId;

  @override
  void write(BinaryWriter writer, ScanModel obj) {
    writer.writeString(obj.scan);
    writer.writeString(obj.scanDate);
  }
}

class ScanModel {
  final String scan;
  final String scanDate;
  ScanModel({
    required this.scan,
    required this.scanDate,
  });

  ScanModel copyWith({
    String? scan,
    String? scanDate,
  }) {
    return ScanModel(
      scan: scan ?? this.scan,
      scanDate: scanDate ?? this.scanDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scan': scan,
      'scanDate': scanDate,
    };
  }

  factory ScanModel.fromMap(Map<String, dynamic> map) {
    return ScanModel(
      scan: map['scan'] as String,
      scanDate: map['scanDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScanModel.fromJson(String source) =>
      ScanModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ScanModel(scan: $scan, scanDate: $scanDate)';

  @override
  bool operator ==(covariant ScanModel other) {
    if (identical(this, other)) return true;

    return other.scan == scan && other.scanDate == scanDate;
  }

  @override
  int get hashCode => scan.hashCode ^ scanDate.hashCode;
}
