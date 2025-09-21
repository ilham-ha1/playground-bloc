import 'package:flutter_bloc/flutter_bloc.dart';

import 'reimbursment_event.dart';
import 'reimbursment_state.dart';

class ReimbursmentBloc extends Bloc<ReimbursmentEvent, ReimbursmentState> {
  ReimbursmentBloc() : super(const ReimbursmentInitial());
}
