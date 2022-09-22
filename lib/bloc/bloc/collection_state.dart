//todo: add this package
import 'package:equatable/equatable.dart';

enum ShowType { collection, series, season, episode }

//todo: extend this class with Equatable
class CollectionState extends Equatable {
  const CollectionState({
    required this.name,
    required this.children,
    required this.showType,
    // todo: add the following
    required this.heartbeats, // hack to get Equatable to work
  });
  final String name;
  final List<CollectionState> children;
  final ShowType showType;
  // todo: add heartbeats to state
  final int heartbeats;

  factory CollectionState.initial() {
    return const CollectionState(
      name: "Collection",
      showType: ShowType.collection,
      children: [],
      //todo: add the following
      heartbeats: 0,
    );
  }

  List<CollectionState> getAllNodes(CollectionState node) {
    // create an empty list to store the result
    List<CollectionState> result = [];
    // add the current node
    result.add(node);
    // add the children too
    for (CollectionState child in node.children) {
      // composite design pattern seek and find
      // goes down the rabbit hole until it finds the bottom
      result.addAll(getAllNodes(child));
    }
    return result;
  }

  CollectionState copyWith({
    String? name,
    List<CollectionState>? children,
    ShowType? showType,
  }) {
    return CollectionState(
      name: name ?? this.name,
      children: children ?? this.children,
      showType: showType ?? this.showType,
      // todo: add the following
      heartbeats: heartbeats + 1,
    );
  }

// todo: add the following
  @override
  List<Object> get props => [name, children, showType, 
  heartbeats
  ];
}
