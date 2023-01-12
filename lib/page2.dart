import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double _nilai_input = 0.0;
  double _nilaiHasil = 0.0;
  String _satuanAsal = 'meter';
  String _satuanTujuan = 'meter';
  String _nama = '';
  final List<String> _satuan = [
    'meter',
    'kilometer',
    'gram',
    'kilogram',
    'feet',
    'mile',
    'pound',
    'ounce',
    'idr',
    'usd',
  ];
  final Map<String, int> _mapSatuan = {
    'meter': 0,
    'kilometer': 1,
    'gram': 2,
    'kilogram': 3,
    'feet': 4,
    'mile': 5,
    'pound (lbs)': 6,
    'ounce': 7,
    'idr': 8,
    'usd': 9
  };
  final dynamic _rumus = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0, 0, 0],
    '2': [0, 0, 1, 0.0001, 0, 0, 0.00220462, 0.35274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 3.28084, 0, 0.0625, 1],
    '8': [0, 0, 0, 0, 0, 0, 0, 0, 1, 0.00064],
    '9': [0, 0, 0, 0, 0, 0, 0, 0, 15.675, 1]
  };
  void hitungKonversi(
      double nilaiAwal, String satuanAwal, String satuanTujuan) {
    int? nomorSatuanAwal = _mapSatuan[satuanAwal];
    int? nomorSatuanTujuan = _mapSatuan[satuanTujuan];
    var faktorPengali = _rumus[nomorSatuanAwal.toString()][nomorSatuanTujuan];
    var hasil = nilaiAwal * faktorPengali;
    setState(() {
      _nilaiHasil = hasil;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("Selamat Datang diaplikasi konversi"),
              Spacer(), //jarak antar widget
              TextField(
                decoration:
                    InputDecoration(hintText: 'Silahkan input Nama Anda'),
                onChanged: (text) {
                  var textInput = text;
                  if (textInput != null) {
                    setState(() {
                      _nama = textInput;
                    });
                  }
                },
              ), //nama
              Spacer(),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Silahkan input Nilai yang akan dikonversi'),
                onChanged: (text) {
                  var dataInput = double.tryParse(text);
                  if (dataInput != null) {
                    setState(() {
                      _nilai_input = dataInput;
                    });
                  }
                },
              ),
              Spacer(),
              Text("Satuan Asal"),
              DropdownButton(
                isExpanded: true,
                value: _satuanAsal,
                items: _satuan.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _satuanAsal = value.toString();
                  });
                },
              ),
              Text("Satuan Tujuan"),
              DropdownButton(
                isExpanded: true, //memanjangkan ukuran sesuai layar
                value: _satuanTujuan,
                items: _satuan.map((e) {
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _satuanTujuan = value.toString();
                  });
                },
              ), //satuan asal
              Spacer(
                flex: 2,
              ),
              ElevatedButton(
                  onPressed: () =>
                      hitungKonversi(_nilai_input, _satuanAsal, _satuanTujuan),
                  child: Text('Hitung')),
              Spacer(
                flex: 2,
              ),
              Text(
                  "Heloo ${_nama}, ${_nilai_input}, ${_satuanAsal} = ${_nilaiHasil} ${_satuanTujuan}"), //satuan tujuan
            ],
          ),
        ),
      ),
    );
  }
}
