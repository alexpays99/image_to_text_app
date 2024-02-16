import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_to_text_app/core/injector.dart' as di;
import 'package:image_to_text_app/feature/home/data/models/picker_state_model.dart';
import 'package:image_to_text_app/feature/home/presentation/cubit/home_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = di.getIt.get<HomeCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            color: Colors.grey[300],
            child: BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.pickerStateModel?.value !=
                      current.pickerStateModel?.value ||
                  previous.pickerStateModel?.value != null ||
                  current.pickerStateModel?.value != null,
              builder: (context, state) {
                final pickerModel = state.pickerStateModel;
                switch (pickerModel?.pickerState) {
                  case ListState.initial:
                    return const Text('Select image grom gallery');
                  case ListState.loading:
                    return const CircularProgressIndicator();
                  case ListState.loaded:
                    return Image.file(File(pickerModel!.value!));

                  default:
                    return const Text('Select image grom gallery');
                }
              },
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () => cubit.pickImageFromGallery(),
            child: const Text('Select An Image'),
          ),
        ],
      ),
    );
  }
}
