

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Demo',
      initialRoute: "/",
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/":(context) => ScaffoldRoute(),
        "page1":(context) => RoutePage1(),
        "page2":(context) => FindStateFromWidget(),
        "page3":(context) => RoutePage3(),
        "page4":(context) => RoutePage4(),
        "page5":(context) => RoutePage5(),
        "page6":(context) => RoutePage6(),
        "page7":(context) => RoutePage7(),
        "page8":(context) => FocusTestRoute(),
        "page9":(context) => FormTestRoute(),
        "row_column":(context) => RowColumnRoute(),
        "flex_layout":(context) => FlexLayoutTestRoute(),
        "wrap_flow":(context) => WrapFlowTestRoute(),
        "stack_positioned":(context) => StackPositionedTestRoute(),
        "padding":(context) => PaddingTestRoute(),
        "decorated_box":(context) => DecoratedBoxTestRoute(),
        "single_child_scroll_view":(context) => SingleChildScrollViewTestRoute(),
        "list_view_builder":(context) => ListViewBuilderTestRoute(),
        "list_view_separated":(context) => ListViewSeparatedTestRoute(),
        "infinite_list_view":(context) => InfiniteListViewTestRoute(),
        "fixed_grid_view":(context) => GridViewFixedCrossAxisCountTestRoute(),
        "max_grid_view":(context) => GridViewMaxCrossAxisExtentTestRoute(),
        "infinite_grid_view":(context) => InfiniteGridView(),
        "custom_scroll_view":(context) => CustomScrollViewTestRoute(),
        "scroll_controller":(context) => ScrollControllerTestRoute(),
        "scroll_notification":(context) => ScrollNotificationTestRoute(),
        "will_pop_scope":(context) => WillPopScopeTestRoute(),
        "inherited_widget":(context) => InheritedWidgetTestRoute(),
        "nav_bar":(context) => NavBarTestRoute(),
        "theme_test_route":(context) => ThemeTestRoute(),
        "future_builder":(context) => FutureBuilderTestRoute(),
        "stream_builder":(context) => StreamBuilderTestRoute(),
        "dialog_page":(context) => DialogPage(),
        "gesture_detector": (context) => GestureDetectorTestRoute(),
        "drag_test":(context) => _Drag(),
        "drag_vertical_test":(context) => _DragVertical(),
        "scale_test":(context) => _ScaleTestRoute(),
        "gesture_recognizer":(context) => _GestureRecognizerTestRoute(),
        "both_direction":(context) => BothDirectionTestRoute(),
        "gesture_conflict":(context) => GestureConflictTestRoute(),
        "notification_test":(context) => NotificationRoute(),
        "scale_animation":(context) => ScaleAnimationRoute(),
        "scale_animation_better":(context) => ScaleAnimationRoute1(),
        "stagger_animation":(context) => StaggerRoute(),
        "animated_switcher":(context) => AnimatedSwitcherCounterRoute(),
      },

    );
  }
}

class ScaffoldRoute extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
  with SingleTickerProviderStateMixin {

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {},),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: MyHomePage(),
          ),
          Container(
            alignment: Alignment.center,
            child: SecondPage(),
          ),
          Container(
            alignment: Alignment.center,
            child: ThirdPage(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {

  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ClipOval(
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          width: 80,
                        ),
                      ),
                    ),
                    Text("Eddy", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.add),
                      title: const Text('Add account'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manage accounts'),
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            WillPopScopeTestRoute(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () async {
                var result = await Navigator.of(context).pushNamed("page1", arguments: "hi");

                print("$result");
              },
            ),
            RandomWordsWidget(),
            FlatButton(
              child: Text("Find State from Widget"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page2");
              },
            ),
            //TapboxA(),
            //ParentWidget(),
            //ParentWidgetC(),
            FlatButton(
              child: Text("文本及样式"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page3");
              },
            ),
            FlatButton(
              child: Text("图标及按钮"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page4");
              },
            ),
            FlatButton(
              child: Text("图片"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page5");
              },
            ),
            SwitchAndCheckBoxTestRoute(),

            FlatButton(
              child: Text("输入框及表单"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page6");
              },
            ),

            FlatButton(
              child: Text("进度条"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page7");
              },
            ),
            FlatButton(
              child: Text("焦点控制"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page8");
              },
            ),
            FlatButton(
              child: Text("表单提交"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("page9");
              },
            ),
            FlatButton(
              child: Text("线性布局"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("row_column");
              },
            ),

            FlatButton(
              child: Text("弹性布局"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("flex_layout");
              },
            ),
            FlatButton(
              child: Text("流式布局"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("wrap_flow");
              },
            ),

            FlatButton(
              child: Text("层叠布局"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("stack_positioned");
              },
            ),

            FlatButton(
              child: Text("Padding"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("padding");
              },
            ),

            FlatButton(
              child: Text("DecoratedBox"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("decorated_box");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPage createState() => _SecondPage();
}

class _SecondPage extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("SingleChildScrollView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("single_child_scroll_view");
              },
            ),
            FlatButton(
              child: Text("ListView.builder"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("list_view_builder");
              },
            ),
            FlatButton(
              child: Text("ListView.separated"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("list_view_separated");
              },
            ),
            FlatButton(
              child: Text("无限上拉列表"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("infinite_list_view");
              },
            ),
            FlatButton(
              child: Text("纵轴固定数量GridView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("fixed_grid_view");
              },
            ),
            FlatButton(
              child: Text("纵轴子元素长度固定GridView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("max_grid_view");
              },
            ),
            FlatButton(
              child: Text("无限上拉GridView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("infinite_grid_view");
              },
            ),
            FlatButton(
              child: Text("CustomScrollView"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("custom_scroll_view");
              },
            ),
            FlatButton(
              child: Text("ScrollController"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("scroll_controller");
              },
            ),
            FlatButton(
              child: Text("ScrollNotification"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("scroll_notification");
              },
            ),

          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  ThirdPage({Key key}) : super(key: key);

  @override
  _ThirdPage createState() => _ThirdPage();
}

class _ThirdPage extends State<ThirdPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("InheritedWidget"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("inherited_widget");
              },
            ),
            FlatButton(
              child: Text("Nav Bar"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("nav_bar");
              },
            ),
            FlatButton(
              child: Text("InheritedWidget"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("theme_test_route");
              },
            ),
            FlatButton(
              child: Text("Future Builder"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("future_builder");
              },
            ),
            FlatButton(
              child: Text("Stream Builder"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("stream_builder");
              },
            ),
            FlatButton(
              child: Text("Dialogs"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("dialog_page");
              },
            ),
            FlatButton(
              child: Text("Gesture Detector"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("gesture_detector");
              },
            ),
            FlatButton(
              child: Text("拖动 任意方向"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("drag_test");
              },
            ),
            FlatButton(
              child: Text("拖动 单一方向"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("drag_vertical_test");
              },
            ),
            FlatButton(
              child: Text("缩放操作"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("scale_test");
              },
            ),
            FlatButton(
              child: Text("手势识别器"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("gesture_recognizer");
              },
            ),
            FlatButton(
              child: Text("手势竞争"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("both_direction");
              },
            ),
            FlatButton(
              child: Text("手势冲突"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("gesture_conflict");
              },
            ),
            FlatButton(
              child: Text("通知"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("notification_test");
              },
            ),
            FlatButton(
              child: Text("动画"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("scale_animation");
              },
            ),
            FlatButton(
              child: Text("动画优化"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("scale_animation_better");
              },
            ),
            HeroAnimationRoute(),
            FlatButton(
              child: Text("交织动画"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("stagger_animation");
              },
            ),
            FlatButton(
              child: Text("动画切换"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed("animated_switcher");
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoutePage1 extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 1"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(ModalRoute.of(context).settings.arguments),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "Returned value"),
                child: Text("Back"),
              )
            ],
          )
        )
      ),
    );
  }
}

class RoutePage3 extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 3"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  Text("Hello world",
                      textAlign: TextAlign.left,
                  ),
                  Text("Hello world! I'm Jack. "*4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Text("Hello world",
                    textScaleFactor: 1.5,
                  ),
                  Text("Hello world "*6,  //字符串重复六次
                    textAlign: TextAlign.center,
                  ),
                  Text("Hello world",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        height: 1.2,
                        fontFamily: "Courier",
                        background: new Paint()..color = Colors.yellow,
                        decoration:TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed
                    ),
                  ),
                  Text.rich(TextSpan(
                    children: [
                      TextSpan(
                        text: "Home: "
                      ),
                      TextSpan(
                        text: "https://yichangshao.com",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                        recognizer: null
                      )
                    ]
                  )),
                  DefaultTextStyle(
                    style: TextStyle(
                      color:Colors.red,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.start,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("hello world"),
                        Text("I am Jack"),
                        Text("I am Jack",
                          style: TextStyle(
                              inherit: false, //2.不继承默认样式
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              )
          )
      ),
    );
  }
}

class RoutePage4 extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 4"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Raised Button"),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text("Flat Button"),
                    onPressed: () {},
                  ),
                  OutlineButton(
                    child: Text("Outline Button"),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () {},
                  ),
                  RaisedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("发送"),
                    onPressed: () {},
                  ),
                  OutlineButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("添加"),
                    onPressed: () {},
                  ),
                  FlatButton.icon(
                    icon: Icon(Icons.info),
                    label: Text("详情"),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("Submit"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.accessible,color: Colors.green,),
                      Icon(Icons.error,color: Colors.green,),
                      Icon(Icons.fingerprint,color: Colors.green,),
                    ],
                  )
                ],
              )
          )
      ),
    );
  }
}

/*class RoutePage5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 5"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        "BoxFit.fill"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                          "BoxFit.contain"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                          "BoxFit.cover"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Text(
                          "BoxFit.fitWidth"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text(
                          "BoxFit.fitHeight"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Text(
                          "BoxFit.scaleDown"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 200.0,
                        height: 50.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          fit: BoxFit.none,
                        ),
                      ),
                      Text(
                          "BoxFit.none"
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 100.0,
                        height: 200.0,
                        child: Image.network(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                          repeat: ImageRepeat.repeatY,
                        ),
                      ),
                      Text(
                          "ImageRepeat.repeatY"
                      )
                    ],
                  ),
                ],
              )
          )
      ),
    );
  }
}*/

class RoutePage5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 5_1"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: SingleChildScrollView(
              child: Column(
                children: <Image>[
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.contain,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.fitWidth,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.scaleDown,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 50.0,
                    width: 100.0,
                    fit: BoxFit.none,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    width: 100.0,
                    color: Colors.blue,
                    colorBlendMode: BlendMode.difference,
                    fit: BoxFit.fill,
                  ),
                  Image(
                    image: NetworkImage(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                    height: 200.0,
                    width: 100.0,
                    repeat: ImageRepeat.repeatY,
                  ),
                ].map((e){
                  return Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: 100.0,
                          child: e,
                        ),
                      ),
                      Text(e.fit.toString())
                    ],
                  );
                }).toList(),
              )
          )
      ),
    );
  }
}

class RoutePage6 extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  //TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 6"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    //controller: _unameController,
                    onChanged: (v) {
                      print("onChange: $v");
                    },
                    decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      //获得焦点下划线设为蓝色
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      prefixIcon: Icon(Icons.lock)
                    ),
                    obscureText: true,
                  )
                ],
              )
          )
      ),
    );
  }
}

class RoutePage7 extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  //TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Route Page 7"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                  LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: 0.5,
                  ),
                  // 模糊进度条(会执行一个旋转动画)
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                  ),
                  //进度条显示50%，会显示一个半圆
                  CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    value: 0.5,
                  ),

                  SizedBox(
                    height: 3,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: .5,
                    )
                  ),

                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation(Colors.blue),
                      value: .7,
                    ),
                  ),

                  ProgressRoute(),
                ],
              )
          )
      ),
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("焦点控制"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    focusNode: focusNode1,
                    decoration: InputDecoration(
                        labelText: "input1"
                    ),
                  ),
                  TextField(
                    focusNode: focusNode2,
                    decoration: InputDecoration(
                        labelText: "input2"
                    ),
                  ),
                  Builder(builder: (ctx) {
                    return Column(
                      children: <Widget>[
                        RaisedButton(
                          child: Text("移动焦点"),
                          onPressed: () {
                            // 这是一种写法
                            // FocusScope.of(context).requestFocus(focusNode2);
                            if (null == focusScopeNode) {
                              focusScopeNode = FocusScope.of(context);
                            }
                            focusScopeNode.requestFocus(focusNode2);
                          },
                        ),
                        RaisedButton(
                          child: Text("隐藏键盘"),
                          onPressed: () {
                            focusNode1.unfocus();
                            focusNode2.unfocus();
                          },
                        )
                      ],
                    );
                  },)
                ],
              )
          )
      ),
    );
  }
}

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Form(
        key: _formKey, //设置globalKey，用于后面获取FormState
        autovalidate: true, //开启自动校验
        child: Column(
          children: <Widget>[
            TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)
                ),
                // 校验用户名
                validator: (v) {
                  return v
                      .trim()
                      .length > 0 ? null : "用户名不能为空";
                }
            ),
            TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock)
                ),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v
                      .trim()
                      .length > 5 ? null : "密码不能少于6位";
                }
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      padding: EdgeInsets.all(15.0),
                      child: Text("登录"),
                      color: Theme
                          .of(context)
                          .primaryColor,
                      textColor: Colors.white,
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));

                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if((_formKey.currentState as FormState).validate()){
                          //验证通过提交数据
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowColumnRoute extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  //TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局Row/Column"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      Text(" hello world "),
                      Text(" I am Jack "),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      Text(" hello world ", style: TextStyle(fontSize: 30.0),),
                      Text(" I am Jack "),
                    ],
                  ),
                ],
              ),
          )
      ),
    );
  }
}

class FlexLayoutTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                //Flex的两个子widget按1：2来占据水平空间
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    height: 100.0,
                    //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                    child: Flex(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 30.0,
                            color: Colors.red,
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 30.0,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}

class WrapFlowTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                Wrap(
                  spacing: 8.0, // 主轴(水平)方向间距
                  runSpacing: 4.0, // 纵轴（垂直）方向间距
                  alignment: WrapAlignment.center, //沿主轴方向居中
                  children: <Widget>[
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
                      label: new Text('Hamilton'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
                      label: new Text('Lafayette'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
                      label: new Text('Mulligan'),
                    ),
                    new Chip(
                      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
                      label: new Text('Laurens'),
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

class StackPositionedTestRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("层叠布局"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Stack(
                alignment:Alignment.center , //指定未定位或部分定位widget的对齐方式
                children: <Widget>[
                  Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
                    color: Colors.red,
                  ),
                  Positioned(
                    left: 18.0,
                    child: Text("I am Jack"),
                  ),
                  Positioned(
                    top: 18.0,
                    child: Text("Your friend"),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<ProgressRoute> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          ),
        ],
      )
    );
  }
}

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("填充Padding"),
      ),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hello world"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("I am Jack"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                child: Text("Your friend"),
              )
            ],
          )
      ),
    );
  }
}

class DecoratedBoxTestRoute extends StatelessWidget {

  //RoutePage1({Key key, @required this.text}) : super(key: key);

  //final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decorated Box"),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.red, Colors.orange[700]]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 4.0
                    )
                  ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                ),
              )
          )
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(wordPair.toString()),
    );
  }
}

class FindStateFromWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("从子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {

              ScaffoldState _state = Scaffold.of(context);

              //ScaffoldState _state = context.findAncestorStateOfType();

              _state.showSnackBar(
                  SnackBar(
                    content: Text("SnackBar Here"),
                  )
              );
            },
            child: Text("Show SnackBar"),
          );
        }),
      ),
    );
  }
}

class TapboxA extends StatefulWidget {

  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxB(
          active: _active,
          onChanged: _handleTapboxChanged
      ),
    );
  }
}

class TapboxB extends StatelessWidget {

  TapboxB({Key key, this.active: false, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white)
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {

  TapboxC({Key key, this.active, @required this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'Inactive',
          style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
            ? Border.all(
              color: Colors.teal[700],
              width: 10.0
          ) : null
        ),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() => new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}

class SingleChildScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Child Scroll View"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: str.split("")
                  .map((c) => Text(c, textScaleFactor: 2.0))
                  .toList(),
            ),
          ),
        ),
      )
    );
  }
}

class ListViewBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Column(
          children: <Widget>[
            ListTile(title: Text("商品列表")),
            Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(title: Text("$index"));
                  }
              ),
            ),
          ],
        )
    );
  }
}

class ListViewSeparatedTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.separated"),
        ),
        body: ListView.separated(

            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
        )
    );
  }
}

class InfiniteListViewTestRoute extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListViewTestRoute> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("ListView.separated"),
        ),
        body: ListView.separated(
          itemCount: _words.length,
          itemBuilder: (context, index) {
            if (_words[index] == loadingTag) {
              if (_words.length - 1 < 100) {
                _retrieveData();
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                );
              } else {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text("没有更多了", style: TextStyle(color: Colors.grey)),
                );
              }
            }
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
        )
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {

      });
    });
  }
}

class GridViewFixedCrossAxisCountTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("纵轴固定数量的GridView"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ],
        )
    );

    /*GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );*/
  }
}

class GridViewMaxCrossAxisExtentTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("纵轴子元素为固定长度的GridView"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 120.0,
              childAspectRatio: 2.0
          ),
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast)
          ],
        )
    );

    /*GridView.extent(
      maxCrossAxisExtent: 120.0,
      childAspectRatio: 2.0,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );*/
  }
}

class InfiniteGridView extends StatefulWidget {
  @override
  _InfiniteGridViewState createState() => new _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView> {

  List<IconData> _icons = [];

  @override
  void initState() {
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("无限上拉GridView"),
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0
            ),
            itemCount: _icons.length,
            itemBuilder: (context, index) {
              if (index == _icons.length - 1 && _icons.length < 200) {
                _retrieveIcons();
              }
              return Icon(_icons[index]);
            })
    );
  }
  
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access, Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Demo"),
              background: Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('list item $index'),
                  );
                },
              childCount: 50
            ),
          )
        ],
      ),
    );
  }
}

class ScrollControllerTestRoute extends StatefulWidget {
  @override
  ScrollControllerTestRouteState createState() => new ScrollControllerTestRouteState();
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0,
            controller: _controller,
            itemBuilder: (context, index) {
              return ListTile(title: Text("$index"));
            }
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo(.0,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease
          );
        },
      ),
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  @override
  _ScrollNotificationTestRouteState createState() =>
      new _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50.0,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text("$index"));
                  }
              ),
              CircleAvatar(  //显示进度百分比
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        ),
      )
    );
  }
}

class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeTestRouteState createState() => new WillPopScopeTestRouteState();
}

class WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text("1秒内连续按两次返回键退出"),
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({
    @required this.data,
    Widget child
  }) : super(child: child);

  final int data;

  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(ShareDataWidget old) {
    return old.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => new _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShareDataWidget
          .of(context)
          .data
          .toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("InheritedWidget")),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Nav Bar"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NavBar(color: Colors.blue, title: "标题"),
            NavBar(color: Colors.white, title: "标题"),
          ],
        )
    );
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  NavBar({Key key, this.color, this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor)
      ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text(" 颜色跟随主题")
              ],
            ),
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(
                  color: Colors.black
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text(" 颜色固定黑色")
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              setState(() =>
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal
              ),
          child: Icon(Icons.palette),
        ),
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
}

class FutureBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Future Builder"),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        )
    );
  }
}

Stream<int> counter() {
  return Stream.periodic(Duration(seconds: 1), (i) {
    return i;
  });
}

class StreamBuilderTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Stream Builder"),
        ),
        body: Center(
          child: StreamBuilder<int>(
            stream: counter(),
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('没有Stream');
                case ConnectionState.waiting:
                  return Text('等待数据...');
                case ConnectionState.active:
                  return Text('active: ${snapshot.data}');
                case ConnectionState.done:
                  return Text('Stream已关闭');
              }
              return null;
            },
          ),
        )
    );
  }
}

class DialogPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Dialogs"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("对话框"),
              onPressed: () async {
                //弹出对话框并等待其关闭
                bool delete = await showDeleteConfirmDialog1(context);
                if (delete == null) {
                  print("取消删除");
                } else {
                  print("已确认删除");
                  //... 删除文件
                }
              },
            ),
            RaisedButton(
              child: Text("选择对话框"),
              onPressed: () {
                changeLanguage(context);
              },
            ),
            RaisedButton(
              child: Text("列表对话框"),
              onPressed: () {
                showListDialog(context);
              },
            ),
            RaisedButton(
              child: Text("自定义对话框"),
              onPressed: () {
                showCustomDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("您确定要删除当前文件吗?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text("删除"),
                          onPressed: () {
                            // 执行删除操作
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("话框（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool deleteTree = await showDeleteConfirmDialog4(context);
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),
            RaisedButton(
              child: Text("显示底部菜单列表"),
              onPressed: () async {
                int type = await _showModalBottomSheet(context);
                print(type);
              },
            ),
            RaisedButton(
              child: Text("显示底部菜单列表2"),
              onPressed: () {
                _showBottomSheet(context);
              },
            ),
            RaisedButton(
              child: Text("显示Loading框"),
              onPressed: () {
                showLoadingDialog1(context);
              },
            ),
            RaisedButton(
              child: Text("显示自定义大小Loading框"),
              onPressed: () {
                showLoadingDialog2(context);
              },
            ),
            RaisedButton(
              child: Text("日历选择框"),
              onPressed: () {
                _showDatePicker1(context);
              },
            ),
            RaisedButton(
              child: Text("IOS风格日历选择框"),
              onPressed: () {
                _showDatePicker2(context);
              },
            ),
          ],
        )
    );


  }
}

Future<bool> showDeleteConfirmDialog1(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Text("您确定要删除当前文件吗?"),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              //关闭对话框并返回true
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    }
  );
}

Future<void> changeLanguage(BuildContext context) async {
  int i = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text("请选择语言"),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 1);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text("中文简体"),
            ),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 2);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: const Text('美国英语'),
            ),
          ),
        ],
      );
    }
  );

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

Future<void> showListDialog(BuildContext context) async {
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(title: Text("请选择")),
          Expanded(
            child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("$index"),
                    onTap: () => Navigator.of(context).pop(index),
                  );
                }
            ),
          )
        ],
      );
      return Dialog(child: child);
    }
  );
  if (index != null) {
    print("点击了：$index");
  }
}

Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null
              ? Theme(data: theme, child: pageChild)
              : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

Future<bool> showDeleteConfirmDialog4(BuildContext context) {
  bool _withTree = false;

  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录?"),
                Builder(
                  builder: (BuildContext context) {
                    return Checkbox(
                      value: _withTree,
                      onChanged: (bool value) {
                        (context as Element).markNeedsBuild();
                        _withTree = !_withTree;
                      },
                    );
                  },
                ),
                /*Checkbox(
                  value: _withTree,
                  onChanged: (bool value) {
                    (context as Element).markNeedsBuild();
                    _withTree = !_withTree;
                  },
                ),*/
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              Navigator.of(context).pop(_withTree);
            },
          )
        ],
      );
    }
  );
}

Future<int> _showModalBottomSheet(BuildContext context) {
  return showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          }
      );
    }
  );
}

PersistentBottomSheetController<int> _showBottomSheet(BuildContext context) {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
      );
    }
  );
}

showLoadingDialog1(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircularProgressIndicator(),
            Padding(
              padding: EdgeInsets.only(top: 26),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    }
  );
}

showLoadingDialog2(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircularProgressIndicator(value: 0.8),
                  Padding(
                    padding: EdgeInsets.only(top: 26),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      }
  );
}

Future<DateTime> _showDatePicker1(BuildContext context) {
  var date = DateTime.now();
  return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(Duration(days: 30)),
  );
}

Future<DateTime> _showDatePicker2(BuildContext context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            minimumDate: date,
            maximumDate: date.add(Duration(days: 30)),
            maximumYear: date.year + 1,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      }
  );
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() => new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("Gesture Detector"),
        ),
        body: Center(
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 200.0,
              height: 100.0,
              child: Text(_operation, style: TextStyle(color: Colors.white)),
            ),
            onTap: () => updateText("Tap"),
            onDoubleTap: () => updateText("DoubleTap"),
            onLongPress: () => updateText("LongPress"),
          ),
        ),
    );
  }

  void updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 0.0;
  double _left = 0.0;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("拖动 任意方向"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text('A')),
              onPanDown: (DragDownDetails e) {
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },
            ),
          )
        ],
      )
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text("拖动 单一方向"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: _top,
              child: GestureDetector(
                child: CircleAvatar(child: Text('A')),
                onVerticalDragUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _top += e.delta.dy;
                  });
                },
              ),
            )
          ],
        )
    );
  }
}

class _ScaleTestRoute extends StatefulWidget {
  @override
  _ScaleTestRouteState createState() => new _ScaleTestRouteState();
}

class _ScaleTestRouteState extends State<_ScaleTestRoute> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("缩放"),
        ),
        body: Center(
          child: GestureDetector(
            child: Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: _width,
              ),
            onScaleUpdate: (ScaleUpdateDetails details) {
              _width = 200 * details.scale.clamp(0.8, 10.0);
            },
          ),
        )
    );
  }
}

class _GestureRecognizerTestRoute extends StatefulWidget {
  @override
  _GestureRecognizerTestRouteState createState() => new _GestureRecognizerTestRouteState();
}

class _GestureRecognizerTestRouteState extends State<_GestureRecognizerTestRoute> {

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别器"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "你好世界"),
              TextSpan(text: "点我变色",
                style: TextStyle(
                  fontSize: 30.0,
                  color: _toggle ? Colors.blue : Colors.red
                ),
                recognizer: _tapGestureRecognizer
                  ..onTap = () {
                    setState(() {
                      _toggle = !_toggle;
                    });
                  },
              ),

              TextSpan(
                text: "你好世界"
              )
            ]
          )
        ),
      ),
    );
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  BothDirectionTestRouteState createState() =>
      new BothDirectionTestRouteState();
}

class BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("手势识别器"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
            ),
          )
        ],
      )
    );
  }
}

class GestureConflictTestRoute extends StatefulWidget {
  @override
  GestureConflictTestRouteState createState() =>
      new GestureConflictTestRouteState();
}

class GestureConflictTestRouteState extends State<GestureConflictTestRoute> {
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别器"),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              left: _left,
              child: GestureDetector(
                child: CircleAvatar(child: Text("A")), //要拖动和点击的widget
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _left += details.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details){
                  print("onHorizontalDragEnd");
                },
                onTapDown: (details){
                  print("down");
                },
                onTapUp: (details){
                  print("up");
                },
              ),
            )
          ],
        )
    );

  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return new NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + " ";
        });
        return true;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("Notification"),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg),
              ],
            ),
          )
      )
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => new _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3),
        vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    animation = new Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {
        });
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Center(
          child: GestureDetector(
            child: Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: animation.value,
              height: animation.value,
            ),
          ),
        )
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    // TODO: implement build
    return AnimatedBuilder(
      animation: animation,
      child: Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      ),
      builder: (BuildContext ctx, Widget child) {
        return new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  @override
  _ScaleAnimationRouteState1 createState() => new _ScaleAnimationRouteState1();
}

class _ScaleAnimationRouteState1 extends State<ScaleAnimationRoute1>
    with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    //图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: Center(
            child: AnimatedImage(animation: animation)
        )
    );
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: "avatar",
          child: Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 50.0,
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {

              return new FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(title: Text("原图")),
                  body: HeroAnimationRouteB(),
                ),
              );
            }
          ));
        },
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.network(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.6,
          curve: Curves.ease,
        )
      )
    );

    color = ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            0.0, 0.6,
            curve: Curves.ease,
          )
        )
    );

    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0.0),
      end: EdgeInsets.only(left: 100.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.6, 1.0,
          curve: Curves.ease,
        )
      )
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              )
            ),
            child: StaggerAnimation(controller: _controller),
          ),
        ),
      ),
    );
  }
}

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() => _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("动画切换"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return SlideTransitionX(
                  child: child,
                  direction: AxisDirection.down, //上入下出
                  position: animation,
                );
              },
              child: Text(
                "$_count",
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            RaisedButton(
              child: Text("+1"),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })
      : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }


  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

