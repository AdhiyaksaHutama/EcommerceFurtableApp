import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/sqflite/db_manager.dart';
import 'package:furniture_e_commerce/widgets/checkout/cart/payment_detail.dart';
import 'package:furniture_e_commerce/widgets/checkout/cart/product_detail.dart';
import 'package:furniture_e_commerce/widgets/checkout/order_created_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            color: whiteColor,
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Text(
                              "Product Details",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Consumer<DbManager>(
                            builder: (context, value, child) {
                              return CheckoutProductListWidget(
                                manager: value,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 16,
                            ),
                            child: Text(
                              "Payment Details",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Consumer<DbManager>(
                            builder: (context, value, child) {
                              return CheckoutPaymentDetails(
                                manager: value,
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 16,
                            ),
                            child: Text(
                              "Payment Options",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: constraints.maxWidth,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: backgroundColor2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Cash',
                                        style: GoogleFonts.inter(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: onDeliveryandCompletedColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' On ',
                                        style: GoogleFonts.inter(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: blackColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Delivery',
                                        style: GoogleFonts.inter(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Radio(
                                  activeColor: darkGreyColor,
                                  visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: true,
                                  groupValue: true,
                                  onChanged: (value) {},
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                              top: 16,
                            ),
                            child: Text(
                              "Payment Form",
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  TextFormField(
                                    enabled: false,
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                    initialValue: "Tiara",
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: backgroundColor2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Email',
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    enabled: false,
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11,
                                    ),
                                    initialValue: "TiaraExample@gmail.com",
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: backgroundColor2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Address',
                                    style: GoogleFonts.poppins(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8,
                                        ),
                                        borderSide: const BorderSide(
                                          color: backgroundColor2,
                                        ),
                                      ),
                                    ),
                                    controller: _addressController,
                                    maxLines: 3,
                                    validator: (value) {
                                      if (value == "") {
                                        return 'This field cannot be empty';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Consumer<DbManager>(
                  builder: (context, value, child) {
                    int total = 0;
                    for (int i = 0; i < value.product.length; i++) {
                      int totalPerQty =
                          value.product[i].price! * value.product[i].qty!;
                      total += totalPerQty;
                    }

                    MoneyFormatter totalfmf = MoneyFormatter(
                      amount: total.toDouble() + 20000 + (0.1 * total),
                      settings: MoneyFormatterSettings(
                        symbol: 'Rp',
                        thousandSeparator: '.',
                        decimalSeparator: ',',
                        symbolAndNumberSeparator: '. ',
                        fractionDigits: 0,
                      ),
                    );

                    MoneyFormatterOutput foTotal = totalfmf.output;

                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      color: backgroundColor3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total :',
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                foTotal.symbolOnLeft,
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) =>
                                      const OrderCreatedDialog(),
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                              child: Text(
                                "Order Now",
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
