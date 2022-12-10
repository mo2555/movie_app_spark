import 'package:flutter/material.dart';

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        child: ListView.separated(
          itemBuilder: (ctx, index) => Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  width: 140,
                  height: 100,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/ronaldo.png',
                      ),
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 35,
                    width: 30,
                    color: Colors.yellow.withOpacity(0.7),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          'is simply dummy text ',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          "letters, as opposed to using 'Content here, content here', making it look l",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          "letters, as opposed to using 'Content here, content here', making it look l",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          separatorBuilder: (ctx, index) => const Divider(
            color: Colors.grey,
            height: 25,
            thickness: 0.7,
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
