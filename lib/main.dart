import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency converter',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Currency converter'),
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

  double? amount;
  String? _err;
  String? displayTxt;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://ichef.bbci.co.uk/news/1024/branded_news/23B3/production/_125893190_gettyimages-520187152.jpg'),
      TextField(
              keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Enter the amount in EUR: ',
            errorText: _err),
            onChanged: (String value){
                if(double.tryParse(value) != null && double.parse(value)>0) {
                  amount = double.parse(value);
                 _err = null;
                }
                else {
                  amount = null;
                  _err = 'invalid entry';
                }
            },
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            child:const Text('convert'),
            onPressed: (){
              setState(() {
                if(amount!=null)
                {
                  displayTxt = (amount!*5).toString();
                }else
                {
                  displayTxt = null;
                }
              });
            },
          ),
          Text(displayTxt??'', style: const TextStyle(fontSize: 20))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
