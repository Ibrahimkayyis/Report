import 'dart:async';
import 'dart:typed_data';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late final MobileScannerController _controller;
  StreamSubscription<Object?>? _subscription;
  bool _isProcessing = false;

  late final AnimationController _scanLineController;
  late final Animation<double> _scanLineAnimation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller = MobileScannerController(
      autoStart: true,
      torchEnabled: false,
      facing: CameraFacing.back,
      returnImage: true,
    );

    // Animasi garis scan dengan durasi lebih lambat untuk smooth
    _scanLineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    )..repeat(reverse: true);

    // Menggunakan Curves.easeInOutCubic untuk animasi lebih smooth
    _scanLineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scanLineController,
        curve: Curves.easeInOutCubic,
      ),
    );

    _subscription = _controller.barcodes.listen(_handleBarcode);
  }

  Future<void> _handleBarcode(BarcodeCapture capture) async {
    if (_isProcessing) return;
    if (capture.barcodes.isEmpty) return;

    final barcode = capture.barcodes.first;
    final value = barcode.rawValue;
    if (value == null || value.isEmpty) return;

    setState(() => _isProcessing = true);

    // hentikan kamera
    await _controller.stop();
    _scanLineController.stop();

    // ambil frame terakhir dari kamera
    final image = capture.image;
    Uint8List? capturedBytes;
    if (image != null) {
      capturedBytes = image;
    }

    // tampilkan animasi loading
    _showLoadingDialog();

    await Future.delayed(const Duration(seconds: 1, milliseconds: 300));
    if (!mounted) return;

    Navigator.of(context, rootNavigator: true).pop();

    // navigasi ke detail screen, kirim qrImageBytes
    await context.pushRoute(
      QRAssetDetailRoute(
        qrValue: value,
        qrImageBytes: capturedBytes,
      ),
    );

    if (!mounted) return;

    await _controller.start();
    _scanLineController
      ..reset()
      ..repeat(reverse: true);

    setState(() => _isProcessing = false);
  }

  void _showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (_) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
            SizedBox(height: 16.h),
            Text(
              context.t.app.qr.processing,
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImageAndScan() async {
    if (_isProcessing) return;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );

      if (image == null) return;

      setState(() => _isProcessing = true);

      // Hentikan kamera sementara
      await _controller.stop();
      _scanLineController.stop();

      _showLoadingDialog();

      // Baca file gambar
      final Uint8List imageBytes = await image.readAsBytes();

      // Scan QR code dari gambar menggunakan mobile_scanner
      final BarcodeCapture? result = await _controller.analyzeImage(image.path);

      if (!mounted) return;
      Navigator.of(context, rootNavigator: true).pop();

      if (result == null || result.barcodes.isEmpty) {
        // Tidak ada QR code ditemukan
        _showErrorDialog('Tidak ada QR code yang ditemukan dalam gambar');
        
        // Restart kamera
        await _controller.start();
        _scanLineController
          ..reset()
          ..repeat(reverse: true);
        setState(() => _isProcessing = false);
        return;
      }

      final barcode = result.barcodes.first;
      final value = barcode.rawValue;

      if (value == null || value.isEmpty) {
        _showErrorDialog('QR code tidak valid');
        
        await _controller.start();
        _scanLineController
          ..reset()
          ..repeat(reverse: true);
        setState(() => _isProcessing = false);
        return;
      }

      // Navigasi ke detail screen dengan hasil scan
      await context.pushRoute(
        QRAssetDetailRoute(
          qrValue: value,
          qrImageBytes: imageBytes,
        ),
      );

      if (!mounted) return;

      // Restart kamera
      await _controller.start();
      _scanLineController
        ..reset()
        ..repeat(reverse: true);

      setState(() => _isProcessing = false);
    } catch (e) {
      if (!mounted) return;
      
      Navigator.of(context, rootNavigator: true).pop();
      _showErrorDialog('Gagal memproses gambar: ${e.toString()}');

      await _controller.start();
      _scanLineController
        ..reset()
        ..repeat(reverse: true);
      setState(() => _isProcessing = false);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    // hentikan dan dispose animasi sepenuhnya
    if (_scanLineController.isAnimating) {
      _scanLineController.stop();
    }
    _scanLineController.dispose();

    unawaited(_subscription?.cancel());
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.qr;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// kamera
          Positioned.fill(
            child: MobileScanner(
              controller: _controller,
              onDetect: _handleBarcode,
            ),
          ),

          /// overlay statis
          Positioned.fill(
            child: CustomPaint(
              painter: QRScannerOverlayPainter(
                scanLineValue: 0,
                showScanLine: false,
              ),
            ),
          ),

          /// animasi garis scan (layer terpisah)
          AnimatedBuilder(
            animation: _scanLineAnimation,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: ScanLinePainter(_scanLineAnimation.value),
              );
            },
          ),

          /// judul dan instruksi
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    t.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      t.instruction,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// tombol bawah (flash + gallery)
          Positioned(
            bottom: 80.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBottomButton(
                  icon: ValueListenableBuilder(
                    valueListenable: _controller,
                    builder: (context, state, child) {
                      return Icon(
                        state.torchState == TorchState.on
                            ? Icons.flash_on
                            : Icons.flash_off,
                        color: Colors.white,
                        size: 28.sp,
                      );
                    },
                  ),
                  onPressed: () => _controller.toggleTorch(),
                ),
                SizedBox(width: 60.w),
                _buildBottomButton(
                  icon: Icon(Icons.image, color: Colors.white, size: 28.sp),
                  onPressed: _pickImageAndScan,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton({
    required Widget icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        iconSize: 28.sp,
        padding: EdgeInsets.all(12.w),
      ),
    );
  }
}

/// Painter untuk overlay statis (kotak scanner + corners)
class QRScannerOverlayPainter extends CustomPainter {
  final double scanLineValue;
  final bool showScanLine;

  QRScannerOverlayPainter({this.scanLineValue = 0, this.showScanLine = true});

  @override
  void paint(Canvas canvas, Size size) {
    final scanAreaSize = size.width * 0.55;
    final left = (size.width - scanAreaSize) / 2;
    final top = (size.height - scanAreaSize) / 2;
    final right = left + scanAreaSize;
    final bottom = top + scanAreaSize;

    // overlay gelap
    final overlayPaint = Paint()..color = Colors.black.withValues(alpha: 0.55);
    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
        ..addRect(Rect.fromLTRB(left, top, right, bottom))
        ..fillType = PathFillType.evenOdd,
      overlayPaint,
    );

    // sudut L corner
    final cornerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    const cornerLength = 35.0;
    const cornerRadius = 8.0;

    // Top-left corner
    final topLeftPath = Path()
      ..moveTo(left, top + cornerLength)
      ..lineTo(left, top + cornerRadius)
      ..quadraticBezierTo(left, top, left + cornerRadius, top)
      ..lineTo(left + cornerLength, top);
    canvas.drawPath(topLeftPath, cornerPaint);

    // Top-right corner
    final topRightPath = Path()
      ..moveTo(right - cornerLength, top)
      ..lineTo(right - cornerRadius, top)
      ..quadraticBezierTo(right, top, right, top + cornerRadius)
      ..lineTo(right, top + cornerLength);
    canvas.drawPath(topRightPath, cornerPaint);

    // Bottom-left corner
    final bottomLeftPath = Path()
      ..moveTo(left, bottom - cornerLength)
      ..lineTo(left, bottom - cornerRadius)
      ..quadraticBezierTo(left, bottom, left + cornerRadius, bottom)
      ..lineTo(left + cornerLength, bottom);
    canvas.drawPath(bottomLeftPath, cornerPaint);

    // Bottom-right corner
    final bottomRightPath = Path()
      ..moveTo(right - cornerLength, bottom)
      ..lineTo(right - cornerRadius, bottom)
      ..quadraticBezierTo(right, bottom, right, bottom - cornerRadius)
      ..lineTo(right, bottom - cornerLength);
    canvas.drawPath(bottomRightPath, cornerPaint);
  }

  @override
  bool shouldRepaint(covariant QRScannerOverlayPainter oldDelegate) => false;
}

/// Painter khusus untuk garis scan yang bergerak
class ScanLinePainter extends CustomPainter {
  final double progress; // 0.0 to 1.0

  ScanLinePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final scanAreaSize = size.width * 0.55;
    final left = (size.width - scanAreaSize) / 2;
    final top = (size.height - scanAreaSize) / 2;
    final right = left + scanAreaSize;
    final bottom = top + scanAreaSize;

    // Tinggi gradient effect
    final gradientHeight = 8.0;
    
    // Hitung posisi Y berdasarkan progress dengan padding agar tidak keluar
    // Tambahkan padding setengah dari gradientHeight di atas dan bawah
    final padding = gradientHeight / 2;
    final effectiveTop = top + padding;
    final effectiveBottom = bottom - padding;
    final scanY = effectiveTop + (effectiveBottom - effectiveTop) * progress;

    // Gradient untuk efek glow yang lebih halus
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ColorName.primary.withValues(alpha: 0.0),
        ColorName.primary.withValues(alpha: 0.3),
        ColorName.primary,
        ColorName.primary.withValues(alpha: 0.3),
        ColorName.primary.withValues(alpha: 0.0),
      ],
      stops: const [0.0, 0.3, 0.5, 0.7, 1.0],
    );

    // Area untuk gradient
    final rect = Rect.fromLTWH(
      left + 8,
      scanY - gradientHeight / 2,
      scanAreaSize - 16,
      gradientHeight,
    );

    final gradientPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, gradientPaint);

    // Garis utama yang lebih tebal dan solid di tengah
    final mainLinePaint = Paint()
      ..color = ColorName.primary
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      Offset(left + 8, scanY),
      Offset(right - 8, scanY),
      mainLinePaint,
    );

    // Shadow/glow effect tambahan untuk depth
    final shadowPaint = Paint()
      ..color = ColorName.primary.withValues(alpha: 0.4)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);

    canvas.drawLine(
      Offset(left + 8, scanY),
      Offset(right - 8, scanY),
      shadowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ScanLinePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}