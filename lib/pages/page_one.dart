import 'package:flutter/material.dart';
import 'package:state_management_app/models/user_model.dart';

import '../services/user_service.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            return snapshot.hasData
                ? UserInformation(user: snapshot.data!)
                : const Center(
                    child: Text('No user information'),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
        child: const Icon(Icons.star_border_purple500_rounded),
      ),
    );
  }
}

class UserInformation extends StatelessWidget {
  const UserInformation({
    required this.user,
    super.key,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Name: ${user.name}'),
          ),
          ListTile(
            title: Text('Age: ${user.age ?? '(not registered)'}'),
          ),
          const Text(
            'Professions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Profession 1 '),
          ),
          const ListTile(
            title: Text('Profession 2 '),
          ),
        ],
      ),
    );
  }
}
