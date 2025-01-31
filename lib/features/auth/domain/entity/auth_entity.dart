import 'package:equatable/equatable.dart';
import 'package:doko_platter/features/batch/domain/entity/batch_entity.dart';
import 'package:doko_platter/features/course/domain/entity/course_entity.dart';

class AuthEntity extends Equatable {
  final String? userId;
  final String fName;
  final String lName;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    this.userId,
    required this.fName,
    required this.lName,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [userId, fName, lName, image, phone, username, password];
}
