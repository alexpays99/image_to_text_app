import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_to_text_app/feature/home/domain/entities/artist_base_info_entity.dart';
import 'package:image_to_text_app/navigation/bottom_navigation_bar.dart';

import '../feature/home/presentation/artist_info_page.dart';
import '../feature/home/presentation/home_page.dart';
import 'router_paths.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _sectionNavigatorFavouriteKey =
    GlobalKey<NavigatorState>(debugLabel: 'Favourite');

class GoRouterNavigation {
  GoRouter initGoRoute() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutePaths.home,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return BottomNavigationBarWidget(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorHomeKey,
              routes: [
                GoRoute(
                  path: RoutePaths.home,
                  name: RoutePaths.home,
                  pageBuilder: (context, state) => const NoTransitionPage(
                    child: HomePage(),
                  ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.artistInfo,
                      name: RoutePaths.artistInfo,
                      builder: (context, state) {
                        final artistExtra = state.extra;
                        if (artistExtra is ArtistBaseInfoEntity) {
                          return ArtistInfoPage(artist: artistExtra);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _sectionNavigatorFavouriteKey,
              routes: [
                GoRoute(
                  path: RoutePaths.favourite,
                  name: RoutePaths.favourite,
                  pageBuilder: (context, state) => const NoTransitionPage(
                      child: Placeholder() // FavouritePage(),
                      ),
                  routes: <RouteBase>[
                    GoRoute(
                      path: RoutePaths.favouriteInfo,
                      name: RoutePaths.favouriteInfo,
                      pageBuilder: (context, state) => const NoTransitionPage(
                          child: Placeholder() //FavouriteInfoPage(),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
