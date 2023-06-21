import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayEXoH = ['', '', '', '', '', '', '', '', ''];
  bool ohTurn = true;
  TextStyle myTextStyle= TextStyle(
    color: Colors.white,
    fontSize: 22,
  );
  int ohScore=0;
  int exScore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(

          children: [
            SizedBox(height: 15,),
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Text('Player - O -',style:myTextStyle ),
                  Text('Player - X -',style:myTextStyle ),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(ohScore.toString(),style: myTextStyle,),
                    Text(exScore.toString(),style: myTextStyle,),
                  ],
                ),
              ],
            ),
            Spacer(),
            Expanded(
               flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tabbed(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text(displayEXoH[index],
                            style: const TextStyle(color: Colors.white, fontSize: 22)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tabbed(int index) {
    setState(() {
      if (ohTurn == true && displayEXoH[index]=='') {
        displayEXoH[index] = 'O';
      } else if(!ohTurn && displayEXoH[index] =='') {
        displayEXoH[index] = 'X';
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayEXoH[0] == displayEXoH[1] && displayEXoH[0] == displayEXoH[2] && displayEXoH[0]!='') {
      showdialog(displayEXoH[0]);
    }
    if (displayEXoH[3] == displayEXoH[4] && displayEXoH[3] == displayEXoH[5] && displayEXoH[3]!='') {
      showdialog(displayEXoH[3]);
    }
    if (displayEXoH[6] == displayEXoH[7] && displayEXoH[6] == displayEXoH[8] && displayEXoH[6]!='') {
      showdialog(displayEXoH[6]);
    }
    if (displayEXoH[0] == displayEXoH[3] && displayEXoH[0] == displayEXoH[6] && displayEXoH[0]!='') {
      showdialog(displayEXoH[0]);
    }
    if (displayEXoH[1] == displayEXoH[7] && displayEXoH[1] == displayEXoH[4] && displayEXoH[1]!='') {
      showdialog(displayEXoH[1]);
    }
    if (displayEXoH[2] == displayEXoH[5] && displayEXoH[2] == displayEXoH[8] && displayEXoH[2]!='') {
      showdialog(displayEXoH[2]);
    }
    if (displayEXoH[0] == displayEXoH[4] && displayEXoH[0] == displayEXoH[8] && displayEXoH[0]!='') {
      showdialog(displayEXoH[0]);
    }
    if (displayEXoH[2] == displayEXoH[4] && displayEXoH[2] == displayEXoH[6] && displayEXoH[2] != '') {
      showdialog(displayEXoH[2]);
    }

  }

  void showdialog(String winner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('The Winner Is Player :${winner} '),
          
        );
      },
    );
  }
}
