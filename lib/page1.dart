import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});
  void myDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (BuildContext konteks) {
          return AlertDialog(
            title: Text("Hubungi Kami "),
            content: Text("Hubungi Kami di khoironi14@gmail.com"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.of(konteks).pop(),
                  child: Text("Close"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(builder: (context) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Nama Khoeroni"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Nim 20201285"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/30866097?v=4"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () => myDialog(context),
                          child: Text("Kontak Kami")),
                    )
                  ],
                ),
              ),
            );
          }),
        ));
  }
}
