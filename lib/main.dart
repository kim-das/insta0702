import 'package:flutter/material.dart';
import './style.dart' as style;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Instagram'),
        actions: [
          Icon(Icons.add_box_outlined)
        ],
      ),
      body: cardPost(),

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


class cardPost extends StatelessWidget {
  cardPost({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(itemCount:3,itemBuilder:(c,i)
    {
      return Column(
          children:[
            SizedBox(
              width:double.infinity,
              child:
              Column(
                  children: [
                    Image.asset('assets/shoes.png',width: double.infinity,
                      fit: BoxFit.cover,),

                    Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('좋아요100'),
                          Text('글쓴이'),
                          Text('글내용'),],
                      )
                    )
                  ],
              ),
            ),
          ],
      );
    },
    );
  }
}
