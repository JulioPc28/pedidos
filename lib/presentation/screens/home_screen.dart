import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/presentation/widget/appBar.dart';
import 'package:grupo_exito/presentation/widget/boton_cuadriculas.dart';
import 'package:grupo_exito/presentation/widget/boton_spress.dart';
import 'package:grupo_exito/presentation/widget/category_view.dart';
import 'package:grupo_exito/presentation/widget/container_decoration.dart';
import 'package:grupo_exito/presentation/widget/product_list_view.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:grupo_exito/services/api_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String name = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> _categoriesFuture;
  List<String> _allCategories = [];
  List<String> _filteredCategories = [];
  bool showAllProducts = false;
  late Future<List<Product>> _allProductsFuture;
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  String _searchQuery = '';
  bool isGridView = false;
  final apiService = ApiService();
  // final apiService = MockApiService();

  @override
  void initState() {
    super.initState();
    _categoriesFuture = apiService.fetchCategories();
    _categoriesFuture.then((categories) {
      setState(() {
        _allCategories = categories;
        _filteredCategories = categories;
        _allProductsFuture = apiService.fetchAllProducts();
      });
    });
  }

  void _filterCategories(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredCategories = _allCategories.where((category) {
        return category.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  void _filterProducts(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      _filteredProducts = _allProducts.where((product) {
        return product.title.toLowerCase().contains(_searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final now = TimeOfDay.now();
    final isExpressVisible = now.hour >= 10 && now.hour < 16;

    return Scaffold(
      appBar: CustomAppBar(
           showAllProducts: showAllProducts,
           typeview: 'home',
              onSearch: (value) {
               if (showAllProducts) {
                 _filterProducts(value);
               } else {
                 _filterCategories(value);
               }
             },
      ),
      body: Column(
        children: [
            PedidoHeader(typeview: 'home',),
            BotonesHome(
             showAllProducts: showAllProducts,
             isGridView: isGridView,
             onToggleView: () {
               setState(() => isGridView = !isGridView);
             },
             onToggleProducts: () {
               setState(() {
                 if (showAllProducts) {
                   showAllProducts = false;
                   _searchQuery = '';
                 } else {
                   showAllProducts = true;
                   _allProductsFuture.then((products) {
                     _allProducts = products;
                     _filteredProducts = products;
                   });
                 }
               });
             },
           ),
          Expanded(
            child: showAllProducts ? 
                ProductListView(
                    future: _allProductsFuture,
                    filteredProducts: _filteredProducts,
                    isLoading: _allProducts.isEmpty,
                  ) : CategoryListView(
                    categories: _filteredCategories,
                    isGridView: isGridView,
                  ),
          ),
        ],
      ),
      floatingActionButton: isExpressVisible ? ExpressToggleButton(cartProvider: cartProvider) : null,
    );
  }
}