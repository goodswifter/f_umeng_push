import 'package:flutter/material.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';
import 'package:umeng_push_sdk/umeng_push_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _deviceToken = '';
  @override
  Widget build(BuildContext context) {
    UmengCommonSdk.initCommon(
        '62f32741bd3e424d1c2caed7', '62f9abcc79848655fadc253a', 'dev');
    // UmengCommonSdk.setPageCollectionModeManual();
    UmengPushSdk.register();
    UmengPushSdk.setPushEnable(true);
    // getUmRegisterId();
    return Scaffold(
      appBar: AppBar(title: const Text('测试 - 第三方')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: SelectableText(
                _deviceToken,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _deviceToken = await getUmRegisterId() ?? '';
                setState(() {});
              },
              child: const Text('测试 - 第三方'),
            ),
          ],
        ),
      ),
    );
  }

  /// 获取有盟的注册ID
  Future<String?> getUmRegisterId() async {
    final String? deviceToken = await UmengPushSdk.getRegisteredId();
    print('UM_TOKEN:$deviceToken');
    return deviceToken;
  }
}
