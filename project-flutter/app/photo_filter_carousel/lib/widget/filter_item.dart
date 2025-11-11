import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipOval(
            child: DecoratedBox(
              decoration: BoxDecoration(
                // Use the filter color as background
                color: color.withOpacity(0.95),
                // subtle white-ish border like the codelab
                border: Border.all(color: Colors.white.withOpacity(0.12), width: 2),
                // drop shadow to lift thumbnails from background
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.45),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Try to load the texture and overlay it when available.
                    // While loading or on error we keep the solid color visible.
                    Image.network(
                      'https://docs.flutter.dev/cookbook/img-files'
                      '/effects/instagram-buttons/millennial-texture.jpg',
                      fit: BoxFit.cover,
                      color: color.withOpacity(0.5),
                      colorBlendMode: BlendMode.hardLight,
                      filterQuality: FilterQuality.low,
                      loadingBuilder: (context, child, loadingProgress) {
                        // When still loading, render nothing on top so the
                        // solid color remains visible. Once loaded, show the
                        // texture by returning the child.
                        if (loadingProgress == null) return child;
                        return const SizedBox.shrink();
                      },
                      errorBuilder: (context, error, stackTrace) {
                        // Don't show an error icon — keep the solid color.
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
