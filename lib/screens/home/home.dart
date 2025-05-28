import 'package:flutter/material.dart';
import 'package:tubes_alpro/data.dart';
import 'package:tubes_alpro/screens/options.dart';
import 'package:tubes_alpro/screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTripActive = false;

  Future<void> _inputBudget(String title, Function(int) onSaved) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BudgetPage(title: title)),
    );
    if (result != null) {
      onSaved(result);
    }
  }

  Widget buildBudgetBox({
    required int? value,
    required String emptyLabel,
    required String filledLabel,
    required VoidCallback onPressed,
  }) {
    final isFilled = value != 0;

    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isFilled ? Colors.deepPurpleAccent : Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child:
          isFilled
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filledLabel,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Rp $value',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
              : Center(
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ), // padding tulisan
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    emptyLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Nama Aplikasi', // nama aplikasi
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
      ),



  body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    children: [
      buildBudgetBox(
        value: budGet.Balance,
        emptyLabel: "Masukkan Budget Modal",
        filledLabel: "Budget Modal Anda Sekarang",
        onPressed: () => _inputBudget("Masukkan Budget Modal", (val) {
          setState(() {
            budGet.Balance = val;
          });
        }),
      ),
      SizedBox(height: 20),
      buildBudgetBox(
        value: budGet.Budget,
        emptyLabel: "Masukkan Budget Perjalanan",
        filledLabel: "Budget Perjalanan Anda Sekarang",
        onPressed: () => _inputBudget("Masukkan Budget Perjalanan", (val) {
          setState(() {
            budGet.Budget = val;
            budGet.Balance = budGet.Balance - budGet.Budget;
            isTripActive = true;
          });
        }),
      ),
      SizedBox(height: 20),

      if (isTripActive) ...[
        ElevatedButton(
          onPressed: () {
            setState(() {
              budGet.Balance += budGet.Budget;
              budGet.Budget = 0;
              isTripActive = false;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 237, 41),
            foregroundColor: const Color.fromARGB(255, 39, 39, 39),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
          child: Text("Akhiri Perjalanan Anda"),
        ),
        SizedBox(height: 10),
      ],
      Expanded(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20), // Jarak dari tombol QR
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(8), // Padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 224, 207, 255),
                      foregroundColor: const Color.fromARGB(255, 96, 41, 184),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "History",
                      style: TextStyle(fontSize: 16),
                      ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 224, 207, 255),
                      foregroundColor: const Color.fromARGB(255, 96, 41, 184),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Chart",
                      style: TextStyle(fontSize: 16),
                      ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 224, 207, 255),
                      foregroundColor: const Color.fromARGB(255, 96, 41, 184),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "More Info",
                      style: TextStyle(fontSize: 16),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    ],
  ),
),


      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.deepPurple,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.more_horiz_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OptionsScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: 40),
              IconButton(
                icon: Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => proFile()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 4,
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}

class BudgetPage extends StatelessWidget {
  final String title;
  final TextEditingController _controller = TextEditingController();

  BudgetPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(flex: 1),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Masukkan nominal'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final budget = int.tryParse(_controller.text);
                  if (budget != null) {
                    Navigator.pop(context, budget);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Masukkan angka yang valid')),
                    );
                  }
                },
                child: Text('Simpan'),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
