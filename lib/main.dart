// import 'package:api_default_project/contact/contact_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// void main(){
//   runApp(MyApp());
// }


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context , child) {
//         return const MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: ContactScreen(),
//         );
//       },
//     );;
//   }
// }




import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeGame(),
    );
  }
}

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  late List<String> board;
  late String currentPlayer;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    startNewGame();
  }

  void startNewGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      gameOver = false;
    });
  }

  void makeMove(int index) {
    if (!gameOver && board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
        checkWinner();
      });
    }
  }

  void checkWinner() {
    // Define winning combinations
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in winningCombinations) {
      if (board[combo[0]] != '' &&
          board[combo[0]] == board[combo[1]] &&
          board[combo[1]] == board[combo[2]]) {
        setState(() {
          gameOver = true;
        });
        return;
      }
    }

    // Check for a draw
    if (!board.contains('')) {
      setState(() {
        gameOver = true;
      });
    }
  }

  Widget buildTile(int index) {
    return GestureDetector(
      onTap: () => makeMove(index),
      child: Container(
        width: 100.0,
        height: 100.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Text(
          board[index],
          style: TextStyle(fontSize: 48.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (gameOver)
                  ? (board.contains('') ? 'It\'s a Draw!' : 'Player $currentPlayer wins!')
                  : 'Player $currentPlayer\'s turn',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTile(0),
                buildTile(1),
                buildTile(2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTile(3),
                buildTile(4),
                buildTile(5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTile(6),
                buildTile(7),
                buildTile(8),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => startNewGame(),
              child: Text('New Game'),
            ),
          ],
        ),
      ),
    );
  }
}
