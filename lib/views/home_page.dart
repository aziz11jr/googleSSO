import 'package:flutter/material.dart';
import 'package:vds_culture_tech/widgets/card.dart';
import '../maps/google_maps.dart';
import '../services/google_signin_api.dart';
import '../widgets/navabar.dart';
import 'drag.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool dragVisible = false;
  // bool navBarVisible = true;
  @override
  Widget build(
    BuildContext context,
  ) =>
      Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child:
                  ElevatedButton(onPressed: signIn, child: const Text('Login')),
            ),
            // const Gmap(),
            Visibility(visible: dragVisible, child: const DraggableSheet()),
            Container(
              alignment: Alignment.bottomCenter,
              child: const MyTabBar(),
            ),
            // Container(
            //   alignment: Alignment.bottomCenter,
            //   child: const Cards(),
            // ),
          ],
        ),
      );

  Future signIn() async {
    final user = await GooogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Sign in failed')));
    } else {
      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //   builder: (context) => LoggedInPage(user: user),
      // ));
      print("Name: " + user.email!);
    }
  }
}
