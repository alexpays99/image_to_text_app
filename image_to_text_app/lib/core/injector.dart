import 'package:get_it/get_it.dart';
import 'package:image_to_text_app/feature/home/domain/repositories/album_repository.dart';
import 'package:image_to_text_app/feature/home/domain/use_cases/load_image_from_gallery.dart';
import 'package:image_to_text_app/feature/home/presentation/cubit/home_cubit.dart';

import '../feature/home/data/data_sources/local_datasource.dart';
import '../feature/home/data/data_sources/remote_datasource.dart';
import '../feature/home/data/repositories/album_resository_impl.dart';
import '../feature/home/data/repositories/image_picker_repository_impl.dart';
import '../feature/home/data/services/ai_generative_service.dart';
import '../feature/home/data/services/image_picker_service.dart';
import '../feature/home/domain/repositories/image_picker_repository.dart';
import '../navigation/go_rounter.dart';

GetIt getIt = GetIt.instance;

abstract class InjectionContainer {
  static void initDependencyInjection() async {
    // Side packages
    // getIt.registerLazySingleton<Connectivity>(() => Connectivity());

    // Use cases
    getIt.registerLazySingleton(
      () => LoadImageFromGalleryUseCase(imagePickerRepository: getIt()),
    );

    // Repositories
    getIt.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(getIt()));
    getIt.registerLazySingleton<ImagePickerRepository>(
        () => ImagePickerRepositoryImpl(getIt()));

    // Data sourses
    getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(getIt()));
    getIt.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(getIt()));

    // Services
    getIt.registerLazySingleton<AIGenerativeService>(
      () => AIGenerativeService(),
    );
    getIt.registerLazySingleton<ImagePickerService>(
      () => ImagePickerService(),
    );

    // Blocs and Cubits
    getIt.registerLazySingleton(() => HomeCubit(getIt()));

    // Go Router
    getIt.registerFactory(() => GoRouterNavigation());
  }
}
