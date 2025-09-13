import 'package:flutter/material.dart';
import 'package:grupo_exito/models/product.dart';
import 'package:grupo_exito/presentation/widget/appBar.dart';
import 'package:grupo_exito/presentation/widget/boton_spress.dart';
import 'package:grupo_exito/presentation/widget/container_decoration.dart';
import 'package:grupo_exito/presentation/widget/product_list_view.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:grupo_exito/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';




class ProductListScreen extends StatefulWidget {
  final String? category;

  const ProductListScreen({super.key, required this.category});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late Future<List<Product>> _productsFuture;
  List<Product> _allProducts = [];
  List<Product> _filteredProducts = [];
  String _searchQuery = '';  
  
  final apiService = ApiService();
   // final apiService = MockApiService();

 @override
void initState() {
  super.initState();
  if (widget.category == null || widget.category!.toLowerCase() == 'all') {
    _productsFuture = apiService.fetchAllProducts();
  } else {
    _productsFuture = apiService.fetchProductsByCategory(widget.category!);
  }

  _productsFuture.then((products) {
    setState(() {
      _allProducts = products;
      _filteredProducts = products;
    });
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
      showAllProducts: true,
      typeview: 'list',
      onSearch: _filterProducts,
     ),
   
         body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: [
              PedidoHeader(typeview: 'list',),
              SizedBox(height: 2.h,),
             TextInputPedidos(
               title: '  Categoría: ${widget.category}',
               colorText: Colors.black,
               dimen: 15.sp,
               onPressed: () {},
               sombra: false,
               subrayado: false,
             ),
              Expanded(
               child: ProductListView(
                       future: _productsFuture,
                       filteredProducts: _filteredProducts,
                       isLoading: _allProducts.isEmpty,
                     ),
             ),
           ],
         ),
       floatingActionButton: isExpressVisible ? ExpressToggleButton(cartProvider: cartProvider) : null,
    );
  }
}