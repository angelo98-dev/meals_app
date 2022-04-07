import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static var routeName = '/category-meal';

  // final String categoryId;
  // final String categoryTitle;
  //
  // const CategoryMealsScreen(this.categoryId,this.categoryTitle,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final cateroyMeals = dummyMeals.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: cateroyMeals[index].id,
              title: cateroyMeals[index].title,
              imageUrl: cateroyMeals[index].imageUrl,
              affordability: cateroyMeals[index].affordability,
              duration: cateroyMeals[index].duration,
              complexity: cateroyMeals[index].complexity);
        },
        itemCount: cateroyMeals.length,
      ),
    );
  }
}
