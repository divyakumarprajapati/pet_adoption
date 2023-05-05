import 'package:flutter/material.dart';
import 'package:pet_adoption/components/pet_component.dart';
import 'package:pet_adoption/models/pet.dart';
import 'package:pet_adoption/widgets/zoomable_image_viewer.dart';

class DetailsPage extends StatefulWidget {
  static const ROUTE_NAME = 'details_page';
  final PetComponent petComponent;
  const DetailsPage({
    Key? key,
    required this.petComponent,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  double? _height = 200.0;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _height = 400;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.petComponent.getPet();
    final String tag = 'pet_image_${widget.petComponent.id}';
    return StreamBuilder<Pet>(
      stream: widget.petComponent.pet,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Hero(
                        tag: tag,
                        createRectTween: (Rect? begin, Rect? end) {
                          return MaterialRectCenterArcTween(
                              begin: begin, end: end);
                        },
                        child: Stack(
                          children: [
                            AnimatedSize(
                              vsync: this,
                              duration: Duration(milliseconds: 600),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: double.maxFinite,
                                  height: _height,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ZoomableImageViewer(
                                            imageProvider: AssetImage(
                                                snapshot.data?.image ?? ''),
                                          ),
                                          fullscreenDialog: true,
                                        ),
                                      );
                                    },
                                    child: Image.asset(
                                      snapshot.data?.image ?? '',
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        snapshot.data?.name ?? '',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Age',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.indigoAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${snapshot.data?.age ?? ''} years',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.indigoAccent,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Rs. ${snapshot.data?.price ?? ''}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Adopting a pet is not just about giving a loving home to a furry friend, it's about changing a life forever. By adopting, you're giving a second chance to an animal in need and providing them with the love, care, and attention they deserve. It's a chance to make a difference in the world, one animal at a time. \n\nPets bring joy, companionship, and unconditional love into our lives. Whether you're a dog person or a cat person, there's a furry companion out there waiting for you. Adopting a pet can also have numerous health benefits, from reducing stress and anxiety to increasing physical activity and lowering blood pressure.",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: snapshot.data!.adopted
                        ? null
                        : () {
                            widget.petComponent.adoptPet();
                          },
                    child: Text(
                      'Adoption',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        snapshot.data!.adopted
                            ? Colors.grey
                            : Color(0xFF00C307),
                      ),
                      fixedSize: MaterialStateProperty.all(
                        Size(300, 50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
