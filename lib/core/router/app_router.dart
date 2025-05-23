import 'package:go_router/go_router.dart';
import 'package:products_app/features/auth/presentation/screens/login_screen.dart';
import 'package:products_app/features/auth/presentation/screens/register_screen.dart';
import 'package:products_app/features/products/presentation/screens/products_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    /// Auth Routes
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),

    /// Product Routes
    GoRoute(path: '/', builder: (context, state) => const ProductsScreen()),
  ],
);
