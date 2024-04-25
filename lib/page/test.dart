import 'package:flutter/material.dart';

class ScrollableText extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<ScrollableText> {
  final List<int> _counters = [9, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: _buildCounterWidgets(),
    );
  }

  void _incrementCounter(int index) {
    setState(() {
      _counters[index]++;
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      _counters[index]--;
    });
  }

  Widget _buildCounterWidgets() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildScrollableText(),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableText() {
    return const Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
              """Flutterは、Googleが開発したオープンソースのUIフレームワークで、クロスプラットフォームのモバイルアプリケーション（iOSとAndroid）を開発するために使用されます。\n\nFlutterは、単一のコードベースから複数のプラットフォームにわたって高品質で美しいネイティブユーザーインターフェース（UI）を構築することを可能にします。\n\nFlutterの特徴の1つは、ウィジェットと呼ばれる、再利用可能なUIコンポーネントの豊富なセットを提供することです。\n\nFlutterは、Dartという言語を使用して開発されており、これにより高速で効率的なアプリケーションを構築できます。\n\nまた、Flutterはホットリロード機能を備えており、開発者がコードを変更してすぐに変更を反映することができます。\n\nさらに、Flutterは豊富なコミュニティとドキュメントがあり、開発者が効果的に学習し、問題を解決するのに役立ちます。\n\nFlutterは、モバイルアプリ開発者や企業にとって強力なツールであり、その人気は急速に成長しています。\n\nこれにより、Flutterはクロスプラットフォームアプリ開発の主要な選択肢の1つとなっています。\n"""),
        ),
      ),
    );
  }

  Widget _buildCounterRow(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          key: Key('decrement_$index'),
          onPressed: () => _decrementCounter(index),
          child: const Icon(Icons.remove),
        ),
        const SizedBox(width: 25),
        Text(
          '${_counters[index]}',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(width: 25),
        ElevatedButton(
          key: Key('increment_$index'),
          onPressed: () => _incrementCounter(index),
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}


