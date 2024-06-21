import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipper_app/common/brand_card.dart';
import 'package:shipper_app/common/common.dart';
import 'package:shipper_app/common/skeletons/skeleton_brand_cart.dart';
import 'package:shipper_app/product/bloc/product_bloc.dart';
import 'package:shipper_app/product/screens/order_detail_screen.dart';
import 'package:shipper_app/utils/constants/sizes.dart';

import '../bloc/product_event.dart';
import '../bloc/product_state.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(const ProductsByBrandIdFetched(userId: 1));
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Product'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  /// Search Bar
                  // const SizedBox(
                  //   height: AppSizes.spaceBtwItems,
                  // ),

                  const SizedBox(
                    height: AppSizes.spaceBtwSections,
                  ),
                  CommonGridLayout(
                    mainAxisExtent: 80,
                    itemCount: state.order.length,
                    itemBuilder: (_, index) {
                      if (state.isLoading == false && state.order.isNotEmpty) {
                        final product = state.order[index];
                        return BrandCard(
                          title: product.shippingAddress ?? '',
                          description: product.totalPrice.toString() ?? '',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (context) {
                                  return OrderDetailScreen(
                                    order: product,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      } else {
                        return const SkeletonBrandCard();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
