import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Ricardo Lecheta"),
              accountEmail: Text("rlecheta@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqP85ZnOcRSCX3nlYdkCvSxhSuZs0bLt1He8EvGr5ne8c7mTqW"),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Favoritos"),
              subtitle: const Text("mais informações..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("Ajuda"),
              subtitle: const Text("mais informações..."),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Logout"),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
            )
          ],
        ),
      ),
    );
  }

  void _onClickLogout(BuildContext context) {
    Navigator.pop(context);
    push(context, const LoginPage(), replace: true);
  }
}
