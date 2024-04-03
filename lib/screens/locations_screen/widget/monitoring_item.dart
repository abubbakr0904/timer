import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/model/transfer_model.dart';
import '../../../utils/style/style.dart';

class MonitoringItem extends StatelessWidget {
  const MonitoringItem({super.key, required this.transfers});

  final TransferModel transfers;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transfers.transfersData.length,
      itemBuilder: (context, index) {
        var transfer = transfers.transfersData[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: ListTile(
            leading: CachedNetworkImage(
              imageUrl: transfer.sender.brandImage,
              height: 50.h,
              width: 50.w,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: 50.sp,
                color: Colors.red,
              ),
            ),
            title: Text(transfer.sender.name,
                style: AppStyle.interMedium.copyWith(fontSize: 14.sp)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.w),
                Text(
                  "${transfer.date.day}.${transfer.date.month}.${transfer.date.year} - ${transfer.date.hour}:${transfer.date.minute}",
                  style: AppStyle.interMedium.copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 5.w),
                Text(
                  " - ${transfer.amount} so'm",
                  style: AppStyle.interMedium.copyWith(fontSize: 12.sp,color: Colors.blue),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}