import 'package:flutter/material.dart';
import 'package:hospital/page/base/base_page.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital',
      home: BasePage(),
    );
  }
}
//void main() {
  // final HttpLink link = HttpLink('http://192.168.43.204:4000/graphql');
  // ValueNotifier<GraphQLClient> client = ValueNotifier(
  //   GraphQLClient(
  //     link: link,
  //     cache: GraphQLCache(store: InMemoryStore()),
  //   ),
  // );
  // var app = GraphQLProvider(
  //   child: MyApp(),
  //   client: client,
  // );
//   runApp(MyApp());
// }