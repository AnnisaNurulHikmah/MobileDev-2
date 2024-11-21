import 'package:flutter/material.dart';
import 'auth/login_page.dart'; // Pastikan LoginPage sudah dibuat
import 'screens/home_screen.dart'; // Pastikan HomeScreen sudah dibuat
import 'screens/favorite_screen.dart'; // Pastikan FavoriteScreen sudah dibuat
import 'screens/account_screen.dart'; // Pastikan AccountScreen sudah dibuat

void main() {
  runApp(const HallyuPlayApp());
}

class HallyuPlayApp extends StatelessWidget {
  const HallyuPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HallyuPlay',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const LoginPageWrapper(), // Ganti dengan LoginPageWrapper
    );
  }
}

class LoginPageWrapper extends StatefulWidget {
  const LoginPageWrapper({super.key});

  @override
  _LoginPageWrapperState createState() => _LoginPageWrapperState();
}

class _LoginPageWrapperState extends State<LoginPageWrapper> {
  String? _username;

  // Fungsi untuk login
  void _login(String username) {
    setState(() {
      _username = username;
    });
  }

  // Fungsi untuk logout
  void _logout() {
    setState(() {
      _username = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Jika sudah login, arahkan ke MainNavigation
    if (_username != null) {
      return MainNavigation(
        username: _username!,
        onLogout: _logout,
      );
    }

    // Jika belum login, tampilkan LoginPage
    return LoginPage();
  }
}

class MainNavigation extends StatefulWidget {
  final String username;
  final VoidCallback onLogout;

  const MainNavigation({super.key, required this.username, required this.onLogout});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeScreen(), // Halaman Home
      const FavoriteScreen(), // Halaman Favorite
      AccountScreen(username: widget.username, onLogout: widget.onLogout), // Halaman Account dengan parameter username
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, ${widget.username}'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: widget.onLogout, // Fungsi logout
          ),
        ],
      ),
      body: _pages[_currentIndex],  // Halaman berubah sesuai dengan index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;  // Ganti halaman berdasarkan index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
