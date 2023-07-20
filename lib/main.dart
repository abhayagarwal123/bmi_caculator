import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(


        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weight=TextEditingController();
  var height=TextEditingController();
  var bmi;
  void getdata(var a,var b){
    setState(() {
      bmi=a/(b*b);
    });
  }

  var result='';
  void res(var bmi){
    setState(() {
      if(bmi>25){result='you are overweight';}
      if(bmi<25&&bmi>18){result='you are healthy';}
      if(bmi<18){result='you are underweight';}
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(


          title: Center(child: Text('Body Mass Index ',style: TextStyle(fontSize: 40,fontWeight: FontWeight.normal),)),
          backgroundColor: Colors.red,

        ),
        body:
        Center(
          child:   Container(
            width: 400,
            color: Colors.cyanAccent,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      controller: weight, keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.amberAccent,
                          hintText: 'enter your body weight (kg)',
                          prefixIcon: Icon(Icons.monitor_weight_outlined),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.blueAccent)
                          )

                      ),
                    ),
                  ),
                ),
                Container(width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: height,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.amberAccent,
                          hintText: 'enter your height (m)',
                          prefixIcon: Icon(Icons.height_sharp),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 5,color: Colors.blueAccent)
                          )

                      ),
                    ),
                  ),
                ),
                ElevatedButton(onPressed: (){
                  String w=weight.text.toString();
                  var w1=int.parse(w);
                  String h=height.text.toString();
                  var h1=double.parse(h);
                  getdata(w1,h1);
                  var abc=bmi;
                  res(abc);
                }, child: Text('calculate')),
                Text('your bmi is :${bmi}',style: TextStyle(fontSize: 20)),
                Text('$result'),

              ],
            ),
          ),
        )
    );

  }
}
