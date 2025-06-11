import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:togo/presentation/disquette/widgets/card_widget.dart';
import 'package:togo/provider/disquette_provider.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postListAsync = ref.watch(postListProvider);
    return Scaffold(
      body: postListAsync.when(
        data: (posts) => ListView.builder(
          itemBuilder: (context, index){
            final post = posts[index];
            return CardWidget(
              text: post["title"],
              subtitle: post["body"],
            );
          }), 
        error: (err, stack) => Center(child: Text('Error: $err')), 
        loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}