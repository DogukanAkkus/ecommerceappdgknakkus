import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesabım"),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Ahmet Yılmaz",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "ahmet.yilmaz@example.com",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.card_giftcard, color: Colors.orange),
                          ),
                          const SizedBox(height: 8),
                          const Text("Siparişlerim", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.favorite_border, color: Colors.orange),
                          ),
                          const SizedBox(height: 8),
                          const Text("Favorilerim", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.location_on_outlined, color: Colors.orange),
                          ),
                          const SizedBox(height: 8),
                          const Text("Adreslerim", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.orange[50],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.credit_card, color: Colors.orange),
                          ),
                          const SizedBox(height: 8),
                          const Text("Ödeme Yöntemleri", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  _buildListTile(
                    icon: Icons.shopping_bag_outlined,
                    title: "Siparişlerim",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.receipt_long_outlined,
                    title: "Faturalarım",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.credit_card_outlined,
                    title: "Kredi Kartlarım",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.location_on_outlined,
                    title: "Adres Bilgilerim",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.favorite_outline,
                    title: "Favorilerim",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.chat_outlined,
                    title: "Müşteri Hizmetleri",
                    onTap: () {},
                  ),
                  _buildListTile(
                    icon: Icons.settings_outlined,
                    title: "Ayarlar",
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _buildListTile(
                icon: Icons.exit_to_app_outlined,
                title: "Çıkış Yap",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required String title, required Function() onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[600]),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}