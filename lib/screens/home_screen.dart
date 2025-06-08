import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/assets_provider.dart';
import '../widgets/asset_list_item.dart';
import '../widgets/error_message.dart';
import '../widgets/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _assetsFuture;

  @override
  void initState() {
    super.initState();
    _assetsFuture = _loadAssets();
  }

  Future<void> _loadAssets() async {
    await Provider.of<AssetsProvider>(context, listen: false).fetchAssets();
  }

  Future<void> _refreshAssets() async {
    setState(() {
      _assetsFuture = _loadAssets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Assets'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshAssets,
          ),
        ],
      ),
      body: FutureBuilder(
        future: _assetsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          }

          return Consumer<AssetsProvider>(
            builder: (ctx, assetsProvider, child) {
              if (assetsProvider.error.isNotEmpty) {
                return ErrorMessage(
                  message: assetsProvider.error,
                  onRetry: _refreshAssets,
                );
              }

              return RefreshIndicator(
                onRefresh: _refreshAssets,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: assetsProvider.assets.length,
                  itemBuilder: (ctx, i) => AssetListItem(
                    asset: assetsProvider.assets[i],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
} 