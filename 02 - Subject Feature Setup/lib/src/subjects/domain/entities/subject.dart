import 'package:classy/config/config.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kSubjectTableName)
class Subject extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;

  const Subject({this.id, required this.name});

  @override
  List<Object?> get props => [id, name];

  @override
  bool get stringify => true;
}
