import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/item_page.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchState();
  }
}

class _SearchState extends State<SearchWidget> {
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  _SearchState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('items').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    List items = new List<Widget>();
    if ((_searchText.isNotEmpty)) {
      items = _filterList(snapshot);
    } else {
      items = snapshot.map((data) => _buildListItem(context, data)).toList();
    }
    if (items.length == 0) {
      return Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Text(
          'No matches',
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListView(
        padding: const EdgeInsets.only(top: 20.0),
        children: items,
      );
    }
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          trailing: Text(record.likes.toString()),
          onTap: () =>
              //record.reference.updateData({'likes': FieldValue.increment(1)}),
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExtractItemArguments(),
              settings: RouteSettings(
                arguments: ItemArguments(
                  record,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List _filterList(List<DocumentSnapshot> snapshot) {
    List tempList = new List();
    List filtered = snapshot.toList();
    for (int i = 0; i < filtered.length; i++) {
      final record = Record.fromSnapshot(filtered[i]);
      if (record.name.toLowerCase().contains(_searchText.toLowerCase())) {
        tempList.add(filtered[i]);
      }
    }
    return tempList.map((data) => _buildListItem(context, data)).toList();
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        _filter.clear();
      }
    });
  }
}

class Record {
  final String name;
  final int likes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Name'] != null),
        assert(map['likes'] != null),
        name = map['Name'],
        likes = map['likes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$likes>";
}

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemWidget();
  }
}

class ItemArguments {
  final Record record;

  ItemArguments(this.record);
}

class ExtractItemArguments extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute settings and cast
    // them as ScreenArguments.
    final ItemArguments args = ModalRoute.of(context).settings.arguments;
    final record = args.record;

    return Scaffold(
      appBar: AppBar(
        title: Text(record.name),
      ),
      body: Center(
        child: Text(record.likes.toString()),
      ),
    );
  }
}
