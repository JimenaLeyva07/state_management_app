import 'package:flutter/material.dart';
import 'package:state_management_app/models/user_model.dart';

import '../services/user_service.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<UserModel>(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
            return snapshot.hasData
                ? Text('User ${snapshot.data!.name}')
                : const Text('Second Page');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                const newUser = UserModel(name: 'Jimena');
                userService.loadUser(newUser);
              },
              icon: const Icon(
                Icons.playlist_add_check_sharp,
              ),
              label: const Text('Set user'),
            ),
            TextButton.icon(
              onPressed: () {
                userService.setAge(25);
              },
              icon: const Icon(Icons.edit_sharp),
              label: const Text('Modify age'),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add profession'),
            )
          ],
        ),
      ),
    );
  }
}
