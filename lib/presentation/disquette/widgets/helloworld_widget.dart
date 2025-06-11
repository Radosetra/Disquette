import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:togo/provider/disquette_provider.dart';

// How to use a provider - For stateless widget?
// We need a consumer so it can be in 2 way:
// 1:
class HelloWorldWidget extends ConsumerWidget{
  const HelloWorldWidget({super.key});

  @override
  // need ref to acces provider state
  Widget build(BuildContext context, WidgetRef ref) {
    // The Riverpod documentation defines WidgetRef as an object that allows widgets to interact with providers.
    // Build context allows access ancestor widgets in the widget tree (such as Theme.of(context) and MediaQuery.of(context))
    // WidgetRef allows to acces any Provider with ref.
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }

}

// 2: more verbose
class HelloWorldWidgetWithInsideConsumer extends StatelessWidget {
  const HelloWorldWidgetWithInsideConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Add a Consumer
    return Consumer(
      // 2. specify the builder and obtain a WidgetRef
      builder: (_, WidgetRef ref, __) {
        // 3. use ref.watch() to get the value of the provider
        final helloWorld = ref.watch(helloWorldProvider);
        return Text(helloWorld);
      },
    );
  }
}


// For stateful widget
class HelloWorldWidgetStf extends ConsumerStatefulWidget {
  @override
  ConsumerState<HelloWorldWidgetStf> createState() => _HelloWorldWidgetStfState();
}

// 2. extend [ConsumerState]
class _HelloWorldWidgetStfState extends ConsumerState<HelloWorldWidgetStf> {
  @override
  void initState() {
    super.initState();
    // 3. if needed, we can read the provider inside initState
    // The difference between ref.read and ref.watch
    // .read(): The provider is accesible at every  lifecycle methods of the widget
    // .watch(): Only build
    final helloWorld = ref.read(helloWorldProvider);
    print(helloWorld); // "Hello world"
  }

  @override
  Widget build(BuildContext context) {
    // 4. use ref.watch() to get the value of the provider
    final helloWorld = ref.watch(helloWorldProvider);
    return Text(helloWorld);
  }
}