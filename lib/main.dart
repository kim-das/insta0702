import 'package:flutter/material.dart';
import './style.dart' as style;
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
          theme: style.theme,
          home:MyApp()
  ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab=0;
  var urlData=[];

  getData() async{
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    setState(() {
      urlData=jsonDecode(result.body);
    });

    print(urlData);

  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Instagram'),
        actions: [
          Icon(Icons.add_box_outlined)
        ],
      ),
      body:Home(state:urlData),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,

        onTap: (i){
          setState(() {
              tab=i;
            });
          },

        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home_outlined),label:'홈'),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_bag_outlined), label:'샵'),
      ]),
    );
  }
}


class Home extends StatelessWidget {
  Home({Key? key, this.state}) : super(key:key);
  final state;

  @override
  Widget build(BuildContext context) {
    if(state.isNotEmpty){
      return  ListView.builder(itemCount:3,itemBuilder:(c,i)
      {
        return Column(
          children:[
            SizedBox(
              width:double.infinity,
              child:
              Column(
                  children: [
                    Image.network(state[i]['image'],width: double.infinity,
                      fit: BoxFit.cover,),

                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('좋아요 ${state[i]['likes']}'),
                          Text('글쓴이 ${state[i]['user']}'),
                          Text('글내용 ${state[i]['content']}'),],
                      )
                    )
                  ],
              ),
            ),
          ],
      );
    },
        );}else{
      return Text('로딩중임');
    }
  }
}
