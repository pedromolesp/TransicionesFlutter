import 'package:flutter/material.dart';
import 'package:transiciones/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página 1"),
      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
        child: Icon(Icons.access_time),
      ),
    );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          Pagina2Page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);
        /* return SlideTransition(
          position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero)
              .animate(curvedAnimation),
          child: child,
        ); */
        /*   return ScaleTransition(
            child: child,
            scale:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation)); */
        // return RotationTransition(
        //     child: child,
        //     turns:
        //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));
        return RotationTransition(
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: child,
            ),
            turns:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));
      },
      transitionDuration: Duration(seconds: 2),
    );
  }
}
