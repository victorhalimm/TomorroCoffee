import 'package:flutter/material.dart';
import 'package:flutter_qualif_vc/models/comment.dart';
import 'package:flutter_qualif_vc/models/product.dart';
import 'package:flutter_qualif_vc/widgets/comment_card.dart';

class DetailsPage extends StatefulWidget {
  final Product product;
  final String? username;
  final void Function() backToMenu;
  final void Function(Product) updateItem;
  const DetailsPage(
      {super.key, required this.product, required this.backToMenu, this.username, required this.updateItem});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  TextEditingController commentController = TextEditingController();

  void handleAddComment(Comment comment) {
    setState(() {
      if (comment.commentBody.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill the comment field!'),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.deepOrange,
          ),
        );
      }
      else {
        widget.product.comments.add(comment);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.7,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage(widget.product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.product.title,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Column(
                            children: [
                              Text(
                                // ignore: prefer_interpolation_to_compose_strings
                                "\$" + widget.product.price.toString() + '0',
                                style: const TextStyle(
                                    fontSize: 20, 
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children:  [
                                  Icon(
                                    Icons.location_on,
                                    color: Theme.of(context).iconTheme.color?.withOpacity(0.3),
                                  ),
                                  Text(
                                    "20 min",
                                    style: TextStyle(
                                      color: Theme.of(context).iconTheme.color?.withOpacity(0.3),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ]),
                  ),
                  TabBar(
                    labelColor: Theme.of(context).iconTheme.color,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    indicator: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.deepOrange,
                      width: 2.0,
                    ))),
                    tabs: const [
                      Tab(
                        text: 'Details',
                      ),
                      Tab(
                        text: 'Reviews',
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    child: TabBarView(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Text(
                            widget.product.detailDescription,
                            style: TextStyle(
                              color: Theme.of(context).iconTheme.color?.withOpacity(0.7),
                              letterSpacing: .4,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: ListView.builder(
                                itemCount: widget.product.comments.length,
                                itemBuilder: (context, index) {
                                  return CommentCard(comment: widget.product.comments[index],);
                                }
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary
                                ),
                                padding: const EdgeInsets.all(7),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child:  Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        child: TextField(
                                          controller: commentController,
                                          decoration: InputDecoration(
                                            hintText: "Write a comment here!",
                                            hintStyle: TextStyle(color: Theme.of(context).hintColor),
                                            filled: true,
                                            fillColor: Theme.of(context).colorScheme.secondary,
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        handleAddComment(Comment(widget.username!, commentController.text, ''));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        padding: const EdgeInsets.all(5),
                                        backgroundColor: Colors.deepOrange,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_right, 
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                    )
                                  ]
                                ),
                              )
                            ),
                          ]
                        ),
                        
                      
                          
                        
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 20,
                left: 15,
                child: FloatingActionButton(
                  onPressed: (() {
                    widget.updateItem(widget.product);
                    widget.backToMenu();
                  }),
                  backgroundColor: Colors.white.withOpacity(0.3),
                  elevation: 0,
                  mini: true,
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
