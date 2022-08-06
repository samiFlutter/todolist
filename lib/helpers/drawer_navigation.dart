import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg"),
              ),
              accountName: Text("sami flutter"),
              accountEmail: Text("admin@gmail.com"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),

            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text("Categories"),
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }
}
