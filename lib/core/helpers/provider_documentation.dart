import 'package:kelontong_app/features/home/view_models/change_product_provider.dart';
import 'package:kelontong_app/features/home/view_models/main_screen_provider.dart';
import 'package:kelontong_app/features/home/view_models/product_provider.dart';
import 'package:kelontong_app/features/home/view_models/search_provider.dart';
import 'package:kelontong_app/features/home/view_models/add_product_provider.dart';
import 'package:kelontong_app/features/profile/view_models/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> getProviders() {
  return [
    ChangeNotifierProvider<MainScreenProvider>(
      create: (_) => MainScreenProvider(),
    ),
    //ProductProvider
    ChangeNotifierProvider<SearchProvider>(
      create: (_) => SearchProvider(),
    ),
    //AddProductProvider
    ChangeNotifierProvider<AddProductProvider>(
      create: (_) => AddProductProvider(),
    ),
    //ChangeProductProvider
    ChangeNotifierProvider<ChangeProductProvider>(
      create: (_) => ChangeProductProvider(),
    ),
  //profileProvider
    ChangeNotifierProvider<ProfileProvider>(
      create: (_) => ProfileProvider(),
    ),
    // ProfileProvider
    ChangeNotifierProvider<ProfileProvider>(
      create: (_) => ProfileProvider(),
    ),
    
  ];
}
