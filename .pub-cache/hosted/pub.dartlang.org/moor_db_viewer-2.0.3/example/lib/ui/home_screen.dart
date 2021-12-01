import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';
import 'package:moor_db_viewer_example/db/db_util.dart';
import 'package:moor_db_viewer_example/db/my_db.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyDatabase get db => DbUtil.db;
  var _dbViewerOpen = false;
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text('Home Screen'),
          ),
          body: Stack(
            children: [
              ListView(
                children: [
                  MaterialButton(
                    child: Text('GO to dbviewer'),
                    onPressed: _onGoToDbViewerClicked,
                  ),
                  MaterialButton(
                    child: Text('Add User'),
                    onPressed: _addUser,
                  ),
                  MaterialButton(
                    child: Text('Remove first User'),
                    onPressed: _removeUser,
                  ),
                  MaterialButton(
                    child: Text('Add TODO'),
                    onPressed: _addTodo,
                  ),
                  MaterialButton(
                    child: Text('Remove first TODO'),
                    onPressed: _removeTodo,
                  ),
                  MaterialButton(
                    child: Text('Add 100 TODO'),
                    onPressed: _add100Todos,
                  ),
                  MaterialButton(
                    child: Text('Add 10000 TODO'),
                    onPressed: _add10000Todos,
                  ),
                  MaterialButton(
                    child: Text('Add 1000000 TODO'),
                    onPressed: _add1000000Todos,
                  ),
                  MaterialButton(
                    child: Text('clear db'),
                    onPressed: _clearDb,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      onChanged: _onTextFieldChanged,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Visibility(
          visible: _dbViewerOpen,
          child: MoorDbViewer(db),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            child: Icon(Icons.developer_mode),
            onPressed: _onFabClicked,
          ),
        ),
      ],
    );
  }

  void _onGoToDbViewerClicked() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MoorDbViewer(db)));
  }

  Future<void> _removeTodo() async {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    final result = await db.select(db.todos).get();
    if (result.isEmpty) return;
    final first = result.first;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await (db.delete(db.todos)..where((item) => item.id.equals(first.id))).go();
  }

  Future<void> _removeUser() async {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    final result = await db.select(db.users).get();
    if (result.isEmpty) return;
    final first = result.first;
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await (db.delete(db.users)..where((item) => item.id.equals(first.id))).go();
  }

  void _onFabClicked() {
    setState(() {
      _dbViewerOpen = !_dbViewerOpen;
    });
  }

  Future<void> _addUser() async {
    await addCategory([createCategory()]);
  }

  Future<void> _addTodo() async {
    _addTodos([createTodo()]);
  }

  Future<void> _add100Todos() async {
    final list = List<TodosCompanion>();
    for (var i = 0; i < 100; i++) {
      list.add(createTodo());
    }
    _addTodos(list);
  }

  Future<void> _add10000Todos() async {
    print('STARTED');
    final list = List<TodosCompanion>();
    for (var i = 0; i < 10000; i++) {
      list.add(createTodo());
    }
    _addTodos(list);
    print('SAVED');
  }

  Future<void> _add1000000Todos() async {
    print('STARTED');
    final list = List<TodosCompanion>();
    for (var i = 0; i < 1000000; i++) {
      list.add(createTodo());
    }
    _addTodos(list);
    print('SAVED');
  }

  TodosCompanion createTodo() {
    return TodosCompanion.insert(
      title: '$text title',
      content: '$text content',
      date: DateTime.now(),
      completed: Random().nextBool(),
      blobColumn: Uint8List(0),
      realColumn: Random().nextInt(2983892) + 0.5,
    );
  }

  UsersCompanion createCategory() {
    return UsersCompanion.insert(
      firstName: 'Koen',
      zipcode: '2000',
      age: Random().nextInt(100) + 5,
      adress1: 'Street 1',
      adress2: '/',
      phone: '0483993849',
      country: 'Belgium',
      city: 'Antwerp',
      email: 'my-email@email.com',
      lastName: 'Van Looveren',
    );
  }

  Future<void> _addTodos(List<TodosCompanion> list) async {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await db.batch((batch) {
      batch.insertAll(db.todos, list);
    });
  }

  Future<void> addCategory(List<UsersCompanion> list) async {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await db.batch((batch) {
      batch.insertAll(db.users, list);
    });
  }

  Future<void> _clearDb() async {
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await db.delete(db.todos).go();
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    await db.delete(db.users).go();
  }

  void _onTextFieldChanged(String value) {
    text = value;
  }
}
