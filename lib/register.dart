import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String? jenisKelamin;
  DateTime? tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("register page")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Form Pendaftaran",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              TextField(
                controller: nama,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Jenis Kelamin",
                  border: OutlineInputBorder(),
                ),
                value: jenisKelamin,
                items: ["Laki-laki", "Perempuan"]
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    jenisKelamin = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: tanggalLahir == null
                      ? "Tanggal Lahir"
                      : "${tanggalLahir!.day}/${tanggalLahir!.month}/${tanggalLahir!.year}",
                  border: const OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2005),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() {
                      tanggalLahir = picked;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (nama.text.isEmpty ||
                        email.text.isEmpty ||
                        password.text.isEmpty ||
                        jenisKelamin == null ||
                        tanggalLahir == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Silakan isi semua data!"),
                        ),
                      );
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Nama: ${nama.text}\nEmail: ${email.text}\nPassword: ${password.text}\n"
                          "Jenis Kelamin: $jenisKelamin\n"
                          "Tanggal Lahir: ${tanggalLahir!.day}/${tanggalLahir!.month}/${tanggalLahir!.year}",
                        ),
                      ),
                    );
                  },
                  child: const Text("Daftar Sekarang"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
