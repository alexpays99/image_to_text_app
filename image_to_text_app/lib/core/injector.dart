import 'package:get_it/get_it.dart';
import 'package:image_to_text_app/feature/home/domain/repositories/album_repository.dart';
import 'package:image_to_text_app/feature/home/domain/use_cases/load_artists.dart';
import 'package:image_to_text_app/feature/home/presentation/cubit/artist_cubit.dart';
import 'package:image_to_text_app/feature/home/presentation/cubit/tracks_cubit.dart';

import '../feature/home/data/remote_datasource/remote_datasource.dart';
import '../feature/home/data/repositories/album_resository_impl.dart';
import '../feature/home/data/services/http_service.dart';
import '../feature/home/domain/use_cases/load_artist_tracks.dart';
import '../navigation/go_rounter.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Use cases
    getIt.registerLazySingleton(
      () => LoadArtistsUseCase(albumRepository: getIt()),
    );
    getIt.registerLazySingleton(
      () => LoadArtistTracksUseCase(albumRepository: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(getIt()));

    // Data sourses
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(getIt()));

    // Services
    getIt.registerLazySingleton<HttpService>(
      () => HttpService(),
    );

    // Blocs and Cubits
    getIt.registerLazySingleton(() => ArtistCubit(getIt()));
    getIt.registerLazySingleton(() => TracksCubit(getIt()));

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }
}
