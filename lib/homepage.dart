// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'user.dart';
import 'network_service.dart';
import 'profile_card.dart';
import 'user_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _profiles = [];
  late TCardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TCardController();
    _loadProfiles();
  }

  void _loadProfiles() async {
    try {
      List<User> profiles = await UserRepository().fetchUsers();
      setState(() {
        _profiles = profiles;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tinder Clone')),
      body: Center(
        child: _profiles.isEmpty
            ? CircularProgressIndicator()
            : TCard(
                controller: _controller,
                cards: _profiles
                    .map((profile) => ProfileCard(profile: profile))
                    .toList(),
                size: Size(400, 600),
                onForward: (index, info) {
                  // Handle swipe action (like/dislike)
                },
                onBack: (index, info) {
                  // Handle swipe back action
                },
                onEnd: () {
                  // Handle when all cards are swiped
                },
              ),
      ),
    );
  }
}
