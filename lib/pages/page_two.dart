import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_app/models/user_model.dart';
import 'package:state_management_app/services/user_service.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'default';
    final userService = Provider.of<UserService>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            Text(userService.hasUser ? userService.user.name : 'Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                userService.user = const UserModel(
                  name: 'Jimena',
                  professions: [],
                );
              },
              icon: const Icon(
                Icons.playlist_add_check_sharp,
              ),
              label: const Text('Set user'),
            ),
            TextButton.icon(
              onPressed: () {
                userService.changeAge(25);
              },
              icon: const Icon(Icons.edit_sharp),
              label: const Text('Modify age'),
            ),
            TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Professions List'),
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return DropdownButton<String>(
                            value: selectedValue,
                            items: const [
                              DropdownMenuItem(
                                value: 'default',
                                enabled: false,
                                child: Text('Select profession'),
                              ),
                              DropdownMenuItem(
                                value: 'Cat Lover',
                                child: Text('Cat Lover'),
                              ),
                              DropdownMenuItem(
                                value: 'Flutter Developer',
                                child: Text('Flutter Developer'),
                              ),
                              DropdownMenuItem(
                                value: 'Human',
                                child: Text('Human'),
                              )
                            ],
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value ?? '';
                              });
                            },
                          );
                        },
                      ),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            userService.addProfession(selectedValue);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Save',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        )
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add profession'),
            )
          ],
        ),
      ),
    );
  }
}
