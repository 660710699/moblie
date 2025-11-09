import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({super.key});

  @override
  State<Answer3> createState() => _Answer3State();
}

class _Answer3State extends State<Answer3> {
  // 1. สร้าง GlobalKey สำหรับ Form
  final _formKey = GlobalKey<FormState>();

  // 2. การจัดการ State (ประเภทรถ)
  int _basePrice = 150;

  // 3. การจัดการ State (บริการเสริม)
  bool _vacuum = false;
  bool _wax = false;

  // 4. การคำนวณราคารวม
  int _calculateTotal() {
    int total = _basePrice;
    if (_vacuum) total += 50;
    if (_wax) total += 100;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('คำนวณค่าบริการล้างรถ'),
        backgroundColor: Colors.purple[100],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 2. DropdownButton สำหรับเลือกขนาดรถ
              const Text(
                'ขนาดรถ',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<int>(
                  value: _basePrice,
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down),
                  items: const [
                    DropdownMenuItem(
                      value: 150,
                      child: Text('รถเล็ก (Small) - 150 บาท'),
                    ),
                    DropdownMenuItem(
                      value: 200,
                      child: Text('รถเก๋ง (Medium) - 200 บาท'),
                    ),
                    DropdownMenuItem(
                      value: 250,
                      child: Text('รถ SUV/กระบะ (Large) - 250 บาท'),
                    ),
                  ],
                  onChanged: (int? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _basePrice = newValue;
                      });
                    }
                  },
                ),
              ),

              const SizedBox(height: 24),

              // 3. CheckboxListTile สำหรับบริการเสริม
              CheckboxListTile(
                title: const Text('ดูดฝุ่น (+50 บาท)'),
                value: _vacuum,
                activeColor: Colors.purple,
                onChanged: (bool? value) {
                  setState(() {
                    _vacuum = value ?? false;
                  });
                },
              ),

              CheckboxListTile(
                title: const Text('เคลือบแว็กซ์ (+100 บาท)'),
                value: _wax,
                activeColor: Colors.purple,
                onChanged: (bool? value) {
                  setState(() {
                    _wax = value ?? false;
                  });
                },
              ),

              const SizedBox(height: 24),
              const Divider(thickness: 2),
              const SizedBox(height: 16),

              // 5. การแสดงผลราคารวม (อัปเดตอัตโนมัติ)
              Center(
                child: Text(
                  'ราคารวม: ${_calculateTotal()} บาท',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
