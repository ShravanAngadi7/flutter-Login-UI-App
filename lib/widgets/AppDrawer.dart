import 'package:firebase_auth/firebase_auth.dart';

import '../auth/authpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('Hello friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
            ),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(
          //     Icons.payment,
          //   ),
          //   title: const Text('My Orders'),
          //   onTap: () {
          //     // Navigator.of(context).pushReplacement(
          //     //   CustomRoute(
          //     //     builder: (context) => OrdersScreen(),
          //     //   ),
          //     // );
          //     Navigator.of(context)
          //         .pushReplacementNamed(OrdersScreen.routeName);
          //   },
          // ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(
          //     Icons.edit,
          //   ),
          //   title: const Text('Manage Products'),
          //   onTap: () {
          //     Navigator.of(context).pushNamed(UserProductScreen.routeName);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.logout_sharp,
            ),
            title: const Text('LogOut'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              // FirebaseUser user = FirebaseAuth.instance.currentUser;
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
