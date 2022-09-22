import 'package:equatable/equatable.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_state.dart';

abstract class CollectionEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToTopLayer extends CollectionEvents {
  AddToTopLayer({required this.index, required this.child});

  final int index;
  final CollectionState child;
}

class AddToNode extends CollectionEvents {
  AddToNode({required this.index, required this.child});

  final int index;
  final CollectionState child;
}
