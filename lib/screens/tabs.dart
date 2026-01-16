import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal = [];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(message),));
  }

  void _toggleMealFavouriteStatus(Meal meal){
    final isExisting = _favoriteMeal.contains(meal);
    if(isExisting){
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _showInfoMessage("Meal is no longer in favorite list");
    }else{
      setState(() {
        _favoriteMeal.add(meal);
        _showInfoMessage("Meal is marked as favorite");
      });
    }
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavouriteStatus,);
    var activePageTitle = 'Categories';
    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favoriteMeal, onToggleFavorite: _toggleMealFavouriteStatus,);
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: const MainDrawer(),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label:'Categories' ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label:'Favorites' ),
        ],
        onTap: _selectPage ,
      ),
    );
  }
}