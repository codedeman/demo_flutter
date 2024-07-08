import 'network_service.dart';
import 'user.dart';
import 'dart:convert';

class UserRepository {
  final NetworkService networkService;

  UserRepository(this.networkService);

  Future<List<User>> fetchUsers() async {
    final response = await networkService
        .get('https://codedeman.github.io/ssd_api/tinder.json');
    final List<dynamic> data = json.decode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  }
}
