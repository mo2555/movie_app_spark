import 'package:flutter/material.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  'assets/images/ronaldo.png',
                  fit: BoxFit.cover,
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
    );
  }
}
