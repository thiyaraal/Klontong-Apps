import 'package:kelontong_app/features/home/view_models/main_screen_provider.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider<MainScreenProvider>(
      create: (_) => MainScreenProvider(),
    ),
    //ProductProvider
    ChangeNotifierProvider<ProductProvider>(
      create: (_) => ProductProvider(),
    ),
  ];
}
