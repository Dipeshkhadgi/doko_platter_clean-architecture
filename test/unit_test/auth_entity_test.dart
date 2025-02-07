import 'package:flutter_test/flutter_test.dart';
import 'package:doko_platter/feature/auth/domain/entity/auth_entity.dart';

void main() {
  group('AuthEntity', () {
    test('should create an AuthEntity instance with required fields', () {
      const authEntity = AuthEntity(
        fName: 'Dipesh',
        lName: 'Khadgi',
        email: 'd8khadgi@gmail.com',
        phoneNo: '9849516237',
        address: 'Kathmandu',
        username: 'Dipesh',
        password: '1234',
      );

      expect(authEntity.fName, 'Dipesh');
      expect(authEntity.lName, 'Khadgi');
      expect(authEntity.email, 'd8khadgi@gmail.com');
      expect(authEntity.phoneNo, '9849516237');
      expect(authEntity.address, 'Kathmandu');
      expect(authEntity.username, 'Dipesh');
      expect(authEntity.password, '1234');
      expect(authEntity.image, isNull);
      expect(authEntity.userId, isNull);
    });

    test('should handle nullable fields for userId and image', () {
      const authEntity = AuthEntity(
        fName: 'motu',
        lName: 'Shrestha',
        email: 'motushrestha@gmail.com',
        phoneNo: '98989898',
        address: 'Kathmandu',
        username: 'Motu',
        password: '1234',
      );

      expect(authEntity.userId, isNull);
      expect(authEntity.image, isNull);
    });

    test('should compare equal for two identical instances', () {
      const authEntity1 = AuthEntity(
        fName: 'adam',
        lName: 'Shrestha',
        email: 'adamshrestha@gmail.com',
        phoneNo: '123456789',
        address: 'Teku',
        username: 'Adam',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        fName: 'adam',
        lName: 'Shrestha',
        email: 'adamshrestha@gmail.com',
        phoneNo: '123456789',
        address: 'Teku',
        username: 'Adam',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should compare not equal for different instances', () {
      const authEntity1 = AuthEntity(
        fName: 'Shrestha',
        lName: 'Shrestha',
        email: 'Shrestha@gmail.com',
        phoneNo: '123456789',
        address: 'Kathmandu',
        username: 'shrestha',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        fName: 'John',
        lName: 'cena',
        email: 'jojhcena@example.com',
        phoneNo: '9876544444',
        address: '45bazar',
        username: 'johncena',
        password: 'password',
      );

      expect(authEntity1, isNot(equals(authEntity2)));
    });

    test('should ensure equality for userId field', () {
      const authEntity1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should ensure inequality for userId field', () {
      const authEntity1 = AuthEntity(
        userId: '123',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        userId: '124',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, isNot(equals(authEntity2)));
    });

    test('should ensure equality for image field', () {
      const authEntity1 = AuthEntity(
        image: 'profile1.jpg',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      const authEntity2 = AuthEntity(
        image: 'profile1.jpg',
        fName: 'John',
        lName: 'Doe',
        email: 'john.doe@example.com',
        phoneNo: '123456789',
        address: '123 Main St',
        username: 'johndoe',
        password: 'password123',
      );

      expect(authEntity1, equals(authEntity2));
    });

    test('should handle empty strings for all fields', () {
      const authEntity = AuthEntity(
        fName: '',
        lName: '',
        email: '',
        phoneNo: '',
        address: '',
        username: '',
        password: '',
      );

      expect(authEntity.fName, '');
      expect(authEntity.lName, '');
      expect(authEntity.email, '');
      expect(authEntity.phoneNo, '');
      expect(authEntity.address, '');
      expect(authEntity.username, '');
      expect(authEntity.password, '');
    });

    test('should handle null values for optional fields', () {
      const authEntity = AuthEntity(
        fName: 'Alice',
        lName: 'Smith',
        email: 'alice.smith@example.com',
        phoneNo: '987654321',
        address: '789 Some St',
        username: 'alicesmith',
        password: 'password789',
        image: null,
      );

      expect(authEntity.image, isNull);
    });

    test('should handle instance creation with a userId', () {
      const authEntity = AuthEntity(
        userId: '1001',
        fName: 'Bob',
        lName: 'Brown',
        email: 'bob.brown@example.com',
        phoneNo: '1122334455',
        address: '101 Some St',
        username: 'bobbrown',
        password: 'securepassword',
      );

      expect(authEntity.userId, '1001');
    });
  });
}
