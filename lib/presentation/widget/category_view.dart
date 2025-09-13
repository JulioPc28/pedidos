import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grupo_exito/presentation/widget/text_input_pedidos.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:grupo_exito/services/api_services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoryListView extends StatelessWidget {
  final List<String> categories;
  final bool isGridView;

  const CategoryListView({
    super.key,
    required this.categories,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();
    final cartColor = Provider.of<CartProvider>(context).cartColor;

    if (categories.isEmpty) {
      return const Center(
        child: Text(
          'No hay categorías que coincidan',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }

    return isGridView  ? 
        GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: kIsWeb ? 4 : 2,
            childAspectRatio: 0.85,
            crossAxisSpacing: 3.w,
            mainAxisSpacing: 2.h,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return FutureBuilder<String?>(
              future: apiService.fetchFirstImageByCategory(category),
              builder: (context, snapshot) {
                final imageUrl = snapshot.data;
                return GestureDetector(
                  onTap: () => context.push('/products/$category'),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: imageUrl != null
                              ? Image.network(
                                  imageUrl,
                                  height: 18.h,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  height: 18.h,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.image_not_supported,
                                    size: 40,
                                  ),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 1.h,
                          ),
                          child: TextInputPedidos(
                            title: category,
                            colorText: Colors.black,
                            dimen: 15.sp,
                            onPressed: () {},
                            sombra: true,
                            subrayado: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return FutureBuilder<String?>(
                future: apiService.fetchFirstImageByCategory(category),
                builder: (context, snapshot) {
                  final imageUrl = snapshot.data;
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 1.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 1.2.h,
                      ),
                      leading: CircleAvatar(
                        radius: 4.h,
                        backgroundColor: Colors.grey[200],
                        child: imageUrl != null
                            ? ClipOval(
                                child: Image.network(
                                  imageUrl,
                                  width: 4.h * 2, // diámetro del círculo
                                  height: 4.h * 2,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : Icon(
                                Icons.shopping_bag,
                                size: 22.sp,
                                color: cartColor,
                              ),
                      ),
                      title: TextInputPedidos(
                        title: category,
                        colorText: Colors.black,
                        dimen: 15.sp,
                        onPressed: null, 
                        sombra: true,
                        subrayado: false,
                      ),
                      onTap: () => context.push('/products/$category'), // activa navegación
                      trailing: GestureDetector(
                        onTap: () => context.push('/products/$category'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                            vertical: 0.5.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Ver más',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
  }
}