import 'package:flutter/cupertino.dart';
import 'package:quotes_app/model/model_screen.dart';
import 'package:quotes_app/utils/global.dart';

class QutoesScreen extends StatefulWidget {
  const QutoesScreen({super.key});

  @override
  State<QutoesScreen> createState() => _QutoesScreenState();
}

class _QutoesScreenState extends State<QutoesScreen> {
  QuotesModel data=QuotesModel();
  @override
  Widget build(BuildContext context) {
    data =ModalRoute.of(context)!.settings.arguments as QuotesModel;
    return const Placeholder();
  }
}
