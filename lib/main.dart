import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//**********THIS IS A titleSection****** */

    Widget _titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Adai Hills Waterfall',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Maharashtra, New Panvel',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );

    // *******************THIS IS A buttonSection */

    // Color color = Theme.of(context).primaryColor;
    // Widget _buttonSection = Container(
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     children: <Widget>[
    //       _buildButtonColumn(color, Icons.call, 'CALL'),
    //       _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    //       _buildButtonColumn(color, Icons.share, 'SHARE'),
    //     ],
    //   ),
    // );

    //***************THIS IS textSection */

    Widget _textSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
        softWrap: true,
      ),
    );

    //*******MATERIALAPP */
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'Flutter layout demo',
              ),
            ),
            body: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      'images/waterfallnew.jpg',
                      width: 600,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                _titleSection,
                _buttonnew,
                // _buttonSection,
                _textSection,
              ],
            )));
  }
}

//**************BuildButtonColun************** */

// Column _buildButtonColumn(Color color, IconData icon, String label) {
//   return Column(
//     mainAxisSize: MainAxisSize.min,
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//       Icon(
//         icon,
//         color: color,
//       ),
//       Container(
//         margin: EdgeInsets.only(top: 8),
//         child: Text(
//           label,
//           style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//         ),
//       )
//     ],
//   );
// }
//*****************************Section FavoriteWidget */

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  //******************This is TOOGLEFAVORITE FUNCTION */

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

void _newbutton() {}
Widget _buttonnew = Container(
    child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    Column(
      children: <Widget>[
        Container(
            child: IconButton(
          icon: Icon(
            Icons.call,
            color: Colors.blue[500],
          ),
          onPressed: () => launch('tel://8268471487'),
        )),
        Text('CALL', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
    Column(
      children: <Widget>[
        Container(
            child: IconButton(
          icon: Icon(
            Icons.near_me,
            color: Colors.blue[500],
          ),
          onPressed: _newbutton,
        )),
        Text('ROUTE', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
    Column(
      children: <Widget>[
        Container(
            child: IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.blue[500],
          ),
          onPressed: _newbutton,
        )),
        Text('SHARE', style: TextStyle(fontWeight: FontWeight.bold))
      ],
    ),
  ],
));
