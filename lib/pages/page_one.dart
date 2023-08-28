import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/services/user_service.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        actions: [
          IconButton(
            onPressed: () {
              userService.deleteUser();
            },
            icon: const Icon(
              Icons.exit_to_app_sharp,
            ),
          )
        ],
      ),
      body: userService.hasUser
          ? const UserInformation()
          : const Center(
              child: Text('No user available'),
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

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
            title: Text('Name: ${userService.user.name} '),
          ),
          ListTile(
            title: Text('Age: ${userService.user.age ?? 'No age available'} '),
          ),
          const Text(
            'Professions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ...userService.user.professions
              .map((String profession) => ListTile(
                    title: Text(profession),
                  ))
              .toList()
        ],
      ),
    );
  }
}
