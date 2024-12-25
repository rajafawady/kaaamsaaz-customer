import 'package:go_router/go_router.dart';
import 'package:kaaamsaaz_customer/screens/booking_confirmation.dart';
import 'package:kaaamsaaz_customer/screens/booking_screen.dart';
import 'package:kaaamsaaz_customer/screens/order_placed_screen.dart';
import 'package:kaaamsaaz_customer/screens/provider_profile_screen.dart';
import 'package:kaaamsaaz_customer/screens/service_details.screen.dart';
import 'package:kaaamsaaz_customer/screens/service_list_screen.dart';
import '../screens/home_screen.dart';
import '../screens/order_history_screen.dart';
import '../screens/shop_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/profile_screen.dart';
import '../components/custom_bottom_navbar.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        builder: (context, state) => CustomBottomNavBar(child: HomeScreen()),
        routes: [
          GoRoute(
            path: '/servicesList',
            builder: (context, state) {
              final category = state.extra as String;
              return CustomBottomNavBar(
                  child: ServiceListScreen(category: category));
            },
            routes: [
              GoRoute(
                path: '/serviceDetails',
                builder: (context, state) {
                  final serviceIndex = state.extra as String;
                  return CustomBottomNavBar(
                      child: ServiceDetailsScreen(serviceIndex: serviceIndex));
                },
                routes: [
                  GoRoute(
                    path: '/providerDetails',
                    builder: (context, state) {
                      return CustomBottomNavBar(child: ProviderProfileScreen());
                    },
                  ),
                  GoRoute(
                      path: '/booking',
                      builder: (context, state) {
                        return CustomBottomNavBar(child: BookServiceScreen());
                      },
                      routes: [
                        GoRoute(
                            path: '/bookingConfirmation',
                            builder: (context, state) {
                              return CustomBottomNavBar(
                                  child: BookingConfirmationScreen());
                            },
                            routes: [
                              GoRoute(
                                path: '/orderPlaced',
                                builder: (context, state) {
                                  return CustomBottomNavBar(
                                      child: OrderPlacedScreen());
                                },
                              ),
                            ]),
                      ]),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/notes',
        builder: (context, state) =>
            CustomBottomNavBar(child: OrdersHistoryScreen()),
      ),
      GoRoute(
        path: '/shop',
        builder: (context, state) => CustomBottomNavBar(child: ShopScreen()),
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => CustomBottomNavBar(child: ChatScreen()),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => CustomBottomNavBar(child: ProfileScreen()),
      ),
    ],
  );
}
