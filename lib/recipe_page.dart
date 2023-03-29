import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecipePage extends StatefulWidget {
  final List<String> ingredients;
  final String recipeName;
  final List<String> steps;
  final String byWho;

  @override
  State<RecipePage> createState() => _RecipePageState();

  RecipePage(this.ingredients, this.recipeName, this.steps, this.byWho);
}

class _RecipePageState extends State<RecipePage> {
  bool _showAllIngredients = false;
  bool _showAllSteps = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFEDCD),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: headingPadding),
          child: Text(
            widget.recipeName,
            style: mainHeadingStyle,
          ),
        ),

        backgroundColor: Color(0xFFFFEDCD),
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 16.0, 10.0, 0.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.close, color: Colors.black),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                backgroundColor: mainColor,
                elevation: 0.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              child: DecoratedBox(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFFEDCD),
                ),
                child: Column(
                  children: [
                    Row(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0.0),
                            child: Text(
                              "by " + widget.byWho,
                              style: bodyStyle,
                            ),
                          ),
                          Container(
                            child: RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 23.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                        ]),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset('images/pancakes.jpg'),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              iconSize: 30,
                              color: Color(0xCC000000),
                              icon: Icon(Icons.favorite)),

                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: IconButton(
                                onPressed: () {},
                                iconSize: 30,
                                color: Color(0xCC000000),
                                icon: Icon(Icons.archive)),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: IconButton(onPressed: () {},
                                color: Color(0xCC000000),
                                iconSize: 30,
                                icon: Icon(Icons.share)),
                          ),

                          IconButton(onPressed: () {},
                              iconSize: 30,
                              color: Color(0xCC000000),
                              icon: Icon(Icons.check_box_outlined)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0x55808080),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        child: const Text(
                          'Ingredients',
                          style: subHeadingStyle,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 15,
                        indent: 40,
                        endIndent: 40,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...widget.ingredients
                                .take(_showAllIngredients ? widget.ingredients.length : 0)
                                .map(
                                  (ingredient) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 4, right: 8),
                                      child: Icon(Icons.double_arrow, size: 20),
                                    ),
                                    Expanded(
                                      child: Text(
                                        ingredient,
                                        style: bodyStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!_showAllIngredients)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showAllIngredients = true;
                                  });
                                }, icon: Icon(Icons.add),
                              ),
                            if (_showAllIngredients)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showAllIngredients = false;
                                  });
                                }, icon: Icon(Icons.remove),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        child: const Text(
                          'Instructions',
                          style: subHeadingStyle,
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 15,
                        indent: 40,
                        endIndent: 40,
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ...widget.steps
                                .take(_showAllSteps ? widget.steps.length : 0)
                                .map(
                                  (step) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 4, right: 8),
                                      child: Icon(Icons.double_arrow, size: 20),
                                    ),
                                    Expanded(
                                      child: Text(
                                        step,
                                        style: bodyStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!_showAllSteps)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showAllSteps = true;
                                  });
                                }, icon: Icon(Icons.add),
                              ),
                            if (_showAllSteps)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showAllSteps = false;
                                  });
                                }, icon: Icon(Icons.remove),
                              ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),


            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}