import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shipper_app/models/m_check_out.dart';

class ProductController {
  static const String apiUrl = 'https://371e-14-248-162-193.ngrok-free.app/api/';

  Future<List<MCheckOut>> fetchOrder() async {
    final response = await http.get(Uri.parse('${apiUrl}checkouts'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as List<dynamic>;
      final newProducts = body
          .map(
            (dynamic item) => MCheckOut.fromJson(item as Map<String, dynamic>),
          )
          .toList();
      return newProducts;
    } else {
      throw Exception('Failed to load  products');
    }
  }

  Future<MCheckOut> fetchOrderById(int id) async {
    final response = await http.get(Uri.parse('${apiUrl}checkouts/$id'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final newProducts = MCheckOut.fromJson(body as Map<String, dynamic>);
      return newProducts;
    } else {
      throw Exception('Failed to load  order');
    }
  }

  Future<void> changeOrderStatus(int orderId, int status, BuildContext context) async {
    final url = Uri.parse('${apiUrl}checkouts-change-status/$orderId');

    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'status': status.toString(),
    });

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        _showDialog(context, 'Success', 'Order status updated successfully');
        if (kDebugMode) {
          print('Order status updated successfully');
        }
      } else {
        if (kDebugMode) {
          print('Failed to update order status. Status code: ${response.statusCode}');
          print('Response body: ${response.body}');
        }
        throw Exception('Failed to update order status. Status code: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      throw Exception('An error occurred: $e');
    }
  }

  void _showDialog(BuildContext context, String title, String message) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
