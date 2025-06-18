import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() => runApp(const MyApp());

/// The root widget of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      debugShowCheckedModeBanner: false,
      home: const ProductLoadingPage(),
    );
  }
}

/// Page that demonstrates the Shimmer widget in a product details loading scenario.
class ProductLoadingPage extends StatefulWidget {
  const ProductLoadingPage({super.key});

  @override
  State<ProductLoadingPage> createState() => _ProductLoadingPageState();
}

class _ProductLoadingPageState extends State<ProductLoadingPage> {
  // Property 1: Controls whether the shimmer animation is enabled
  final bool _enabled = true;
  
  // Property 2: Base color of the shimmer effect
  final Color _baseColor = Colors.grey[300]!;
  
  // Property 3: Animation speed (period duration)
  final Duration _period = const Duration(milliseconds: 1600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation tabs
          Container(
            color: Colors.white,
            child: Row(
              children: [
                _buildTab('Overview', true),
                _buildTab('Feedback', false),
                _buildTab('Description', false),
                _buildTab('Reviews', false),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Product shimmer content
                  Shimmer.fromColors(
                    baseColor: _baseColor, // Property 2: Base shimmer color
                    highlightColor: _baseColor.withAlpha((0.6 * 255).toInt()), // Fixed: no deprecated withOpacity
                    enabled: _enabled, // Property 1: Animation control
                    period: _period, // Property 3: Animation speed
                    child: _buildProductShimmer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? Colors.orange : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? Colors.orange : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildProductShimmer() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image placeholder
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Heart icon placeholder
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Brand name
          Container(
            width: 80,
            height: 16,
            color: Colors.white,
          ),
          
          const SizedBox(height: 8),
          
          // Price range
          Container(
            width: 150,
            height: 24,
            color: Colors.white,
          ),
          
          const SizedBox(height: 16),
          
          // Product title (multiple lines)
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 16,
            color: Colors.white,
          ),
          const SizedBox(height: 8),
          Container(
            width: 200,
            height: 16,
            color: Colors.white,
          ),
          
          const SizedBox(height: 16),
          
          // Rating and orders
          Row(
            children: [
              Container(
                width: 80,
                height: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Container(
                width: 100,
                height: 16,
                color: Colors.white,
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Store voucher section
          Container(
            width: 120,
            height: 20,
            color: Colors.white,
          ),
          
          const SizedBox(height: 16),
          
          // Voucher cards
          Row(
            children: [
              _buildVoucherCard(),
              const SizedBox(width: 8),
              _buildVoucherCard(),
              const SizedBox(width: 8),
              _buildVoucherCard(),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  height: 48,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 3,
                child: Container(
                  height: 48,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoucherCard() {
    return Container(
      width: 80,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}