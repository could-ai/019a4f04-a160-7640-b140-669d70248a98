import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Model class for an employee
class Employee {
  final String name;
  final DateTime hireDate;

  Employee({required this.name, required this.hireDate});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بيانات الموظفين',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Tajawal',
      ),
      home: const EmployeeListPage(),
      debugShowCheckedModeBanner: false,
      // Support for Right-to-Left layouts for Arabic
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // Arabic
      ],
      locale: const Locale('ar', 'AE'),
    );
  }
}

class EmployeeListPage extends StatefulWidget {
  const EmployeeListPage({super.key});

  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  // Sample list of employees
  final List<Employee> _employees = [
    Employee(name: 'أحمد محمود', hireDate: DateTime(2022, 5, 20)),
    Employee(name: 'فاطمة علي', hireDate: DateTime(2021, 9, 15)),
    Employee(name: 'محمد حسين', hireDate: DateTime(2023, 1, 10)),
    Employee(name: 'سارة إبراهيم', hireDate: DateTime(2020, 3, 30)),
    Employee(name: 'خالد وليد', hireDate: DateTime(2022, 11, 5)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة الموظفين'),
      ),
      body: ListView.builder(
        itemCount: _employees.length,
        itemBuilder: (context, index) {
          final employee = _employees[index];
          // Format the date to a readable string 'yyyy-MM-dd'
          final formattedDate =
              "${employee.hireDate.year}-${employee.hireDate.month.toString().padLeft(2, '0')}-${employee.hireDate.day.toString().padLeft(2, '0')}";
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  employee.name[0],
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                employee.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'تاريخ التوظيف: $formattedDate',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
