import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:products_app/core/router/app_router_notifier.dart';
import 'package:products_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:products_app/features/auth/presentation/screens/check_auth_status_screen.dart';
import 'package:products_app/features/auth/presentation/screens/login_screen.dart';
import 'package:products_app/features/auth/presentation/screens/register_screen.dart';
import 'package:products_app/features/products/presentation/screens/products_screen.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/check-status',
    refreshListenable: goRouterNotifier,
    routes: [
      /// Primera pantalla
      GoRoute(
        path: '/check-status',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),

      /// Auth Routes
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),

      /// Product Routes
      GoRoute(path: '/', builder: (context, state) => const ProductsScreen()),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/check-status' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.unauthenticated) {
        if (isGoingTo == '/login' && isGoingTo == '/register') {
          return null;
        }
        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/check-status') {
          return '/';
        }
      }

      return null;
    },
  );
});
