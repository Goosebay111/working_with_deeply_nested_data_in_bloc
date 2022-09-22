import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_bloc.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_event.dart';
import 'package:working_with_deeply_nested_data_in_bloc/bloc/bloc/collection_state.dart';

void addToCollectionLogic(
    ShowType showType, int index, int count, BuildContext context) {
  switch (showType) {
    case ShowType.collection:
      addToTopLayer('Series ${count + 1}', index, ShowType.series, context);
      break;
    case ShowType.series:
      addToNodes('Season ${count + 1}', index, ShowType.season, context);
      break;
    case ShowType.season:
      addToNodes('Episode ${count + 1}', index, ShowType.episode, context);
      break;
    case ShowType.episode:
      break;
  }
}

void addToTopLayer(name, index, showType, context) {
  BlocProvider.of<CollectionBloc>(context).add(
    AddToTopLayer(
      index: index,
      child: CollectionState(
        name: name,
        showType: showType,
        children: [],
        // todo: add this code.
        heartbeats: 0
      ),
    ),
  );
}

void addToNodes(name, index, showType, context) {
  BlocProvider.of<CollectionBloc>(context).add(
    AddToNode(
      index: index,
      child: CollectionState(
        name: name,
        showType: showType,
        children: [],
        // todo: add this code.
        heartbeats: 0
      ),
    ),
  );
}
