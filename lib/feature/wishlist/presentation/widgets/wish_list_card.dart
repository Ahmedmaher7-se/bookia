import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/wishlist/data/models/wish_list_response/datum.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WishListCard extends StatelessWidget {
  const WishListCard({super.key, required this.book, required this.onDelete});

  final WishlistProduct book;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColors.redcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.delete, color: AppColors.whiteColor),
      ),
      onDismissed: (direction) {
        onDelete();
      },
      child: Container(
        height: 140,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(5),
        ),

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: book.image ?? '',
                height: 120,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),

            Gap(15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name ?? '',
                    style: TextStyles.styleSize18(),
                    maxLines: 1,
                  ),
                  Gap(10),
                  Text('\$${book.price}', style: TextStyles.styleSize16()),
                  Gap(10),
                  Text(
                    book.description ?? '',
                    style: TextStyles.styleSize14(color: AppColors.greyColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
