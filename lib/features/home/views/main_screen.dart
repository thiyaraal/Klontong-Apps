import 'package:flutter/material.dart';
import 'package:kelontong_app/core/widgets/bottom_navbar.dart';
import 'package:kelontong_app/features/home/view_models/main_screen_provider.dart';
import 'package:kelontong_app/features/home/views/home.dart';
import 'package:kelontong_app/features/products/views/all_products.dart';
import 'package:kelontong_app/features/profile/views/profile.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  final int? activeScreen;
  const MainScreen({super.key, this.activeScreen});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<MainScreenProvider>(context, listen: false);
      if (widget.activeScreen != null) {
        provider.setInitialScreen(widget.activeScreen!);
      }
    });
  }

  Widget screenBottomNavigation(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return AllProductsScreen();
      case 2:
        return const ProfileScreen();
      default:
        return  HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: screenBottomNavigation(provider.selectedNavbar),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade300, width: 1),
                  ),
                ),
                child: BottomNavbarWidget(
                  currentIndex: provider.selectedNavbar,
                  onTap: provider.changeSelectedNavbar,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
