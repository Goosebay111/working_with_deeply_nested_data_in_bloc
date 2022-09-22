
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_event.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_state.dart';

class CollectionBloc extends Bloc<CollectionEvents, CollectionState> {
  CollectionBloc() : super(CollectionState.initial()) {
    on<AddToTopLayer>((event, emit) =>
        emit(state.copyWith(children: [...state.children, event.child])));

    on<AddToNode>(
      (event, emit) {
        /// makes a copy of all of the nodes contained in the state.
        final List<CollectionState> nodes = state.getAllNodes(state);

        /// Expose the parent node.
        final CollectionState parent = nodes[event.index];

        /// add to the children of the parent, which changes the nested state of the data.
        parent.children.add(event.child);

        /// adds the updated nested data to the empty children list of the copyWith object.
        //emit(state.copyWith(children: []..addAll(state.children)));
        /// OR
        emit(state.copyWith(children: [...state.children]));
        /// OR
        /// emit(state.copyWith(children: [...list[0].children]));
      },
    );
  }
}
