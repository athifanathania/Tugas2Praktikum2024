import '/ui/tampil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  FormDataState createState() => FormDataState();
}

class FormDataState extends State<FormData> {
  final _namaController = TextEditingController();
  final _nimController = TextEditingController();
  final _tahunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Data"),
        backgroundColor: Colors.pink[100], 
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildTitle(),
            const SizedBox(height: 30),
            _textboxNama(),
            const SizedBox(height: 20),
            _textboxNIM(),
            const SizedBox(height: 20),
            _textboxTahun(),
            const SizedBox(height: 30),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        "Formulir Mahasiswa",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.pink[400], 
        ),
      ),
    );
  }

  _textboxNama() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon:
            Icon(Icons.person, color: Colors.pink[300]), 
      ),
      controller: _namaController,
    );
  }

  _textboxNIM() {
    return TextField(
      decoration: InputDecoration(
        labelText: "NIM",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon:
            Icon(Icons.badge, color: Colors.pink[300]), 
      ),
      controller: _nimController,
    );
  }

  _textboxTahun() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Tahun Lahir",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(Icons.calendar_today,
            color: Colors.pink[300]), 
      ),
      controller: _tahunController,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String nama = _namaController.text;
        String nim = _nimController.text;
        int tahun = int.parse(_tahunController.text);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => TampilData(nama: nama, nim: nim, tahun: tahun),
        ));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30), backgroundColor: Colors.pink[200],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), 
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Simpan'),
    );
  }
}
