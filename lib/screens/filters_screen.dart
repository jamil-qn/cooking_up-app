import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenfree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildswitchListTile(String title, String description,
      bool currentValue, Function(bool?) updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Setting'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenfree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildswitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenfree,
                (newValue) {
                  setState(
                    () {
                      _glutenfree = newValue as bool;
                    },
                  );
                },
              ),
              _buildswitchListTile(
                'Lactose-free',
                'Only include Lactose-free meals',
                _lactoseFree,
                (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue as bool;
                    },
                  );
                },
              ),
              _buildswitchListTile(
                'Vegetarian',
                'Only include Vegetarian meals',
                _vegetarian,
                (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue as bool;
                    },
                  );
                },
              ),
              _buildswitchListTile(
                'Vegan',
                'Only include Vegan meals',
                _vegan,
                (newValue) {
                  setState(
                    () {
                      _vegan = newValue as bool;
                    },
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
