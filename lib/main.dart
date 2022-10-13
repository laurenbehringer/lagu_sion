import 'package:flutter/material.dart';
import 'package:lagu_sion/data/hyms.dart';
import 'package:lagu_sion/presentation/hymns_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MSJM Lagu Sion',
      theme: ThemeData(
        fontFamily: 'serif',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController txt = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            title: RichText(
              text: new TextSpan(
                children: [
                  TextSpan(
                    text: "Lagu ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Sion",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: txt,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  cursorColor: Colors.red,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    counter: SizedBox(width: 0),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    hintText: "Masukan Nama Atau Nomor Lagu Sion",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                          BorderSide(color: Colors.grey.shade400, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.red, width: 1),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Hys.hymns.length,
                    padding: EdgeInsets.all(20),
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HymnScreen(hys: Hys.hymns[i])));
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: Colors.grey.shade500,
                          child: Column(
                            children: [
                              Text(Hys.hymns[i].title.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
