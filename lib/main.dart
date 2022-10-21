import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  bool progres = false;
  bool error = false;
  late String datasubuh;
  late String datadzuhur;
  late String dataashar;
  late String datamaghrib;
  late String dataisya;
  late String datatanggal;

  void ambilData() async {
    setState(() {
      progres = true;
    });

    var tanggalSekarang = DateTime.now();
    var formatTanggal = DateFormat('yyyy-MM-dd');
    String formatTanggalSekarang = formatTanggal.format(tanggalSekarang);

    try {
      // mensimulasikan request network
      Response response = await get(Uri.parse(
          'https://api.banghasan.com/sholat/format/json/jadwal/kota/775/tanggal/$formatTanggalSekarang'));
      Map data = jsonDecode(response.body);
      String subuh = data['jadwal']['data']['subuh'];
      String dzuhur = data['jadwal']['data']['dzuhur'];
      String ashar = data['jadwal']['data']['ashar'];
      String maghrib = data['jadwal']['data']['maghrib'];
      String isya = data['jadwal']['data']['isya'];
      String tanggal = data['jadwal']['data']['tanggal'];

      setState(() {
        datasubuh = subuh;
        datadzuhur = dzuhur;
        dataashar = ashar;
        datamaghrib = maghrib;
        dataisya = isya;
        datatanggal = tanggal;
        progres = false;
        error = false;
      });
    } catch (e) {
      setState(() {
        progres = false;
        error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Program',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Jadwal Sholat'),
        ),
        body: ListView(children: [
          Container(
              margin: const EdgeInsets.all(50),
              alignment: const Alignment(0.0, 0.0),
              child: Column(
                children: [
                  const Text(
                    'Kota Malang',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    datatanggal,
                    style: const TextStyle(fontSize: 15),
                  ),
                ],
              )),
          Center(
            child: (progres)
                ? Container(
                    padding: const EdgeInsets.all(100),
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      color: Colors.blue,
                      strokeWidth: 5,
                    ),
                  )
                : (error)
                    ? Container(
                        margin: const EdgeInsets.all(50),
                        alignment: const Alignment(0.0, 0.0),
                        child: const Text('Gagal load data...'))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: const Text("Subuh"),
                                leading: const Icon(Icons.alarm),
                                trailing: Text(datasubuh)),
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: const Text("Dzuhur"),
                                leading: const Icon(Icons.alarm),
                                trailing: Text(datadzuhur)),
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: const Text("Ashar"),
                                leading: const Icon(Icons.alarm),
                                trailing: Text(dataashar)),
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: const Text("Maghrib"),
                                leading: const Icon(Icons.alarm),
                                trailing: Text(datamaghrib)),
                          ),
                          Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                                title: const Text("Isya"),
                                leading: const Icon(Icons.alarm),
                                trailing: Text(dataisya)),
                          ),
                        ],
                      ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.get_app_outlined),
          onPressed: () => ambilData(),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progres = false;
    error = false;
    datasubuh = '00:00';
    datadzuhur = '00:00';
    dataashar = '00:00';
    datamaghrib = '00:00';
    dataisya = '00:00';
    datatanggal = 'Hari, tanggal';
  }
}
