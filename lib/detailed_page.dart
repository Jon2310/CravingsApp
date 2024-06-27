import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

enum Filter
{
  // Six Flavor Profiles
  Spicy,
  Sweet,
  Savory,
  Salty,
  Sour,
  Bitter,
  // Price Range according to https://www.cmsmax.com/faqs/misc/price-ranges
  S,      // < $10
  $$,     // $10 - $25
  $$$,    // $25 - $50
  $$$$,   // > $50
  // Time Categorization
  Breakfast,
  Lunch,
  Dinner,
  Dessert,
  // Diet, if the food/location has the option
  Vegetarian,
  Vegan,
  Pescatarian,
  Paleo,
  Keto,
  // Religious
  Kosher,
  Halal,
  // Continent-based, Six (sans Antarctica for obvious reasons) is compact compared to Country-Based Cuisine
  Asian,
  African,
  North_American,
  South_American,
  European,
  Australian,
}

class DetailedPage extends StatefulWidget  {

  final bool tSpicy;
  final bool tSweet;
  final bool tSavory;
  final bool tSalty;
  final bool tSour;
  final bool tBitter;

  const DetailedPage(
      {
        super.key,
        required this.tSpicy,
        required this.tSweet,
        required this.tSavory,
        required this.tSalty,
        required this.tSour,
        required this.tBitter
      }
      );

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {

  Set<Filter> filters = <Filter>{};

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            const Text('Please select what you are craving'),
            const SizedBox(height: 5.0),
            Expanded(
              child: Wrap(
                spacing: 5.0,
                children: Filter.values.map((Filter x)  {
                  if(widget.tSpicy)
                  {
                    filters.add(Filter.Spicy);
                  }
                  if(widget.tSweet)
                  {
                    filters.add(Filter.Sweet);
                  }
                  if(widget.tSavory)
                  {
                    filters.add(Filter.Savory);
                  }
                  if(widget.tSalty)
                  {
                    filters.add(Filter.Salty);
                  }
                  if(widget.tSour)
                  {
                    filters.add(Filter.Sour);
                  }
                  if(widget.tBitter)
                  {
                    filters.add(Filter.Bitter);
                  }
                  return FilterChip(
                    label: Text(x.name),
                    selected: filters.contains(x),
                    onSelected: (bool selected) {
                      setState(() {
                        if(selected) {
                          filters.add(x);
                        } else {
                          filters.remove(x);
                        }
                      });
                      },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10.0),

            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('foods').snapshots(),
                builder: (context,snapshot){
                  List<Row> foodWidgets = [];

                  if(snapshot.hasData)
                    {
                      final foods = snapshot.data?.docs.reversed.toList();
                      for(var food in foods!)
                        {
                          final foodWidget = Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(food['name']),
                            ],
                          );
                          foodWidgets.add(foodWidget);
                        }
                    }

                  return Expanded(

                    child: ListView(
                      children: foodWidgets,
                    ),
                  );
                }
            ),

            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()
                    )
                );
              },
              child: const Text(
                'Sign Out',
                style: TextStyle(),
              ),
            ),
          ],

        ),
      ),
    );
  }
}


