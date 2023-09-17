import 'package:flutter/material.dart';

class P3 extends StatefulWidget {
  const P3({super.key, required this.callback});

  //final String title;
  final  Function(String) callback;

  @override
  State<P3> createState() => _P3State();
}

class _P3State extends State<P3> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          automaticallyImplyLeading: true,
          title: const Text('Pagina 3'),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  widget.callback('ಠ_ಠ');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      ),
                 child: const Text('ಠ_ಠ')),
              ElevatedButton(
                onPressed: () {
                  widget.callback('ʕ•ᴥ•ʔ');
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      ),
                 child: const Text('ʕ•ᴥ•ʔ')),
              ElevatedButton(
                onPressed: () {
                  widget.callback("(ง'̀-'́)ง");
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.black,
                      ),
                 child: const Text("(ง'̀-'́)ง"))
            ],
          ),
        ),
      ),
    );
  }
}