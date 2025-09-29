import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_bloc.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_event.dart';
import 'package:playground_bloc/features/questionere/presentation/bloc/questionere/questionere_state.dart';
import 'package:playground_bloc/features/questionere/presentation/widgets/qu_bottom_navbar.dart';
import 'package:playground_bloc/features/questionere/presentation/widgets/qu_loaded_widget.dart';
import 'package:playground_bloc/shared/widget/app_bar.dart';

class QuestionereScreen extends StatefulWidget {
  const QuestionereScreen({super.key});

  @override
  State<QuestionereScreen> createState() => _QuestionereScreenState();
}

class _QuestionereScreenState extends State<QuestionereScreen> {
  @override
  void initState() {
    super.initState();
    context.read<QuestionereBloc>().add(QuestionereInit());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMenu(title: 'Questionere'),
      bottomNavigationBar: QuBottomNavigationBar(),
      body: BlocBuilder<QuestionereBloc, QuestionereState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text(message)),
            success: (message) => Center(child: Text(message)),
            loaded:
                (photos, capturedPaths) => QuLoadedWidget(
                  photos: photos,
                  capturedPaths: capturedPaths,
                ),
          );
        },
      ),
    );
  }
}
