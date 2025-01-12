import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  Widget _buildCartItem(int index) {
    final images = [
      "assets/images/black t-shirt.png",
      "assets/images/red t-shirt.png",
      "assets/images/cotton pant 1.png",
      // "assets/images/grey cotton pant 2.png",
    ];
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 5))
          ]),
      child: Row(
        children: [
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(images[index], fit: BoxFit.cover),
              )),
          SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  )),
                  Icon(Icons.delete_outline, color: AppTheme.error)
                ],
              ),
              SizedBox(height: 5),
              Text('Size: M | Color: Blue',
                  style: TextStyle(fontSize: 12, color: AppTheme.TextSecondry)),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$299.99",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppTheme.TextSecondry.withOpacity(0.2))),
                    child: Row(
                      children: [
                        _buildQuantityButton(
                            icon: Icons.remove, onPressed: () {}),
                        SizedBox(
                            width: 40,
                            child: Center(
                                child: Text('1',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)))),
                        _buildQuantityButton(icon: Icons.add, onPressed: () {}),
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20)),
        child: Icon(
          icon,
          size: 16,
          color: AppTheme.primaryColor,
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppTheme.textPrimary : AppTheme.TextSecondry,
            ),
          ),

          //!
          //!
          //!
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? AppTheme.primaryColor : AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: AppTheme.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: FlexibleSpaceBar(
                title: Text(
                  "Shopping Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children:
                        List.generate(3, (index) => _buildCartItem(index)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 26),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ]),
                  child: Row(
                    children: [
                      Icon(Icons.local_offer_outlined,
                          color: AppTheme.primaryColor),
                      SizedBox(width: 12),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Promo Code',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: AppTheme.TextSecondry)),
                      )),
                      TextButton(onPressed: () {}, child: Text("Apply"))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10,
                            offset: Offset(0, 5))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      SizedBox(height: 16),
                      _buildSummaryRow('Subttal', '\$890.98'),
                      _buildSummaryRow('Shipping', '\$10.00'),
                      _buildSummaryRow('Tax', '\$25.99'),
                      Divider(height: 24),
                      _buildSummaryRow('Total', '\$999.99', isTotal: true),
                    ],
                  ),
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, -5),
          )
        ]),
        child: SafeArea(
            child: GradientButton(
                text: 'Proceed to Checkout (\$999.99)', onPressed: () {})),
      ),
    );
  }
}
