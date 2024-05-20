import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dekar ve Balya Hesaplama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/calculate': (context) => CalculatePage(),
        '/result': (context) => ResultPage(),
      },
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController dekarController = TextEditingController();
  TextEditingController balyaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dekar ve Balya Hesaplama'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hoş Geldiniz!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: dekarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Dekar Fiyati'),
            ),
            TextField(
              controller: balyaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Balya Fiyati'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/calculate',
                  arguments: {
                    'dekar': dekarController.text,
                    'balya': balyaController.text,
                  },
                );
              },
              child: Text('İleri'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatePage extends StatelessWidget {
  TextEditingController donumController = TextEditingController();
  TextEditingController balyeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String dekar = args?['dekar'] ?? '';
    final String balya = args?['balya'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Dönüm ve Balye Hesaplama'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: donumController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kaç Dönüm?'),
            ),
            TextField(
              controller: balyeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kaç Balye?'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/result',
                  arguments: {
                    'dekar': double.parse(dekar),
                    'balya': double.parse(balya),
                    'donum': double.parse(donumController.text),
                    'balye': double.parse(balyeController.text),
                  },
                );
              },
              child: Text('Hesapla'),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, double>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, double>?;
    final double dekar = args?['dekar'] ?? 0;
    final double balya = args?['balya'] ?? 0;
    final double donum = args?['donum'] ?? 0;
    final double balye = args?['balye'] ?? 0;

    double totalDonum = dekar * donum;
    double totalBalye = balya * balye;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sonuçlar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Toplam Dönüm:  $totalDonum',
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              'Toplam Balye: $totalBalye',
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
      ),
    );
  }
}
