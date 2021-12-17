
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('ListView 基础测试'),),
      body: Center(child: FlexibleDemo()),
    );
  }
}

class FlexibleDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: [
        Container(
          width: 200,
          height: 54,
          color: Colors.grey.withAlpha(11),
          child:
          Row(
            children:[
              buildHead(),
              Flexible(
                fit: FlexFit.loose,
                // flex:3,
                child: Icon(Icons.ac_unit),
              ),
              // Flexible(
              //   flex: 1,
              //   child: Container(
              //     color: Colors.red,
              //   ),
              // )
            ],
          ),
        ),
        Container(
            width: 200,
            height: 54,
            color: Colors.grey.withAlpha(11),
            child:
            Row(
                children:[
                  buildHead(),
                  Flexible(
                    fit: FlexFit.tight,
                    // flex:3,
                    child: Icon(Icons.ac_unit),
                  ),
                  // Flexible(
                  //   flex: 1,
                  //   child: Container(
                  //     color: Colors.red,
                  //   ),
                  // )
                ],
            ),
        ),
      ],
    );
  }

  Widget buildHead(){
    return Padding(
      padding: const EdgeInsets.all( 8.0),
      child: Image.asset('assets/images/icon_head.png',width: 40,height: 40,),
    );
  }
}


