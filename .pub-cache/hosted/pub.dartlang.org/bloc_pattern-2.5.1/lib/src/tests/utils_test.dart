import 'package:bloc_pattern/src/module.dart';
import 'package:flutter/material.dart';

import '../bloc_provider.dart';
import '../bloc.dart';
import '../dependency.dart';

Set<String> _allModules = Set<String>();

void initModule(ModuleWidget module,
    {List<Bloc> changeBloc,
    List<Dependency> changeDependencies,
    bool debugMode = false}) {
  BlocProvider.isTest = true;
  BlocProvider.debugMode = debugMode;
  var key = module.runtimeType.toString();
  _allModules.add(key);
  var blocs = module.blocs;
  var dependencies = module.dependencies;

  if (changeDependencies != null) {
    for (var item in changeDependencies) {
      //blocs.firstWhere((b) => b.inject is T Function(Inject));
      var dep = dependencies.firstWhere((dep) {
        return item.inject.runtimeType == dep.inject.runtimeType;
      }, orElse: () => null);
      if (dep != null) {
        dependencies.remove(dep);
        dependencies.add(item);
      }
    }
  }
  if (changeBloc != null) {
    for (var item in changeBloc) {
      //blocs.firstWhere((b) => b.inject is T Function(Inject));
      var dep = changeBloc.firstWhere((dep) {
        return item.inject.runtimeType == dep.inject.runtimeType;
      }, orElse: () => null);
      if (dep != null) {
        changeBloc.remove(dep);
        changeBloc.add(item);
      }
    }
  }
  BlocProvider.addCoreInit(blocs, dependencies, key);
}

void initModules(List<ModuleWidget> modules,
    {List<Bloc> changeBloc,
    List<Dependency> changeDependencies,
    bool debugMode}) {
  for (var module in modules) {
    initModule(module,
        changeBloc: changeBloc,
        changeDependencies: changeDependencies,
        debugMode: debugMode);
  }
}

void disposeModule<T>() {
  BlocProvider.disposeModule(T.toString());
  _allModules.remove(T.toString());
}

void disposeAllModule() {
  for (var key in _allModules) {
    BlocProvider.disposeModule(key);
    _allModules.remove(key);
  }
}

Widget buildTestableWidget(Widget widget) {
  return MediaQuery(data: MediaQueryData(), child: MaterialApp(home: widget));
}
