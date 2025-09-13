import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grupo_exito/providers/cart_provider.dart';
import 'package:grupo_exito/gou_router.dart';
import 'package:sizer/sizer.dart'; 

void main() {
  runApp(const PedidosApp()); // Punto de entrada de la aplicación 😉
}

class PedidosApp extends StatelessWidget {
  const PedidosApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Inyecta CartProvider en toda la app
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const _AppInitializer(), // Inicializa preferencias antes de mostrar la interfaz
    );
  }
}

class _AppInitializer extends StatelessWidget {
  const _AppInitializer();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    // Espera a que se cargue el estado guardado del modo express
    return FutureBuilder(
      future: cartProvider.loadPreferences(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Muestra una pantalla de carga mientras se inicializa
          return const MaterialApp(
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        // Una vez cargado, muestra la app con las rutas definidas
        return Sizer(
          builder: (context, orientation, deviceType){
              return  MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: 'Pedidos',
              routerConfig: appRouter,
            );
          },
        );
      },
    );
  }
}