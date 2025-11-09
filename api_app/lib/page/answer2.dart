import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar
      appBar: AppBar(title: const Text('Concert Ticket')),

      // 2. Center > Container (ตัวตั๋ว)
      body: Center(
        child: Container(
          width: 300,
          height: 180,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),

          // 3 & 6. Stack หุ้ม Row หลัก
          child: Stack(
            children: [
              // Row หลัก
              Row(
                children: [
                  // 4. ส่วนที่ 1 - ข้อมูลซ้าย
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Flutter Live',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text('Band: The Widgets'),
                          SizedBox(height: 4),
                          Text('Date: 8 NOV 2025'),
                          SizedBox(height: 4),
                          Text('Gate: 7'),
                        ],
                      ),
                    ),
                  ),

                  // 5. ส่วนที่ 2 - Barcode ขวา
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey[700],
                      child: const Center(
                        child: Icon(
                          Icons.qr_code,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 6. ส่วนที่ 3 - รอยฉีกตั๋ว (Positioned)
              Positioned(
                top: 0,
                bottom: 0,
                left: 210,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.more_vert, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
