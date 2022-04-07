import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const nameRoute = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child);
  }

  const MealDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);
    final selectedMealStept = selectedMeal.steps;
    final selectedMealIngredients = selectedMeal.ingredients;
    final appTheme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: appTheme.secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMealIngredients[index]),
                    ),
                  );
                },
                itemCount: selectedMealIngredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${(index + 1)}'),
                  ),
                  title: Text(selectedMealStept[index],
                      style: appTheme.textTheme.bodyText1),
                );
              },
              itemCount: selectedMealStept.length,
            ))
          ],
        ),
      ),
    );
  }
}
