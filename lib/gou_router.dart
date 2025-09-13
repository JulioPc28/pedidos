import 'package:go_router/go_router.dart';
import 'package:grupo_exito/presentation/screens/onboarding.dart';
import 'package:grupo_exito/presentation/screens/produc_detail.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/product_list_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
     builder: (context, state) => const Onboarding(),
     
    ),
    GoRoute(
     // name: HomeScreen.name,
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/products/:category',
      builder: (context, state) {
        final category = state.pathParameters['category']!;
        return ProductListScreen(category: category);
      },
    ),
    GoRoute(
      path: '/products/all',
      builder: (context, state) {
        return const ProductListScreen(category: 'all');
      },
    ),
    GoRoute(
      path: '/carrito',
      builder: (context, state) => const ProducDetail(),
    ),
  ],
);