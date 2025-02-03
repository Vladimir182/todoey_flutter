import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_provider.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/widgets/task_title.dart';

void main() {
  group('TasksScreen Widget Tests', () {
    testWidgets('TasksScreen should display initial tasks',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
          child: MaterialApp(
            home: TasksScreen(),
          ),
        ),
      );

      expect(find.text('Todoey'), findsOneWidget);
      expect(find.text('4 Tasks'), findsOneWidget);
      expect(find.byType(TasksList), findsOneWidget);
    });

    testWidgets('TasksScreen should show AddTaskScreen when FAB is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>(
          create: (context) => TaskProvider(),
          child: MaterialApp(
            home: TasksScreen(),
          ),
        ),
      );

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.text('Add Task'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });
  });

  group('AddTaskScreen Widget Tests', () {
    testWidgets('AddTaskScreen should add a task when the button is pressed',
        (WidgetTester tester) async {
      final taskProvider = TaskProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>.value(
          value: taskProvider,
          child: MaterialApp(
            home: AddTaskScreen(),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'New Task');
      await tester.tap(find.text('Add'));
      await tester.pump();

      expect(taskProvider.tasks.length, 5);
      expect(taskProvider.tasks.last.name, 'New Task');
    });
  });

  group('TasksList Widget Tests', () {
    testWidgets('TasksList should display tasks', (WidgetTester tester) async {
      final taskProvider = TaskProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>.value(
          value: taskProvider,
          child: MaterialApp(
            home: Scaffold(
              body: TasksList(),
            ),
          ),
        ),
      );

      expect(find.text('Pay milk'), findsOneWidget);
      expect(find.text('pay orange'), findsOneWidget);
    });

    testWidgets('TasksList should toggle task completion',
        (WidgetTester tester) async {
      final taskProvider = TaskProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>.value(
          value: taskProvider,
          child: MaterialApp(
            home: Scaffold(
              body: TasksList(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();

      expect(taskProvider.tasks[0].isDone, true);
    });

    testWidgets('TasksList should delete a task on long press',
        (WidgetTester tester) async {
      final taskProvider = TaskProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<TaskProvider>.value(
          value: taskProvider,
          child: MaterialApp(
            home: Scaffold(
              body: TasksList(),
            ),
          ),
        ),
      );

      await tester.longPress(find.text('Pay milk').first);
      await tester.pump();

      expect(taskProvider.tasks.length, 3);
    });
  });

  group('TaskTitle Widget Tests', () {
    testWidgets('TaskTitle should display task title and checkbox',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskTitle(
              isChecked: false,
              taskTitle: 'Test Task',
              checkboxCallback: (bool? value) {},
              longPressCallback: () {},
            ),
          ),
        ),
      );

      expect(find.text('Test Task'), findsOneWidget);
      expect(find.byType(Checkbox), findsOneWidget);
    });

    testWidgets('TaskTitle should toggle checkbox',
        (WidgetTester tester) async {
      bool isChecked = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: TaskTitle(
              isChecked: isChecked,
              taskTitle: 'Test Task',
              checkboxCallback: (bool? value) {
                isChecked = value ?? false;
              },
              longPressCallback: () {},
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();

      expect(isChecked, true);
    });
  });
}
