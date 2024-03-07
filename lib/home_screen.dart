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
              Text(
                "Category",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),

              // horizontal design
              SizedBox(
                height: 115,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: listCards.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(17),
                            margin: const EdgeInsets.only(
                                top: 5, bottom: 2, right: 5, left: 8),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(listCards[index].imageUrl),
                          ),
                          Text(
                            listCards[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.bold, color: Colors.black87),
                          ),
                        ],
                      );
                    })),
              )
            ],
          ),
        ),
      ),
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
  CategoryModel("assets/icons/nasi-icon.png","Nasi"),

];

