import 'package:flutter/material.dart';
import 'package:game_workspace/models/game_item.dart';

class CalendarScreen extends StatefulWidget {
  final String gameId;
  final GameItem? gameItem;

  const CalendarScreen({
    super.key,
    required this.gameId,
    this.gameItem,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('캘린더'),
        backgroundColor: Colors.greenAccent,
      ),

      /// 왼쪽 Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.greenAccent),
              child: Text(
                '메뉴',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('홈'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('설정'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('프로필'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      /// 오른쪽 Drawer
      endDrawer: const Drawer(
        child: Center(child: Text('아무것도')),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black54),
              ),
              child: CalendarDatePicker(
                initialDate: _selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                onDateChanged: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '선택한 날짜: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('편집 버튼 클릭')),
          );
        },
        child: const Icon(Icons.edit),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: '오늘',
          ),
        ],
      ),
    );
  }
}
