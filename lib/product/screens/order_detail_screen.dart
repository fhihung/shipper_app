import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shipper_app/models/m_check_out.dart';
import 'package:shipper_app/product/bloc/product_bloc.dart';
import 'package:shipper_app/product/bloc/product_event.dart';
import 'package:shipper_app/product/bloc/product_state.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({required this.order, super.key});
  final MCheckOut order;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order ID: ${order.id}'),
                Text('Shipping Address: ${order.shippingAddress}'),
                Text('Total Price: ${order.totalPrice}'),
                Text('Shipping Fee: ${order.shippingFee.toString() == 'null' ? '0' : order.shippingFee}'),
                const SizedBox(height: 20),
                DropdownButton<int>(
                  value: state.status ?? order.status,
                  items: const [
                    DropdownMenuItem(value: 0, child: Text('Chưa nhận')),
                    DropdownMenuItem(value: 1, child: Text('Đang ship')),
                    DropdownMenuItem(value: 2, child: Text('Đã ship')),
                    DropdownMenuItem(value: 3, child: Text('Đã xác nhận')),
                  ],
                  onChanged: (int? newStatus) {
                    if (newStatus != null) {
                      // Dispatch event to update order status
                      context.read<ProductBloc>().add(
                            OrderStatusChanged(
                              orderId: order.id!,
                              status: newStatus,
                              context: context,
                            ),
                          );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
