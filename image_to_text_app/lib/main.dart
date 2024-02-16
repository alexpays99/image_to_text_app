import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_text_app/core/injector.dart';
import 'core/injector.dart' as di;
import 'feature/home/presentation/cubit/home_cubit.dart';
import 'navigation/go_rounter.dart';

final _router = di.getIt.get<GoRouterNavigation>().initGoRoute();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.InjectionContainer.initDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
      ],
      child: MaterialApp.router(
        key: GlobalKey(),
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
