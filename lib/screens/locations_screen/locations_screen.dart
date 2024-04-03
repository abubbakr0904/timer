import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer/screens/locations_screen/widget/monitoring_item.dart';

import '../../cubids/transfer_cubid/transfer_cubid.dart';
import '../../cubids/transfer_cubid/transfer_state.dart';
import '../../utils/style/style.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Monitoring',
            style: AppStyle.interBold.copyWith(fontSize: 22.sp)),
      ),
      body:
      BlocBuilder<TransferCubit, TransferState>(builder: (context, state) {
        if (state is TransferLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TransferFailureState) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is TransferSuccessState) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.transfers.length,
            itemBuilder: (context, index) {
              var transfers = state.transfers[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(transfers.transferDate,
                          style:
                          AppStyle.interBold.copyWith(fontSize: 18.sp)),
                      SizedBox(width: 20.w)
                    ],
                  ),
                  const Divider(),
                  SizedBox(height: 10.h),
                  MonitoringItem(transfers: transfers),
                ],
              );
            },
          );
        }
        return const SizedBox();
      }),
    );
  }
}