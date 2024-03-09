import 'package:flutter/material.dart';
import 'colors.dart';
import 'icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivering to",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.black45),
              // style: Theme.of(context).textTheme.titleMedium,
              // style: TextStyle(color: Colors.black45, fontSize: 14),
            ),
            InkWell(
              onTap: () {
                print("clicked");
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Current location",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: primaryColor)
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          // padding: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 222, 216, 216),
                          borderRadius: BorderRadius.circular(30)),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(Icons.search),
                              Text(
                                "Search foods",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black45),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Filter_Icon,
                      height: 18,
                      width: 18,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              titleWidget(context, "Category"),

              // Model in horizontal design
              SizedBox(
                height: 115,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: listCards.length,
                    itemBuilder: ((context, index) {
                      return CategoryCard(categoryModel: listCards[index]);
                    })),
              ),

              titleWidget(context, "Popular"),

              for (int i = 0; i < listModels.length; i++) ...{
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 5,
                          blurRadius: 5,
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 220,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(listModels[i].imageUrl),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          listModels[i].foodName,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              "${listModels[i].rating}",
                              style: const TextStyle(color: primaryColor),
                            ),
                            Text("(${listModels[i].ratingCount} ratings)"),
                            const Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(listModels[i].hotelName),
                            ),
                            Text("\$${listModels[i].amount}"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              }
            ],
          ),
        ),
      ),
    );
  }

  Text titleWidget(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleMedium
          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(17),
          margin: const EdgeInsets.only(top: 5, bottom: 2, right: 5, left: 8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(categoryModel.imageUrl),
        ),
        Text(
          categoryModel.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ],
    );
  }
}

class CategoryModel {
  String imageUrl;
  String title;
  // String remoteUrl;
  // CategoryModel(this.imageUrl, this.title, {this.remoteUrl});
  CategoryModel(this.imageUrl, this.title);
}

List<CategoryModel> listCards = [
  CategoryModel("assets/icons/noodles-icon.png", "Noodles"),
  CategoryModel("assets/icons/kottu-icon.png", "Kottu"),
  CategoryModel("assets/icons/biryani-icon.png", "Biryani"),
  CategoryModel("assets/icons/pizza-icon.png", "Pizza"),
  CategoryModel("assets/icons/nasi-icon.png", "Nasi"),
];

List<String> bannerList = [
  "https://cdn.tasteatlas.com//Images/Dishes/79bfe7e4839440be81bba08b49b9bb9d.jpg?width=800&height=513",
  "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2019-10/biryani.jpg",
  "https://blogscdn.thehut.net/wp-content/uploads/sites/478/2019/07/05125231/HERO-nasi-goreng.jpg",
];

class PopularItemModel {
  late String imageUrl;
  late String foodName;
  late String hotelName;
  late double rating;
  late double amount;
  late int ratingCount;

  PopularItemModel(
    this.imageUrl,
    this.foodName,
    this.hotelName,
    this.rating,
    this.amount,
    this.ratingCount,
  );
}

List<PopularItemModel> listModels = [
  PopularItemModel(
      "https://cdn.tasteatlas.com//Images/Dishes/79bfe7e4839440be81bba08b49b9bb9d.jpg?width=800&height=513",
      "Chicken Kottu",
      "Valampuri",
      4.5,
      3,
      200),
  PopularItemModel(
      "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/2019-10/biryani.jpg",
      "Thalappakatti",
      "JK Wings",
      3.8,
      4,
      400),
  PopularItemModel(
      "https://blogscdn.thehut.net/wp-content/uploads/sites/478/2019/07/05125231/HERO-nasi-goreng.jpg",
      "Nasi goreng",
      "Village Hotel",
      4,
      3.8,
      350),
];
