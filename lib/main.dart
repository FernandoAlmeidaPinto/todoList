import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newapp/components/topbar.dart';
import 'package:newapp/components/Dismissiblecard.dart';
import 'package:bot_toast/bot_toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  TextEditingController addInput = TextEditingController();
  PageController pagecontroller = PageController(initialPage: 0);

  void addTask() {
    setState(() {
      cards.add(addInput.text);
      addInput.text = "";
    });
  }

  void deleteTask(value) {
    setState(() {
      cards.remove(value);
    });
  }

  int _page = 0;
  double check = 20;

  List<String> cards = [];

  @override
  Widget build(BuildContext context) {
    final double sizeh = MediaQuery.of(context).size.height;
    double sizew = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopBar(),
            Expanded(
              flex: 1,
              child: PageView(
                controller: pagecontroller,
                children: <Widget>[
                  //Primeira Tela
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return DismissibleCard(title: cards[index], delete: deleteTask,);
                      },
                      itemCount: cards.length,
                    ),
                  ),
                  //Segunda Tela
                  Container(
                    color: Colors.white,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              controller: addInput,
                              decoration:
                                  InputDecoration(labelText: 'Minha Tarefa'),
                            ),
                            RaisedButton(
                              onPressed: () {
                                if (addInput.text.length > 0) {
                                  addTask();
                                  BotToast.showSimpleNotification(
                                      title: 'Feito!');
                                } else {
                                  BotToast.showSimpleNotification(
                                      title: 'Nada foi preenchido!');
                                }
                              },
                              color: Colors.blue,
                              child: Text(
                                'new',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Terceira Tela
                  Container(
                    color: Colors.white,
                  ),
                  // Quarta Tela
                  Container(
                    color: Colors.white,
                  ),
                  // Quinta Tela
                  Container(
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        items: <Widget>[
          Icon(
            Icons.view_list,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            color: Colors.white,
          ),
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Icon(
            Icons.build,
            color: Colors.white,
          ),
        ],
        buttonBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        color: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            pagecontroller.animateToPage(index,
                duration: Duration(milliseconds: 50), curve: Curves.bounceIn);
          });
        },
      ),
    );
  }
}
