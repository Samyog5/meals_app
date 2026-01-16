import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.onToggleFavorite});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){
            onToggleFavorite(meal);
          }, icon: Icon(Icons.star))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Image.network(meal.imageUrl, 
                width: double.infinity, 
                height: 300, 
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15,),
            Text('Ingredents', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 14,),
            for(final ingredient in meal.ingredients)
              Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),),
            const SizedBox(height: 24,),
            Text('Steps', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 14,),
            for(final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(step, 
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,),),
              ),
        
            // ListView.builder(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: meal.ingredients.length,
            //   itemBuilder: (context, index) {
            //     return Text(
            //       meal.ingredients[index],
            //       style: TextStyle(color: Colors.white),
            //     );
            //   },
            // )
          ],
        ),
      ),
    );
  }
}