import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DatabaseReference _currentRef = FirebaseDatabase.instance.ref('deteksi_uang');
  final DatabaseReference _historyRef = FirebaseDatabase.instance.ref('history');

  String status = 'Memuat...';
  int red = 0;
  int green = 0;
  int blue = 0;
  String timestamp = '';
  List<Map<String, dynamic>> historyList = [];

  @override
  void initState() {
    super.initState();

    _currentRef.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          status = data['status'] ?? 'Tidak diketahui';
          red = data['red'] ?? 0;
          green = data['green'] ?? 0;
          blue = data['blue'] ?? 0;

          final ts = data['timestamp'];
          if (ts != null) {
            final dt = DateTime.fromMillisecondsSinceEpoch(ts);
            timestamp = DateFormat('dd MMM yyyy, HH:mm:ss').format(dt);
          } else {
            timestamp = '';
          }
        });
      }
    });

    _historyRef.limitToLast(5).onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        final entries = data.entries.toList()
          ..sort((a, b) => b.key.compareTo(a.key));

        setState(() {
          historyList = entries.map((e) {
            final item = e.value as Map;
            final time = item['timestamp'];
            return {
              'status': item['status'] ?? '',
              'timestamp': time != null
                  ? DateFormat('dd MMM yyyy, HH:mm:ss')
                      .format(DateTime.fromMillisecondsSinceEpoch(time))
                  : '',
            };
          }).toList();
        });
      }
    });
  }

  Color getStatusColor() {
  switch (status) {
    case "100K ASLI":
      return Colors.green;
    case "UANG PALSU":
      return Colors.amber[800]!;
    case "TIDAK ADA":
      return Colors.grey;
    default:
      return Colors.orange;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deteksi Uang'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'STATUS',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: getStatusColor(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text("Nilai RGB: R=$red, G=$green, B=$blue"),
                    if (timestamp.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text("Waktu Deteksi: $timestamp"),
                    ]
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Riwayat Deteksi Terakhir", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      Expanded(
                        child: historyList.isEmpty
                            ? const Center(child: Text("Belum ada riwayat."))
                            : ListView.builder(
                                itemCount: historyList.length,
                                itemBuilder: (context, index) {
                                  final item = historyList[index];
                                  return ListTile(
                                    leading: Icon(
                                      item['status'] == 'UANG PALSU'
                                          ? Icons.warning
                                          : Icons.money,
                                      color: item['status'] == 'UANG PALSU'
                                          ? Colors.amber[800]
                                          : Colors.blue,
                                    ),
                                    title: Text(item['status']),
                                    subtitle: Text(item['timestamp']),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
