import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_event.dart';
import 'package:playground_bloc/features/reimbursment/presentation/bloc/reimbursment/reimbursment_state.dart';

class ReimbursmentBloc extends Bloc<ReimbursmentEvent, ReimbursmentState> {
  ReimbursmentBloc() : super(ReimbursmentInitial());
}
