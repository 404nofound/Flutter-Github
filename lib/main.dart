import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/page_scaffold.dart';
import 'index.dart';

import 'http.dart';

void main() async {
  //dio.interceptors..add(CookieManager(CookieJar()))..add(LogInterceptor());

  runApp(MyApp());


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*MaterialApp(
      onGenerateTitle: (context) {

      },
    );*/
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == "tip") {
          return MaterialPageRoute(builder: (context) {
            return TipRoute(text: settings.arguments);
          });
        }
        return null;
      },
      routes: {
        "tip2": (context) => TipRoute(text: ModalRoute.of(context).settings.arguments),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(
        title: page.title,
        body: page.builder(context),
        padding: page.padding,
      );
    }));
  }

  List<Widget> _generateItem(BuildContext context, List<PageInfo> children) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        //title: Text(DemoLocalizations.of(context).title),
        title: Text("DEMOXXXX"),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: Text("Flutter应用"),
            children: _generateItem(context, [
              PageInfo("路由传值", (ctx) => RouterTestRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("基础组件"),
            children: _generateItem(context, [
              PageInfo("Context测试", (ctx) => ContextRoute(), withScaffold: false),
              PageInfo("Widget树中获取State对象", (ctx) => RetrieveStateRoute(), withScaffold: false),
              PageInfo("文本、字体样式", (ctx) => TextRoute()),
              PageInfo("按钮", (ctx) => ButtonRoute()),
              PageInfo("图片伸缩", (ctx) => ImageAndIconRoute()),
              PageInfo("单选开关和复选框", (ctx) => SwitchAndCheckBoxRoute()),
              PageInfo("输入框",(ctx)=>FocusTestRoute()),
              PageInfo("进度条", (ctx) => ProgressRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("布局类组件"),
            children: _generateItem(context, [
              PageInfo("Column居中", (ctx) => CenterColumnRoute()),
              PageInfo("表格布局", (ctx) => TableRoute()),
              PageInfo("对齐及相对定位", (ctx) => AlignRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("容器类组件"),
            children: _generateItem(context, [
              PageInfo("填充Padding", (ctx) => PaddingTestRoute()),
              PageInfo("尺寸限制类容器", (ctx) => SizeConstraintsRoute(), withScaffold: false),
              PageInfo("DecoratedBox", (ctx) => DecoratedBoxRoute()),
              PageInfo("Scaffold、TabBar、底部导航", (ctx) => ScaffoldRoute(), withScaffold: false),
            ]),
          ),
          ExpansionTile(
            title: Text("功能性组件"),
            children: _generateItem(context, [
              PageInfo("数据共享(inheritedWidget)",
                      (ctx) => InheritedWidgetTestRoute()),
              PageInfo("跨组件状态管理(Provider)", (ctx) => ProviderRoute()),
              PageInfo("颜色和MaterialColor", (ctx) => ColorRoute(),
                  withScaffold: false),
              PageInfo("主题-Theme", (ctx) => ThemeTestRoute(),
                  withScaffold: false),
              PageInfo("FutureBuilder和StreamBuilder",
                      (ctx) => FutureAndStreamBuilderRoute()),
              PageInfo("对话框", (ctx) => DialogRoute()),
            ]),
          ),
          /*ExpansionTile(
            title: Text("事件处理与通知"),
            children: _generateItem(context, [
              PageInfo("原生指针事件", (ctx) => PointerRoute()),
              PageInfo("通知(Notification)", (ctx) => NotificationRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("自定义组件"),
            children: _generateItem(context, [
              PageInfo("GradientButton", (ctx) => GradientButtonRoute()),
              PageInfo("Material APP", (ctx) => ScaffoldRoute(),
                  withScaffold: false),
              PageInfo("旋转容器：TurnBox", (ctx) => TurnBoxRoute()),
              PageInfo("CustomPaint", (ctx) => CustomPaintRoute()),
              PageInfo(
                  "自绘控件：圆形渐变进度条", (ctx) => GradientCircularProgressRoute()),
              PageInfo("原始指针事件", (ctx) => PointerRoute()),
              PageInfo("自定义UI框架", (ctx) => CustomHome()),
              PageInfo("测试", (ctx) => TestRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("Flutter原理"),
            children: _generateItem(context, [
              PageInfo("图片加载原理与缓存", (ctx) => ImageInternalTestRoute()),
            ]),
          ),
          ExpansionTile(
            title: Text("动画"),
            children: _generateItem(context, [
              PageInfo("放大动画-原始版", (ctx) => ScaleAnimationRoute()),
              PageInfo(
                  "放大动画-AnimatedWidget版", (ctx) => ScaleAnimationRoute1()),
              PageInfo(
                  "放大动画-AnimatedBuilder版", (ctx) => ScaleAnimationRoute2()),
              PageInfo(
                  "放大动画-GrowTransition版", (ctx) => GrowTransitionRoute()),
              PageInfo("Hero动画", (ctx) => HeroAnimationRoute()),
              PageInfo("交织动画(Stagger Animation)", (ctx) => StaggerRoute()),
              PageInfo("动画切换组件(AnimatedSwitcher)",
                      (ctx) => AnimatedSwitcherCounterRoute()),
              PageInfo("动画切换组件高级用法", (ctx) => AnimatedSwitcherRoute()),
              PageInfo("动画过渡组件", (ctx) => AnimatedWidgetsTest()),
            ]),
          ),
          ExpansionTile(
            title: Text("包与插件"),
            children: _generateItem(context, [
              PageInfo("相机", (ctx) => CameraExampleHome(),
                  withScaffold: false),
              PageInfo(
                  "PlatformView示例（webview）", (ctx) => PlatformViewRoute(),
                  padding: false),
            ]),
          ),*/
        ],
      ),
    );
  }
}