import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';

class CustomAssetDropdown extends StatefulWidget {
  final AssetModel? selectedAsset;
  final List<AssetModel> initialItems;
  final Future<List<AssetModel>> Function(String) onSearch;
  final ValueChanged<AssetModel?> onChanged;
  final String? errorText;
  final String hintText;

  const CustomAssetDropdown({
    super.key,
    required this.selectedAsset,
    required this.initialItems,
    required this.onSearch,
    required this.onChanged,
    this.errorText,
    this.hintText = 'Pilih Aset',
  });

  @override
  State<CustomAssetDropdown> createState() => _CustomAssetDropdownState();
}

class _CustomAssetDropdownState extends State<CustomAssetDropdown> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  
  List<AssetModel> _displayedItems = [];
  bool _isLoading = false;
  bool _isOpen = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _displayedItems = widget.initialItems;
  }

  @override
  void didUpdateWidget(CustomAssetDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update displayed items jika initial items berubah
    if (oldWidget.initialItems != widget.initialItems) {
      // ✅ Check mounted before setState (good practice in async or callbacks)
      if (mounted) {
        setState(() {
          _displayedItems = widget.initialItems;
        });
      }
      _overlayEntry?.markNeedsBuild();  
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    _debounce?.cancel();
    _removeOverlay(isDisposing: true); // ✅ Pass flag true
    super.dispose();
  }

  void _toggleDropdown() {
    if (_isOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOpen = true;
      _displayedItems = widget.initialItems;
      _searchController.clear();
    });
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  // ✅ FIX: Tambahkan parameter isDisposing
  void _removeOverlay({bool isDisposing = false}) {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _searchFocusNode.unfocus();
    _debounce?.cancel();
    
    // ✅ HANYA panggil setState jika TIDAK sedang dispose
    if (!isDisposing && mounted) {
      setState(() => _isOpen = false);
    }
  }

  // ... (Sisa kode _createOverlayEntry dan build method sama seperti sebelumnya) ...
  
  // Paste sisa kode di bawah ini untuk kelengkapan
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _removeOverlay(), // Tap outside to close
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0.0, size.height + 5.h),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8.r),
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 400.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: ColorName.primary, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12.w),
                          child: TextField(
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Cari aset...',
                              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
                              prefixIcon: Icon(Icons.search, size: 20.sp, color: Colors.grey.shade600),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(Icons.clear, size: 20.sp),
                                      onPressed: () {
                                        _searchController.clear();
                                        _onSearchChanged('');
                                      },
                                    )
                                  : null,
                              contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: ColorName.primary, width: 1.5),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade50,
                            ),
                            onChanged: _onSearchChanged,
                          ),
                        ),
                        Divider(height: 1.h, color: Colors.grey.shade300),
                        Flexible(
                          child: _isLoading
                              ? Padding(
                                  padding: EdgeInsets.all(20.h),
                                  child: const Center(child: CircularProgressIndicator()),
                                )
                              : _displayedItems.isEmpty
                                  ? Padding(
                                      padding: EdgeInsets.all(20.h),
                                      child: Center(
                                        child: Text(
                                          _searchController.text.isEmpty 
                                              ? 'Tidak ada data tersedia' 
                                              : 'Tidak ada hasil untuk "${_searchController.text}"',
                                          style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(vertical: 8.h),
                                      itemCount: _displayedItems.length,
                                      itemBuilder: (context, index) {
                                        final item = _displayedItems[index];
                                        final isSelected = widget.selectedAsset?.id == item.id;
                                        
                                        return InkWell(
                                          onTap: () {
                                            widget.onChanged(item);
                                            _removeOverlay();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                                            color: isSelected ? ColorName.primary.withOpacity(0.1) : null,
                                            child: Text(
                                              item.namaAsset,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: isSelected ? ColorName.primary : ColorName.textPrimary,
                                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                                height: 1.4,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    
    if (query.trim().isEmpty) {
      if (mounted) {
        setState(() {
          _displayedItems = widget.initialItems;
          _isLoading = false;
        });
        _overlayEntry?.markNeedsBuild();
      }
      return;
    }
    
    if (mounted) {
      setState(() => _isLoading = true);
      _overlayEntry?.markNeedsBuild();
    }
    
    _debounce = Timer(const Duration(milliseconds: 800), () async {
      try {
        final results = await widget.onSearch(query.trim());
        if (mounted) {
          setState(() {
            _displayedItems = results;
            _isLoading = false;
          });
          _overlayEntry?.markNeedsBuild();
        }
      } catch (e) {
        if (mounted) {
          setState(() {
            _displayedItems = [];
            _isLoading = false;
          });
          _overlayEntry?.markNeedsBuild();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: InkWell(
            onTap: _toggleDropdown,
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: widget.errorText != null 
                      ? Colors.red 
                      : _isOpen 
                          ? ColorName.primary 
                          : Colors.grey.shade400,
                  width: _isOpen ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.selectedAsset?.namaAsset ?? widget.hintText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: widget.selectedAsset != null 
                            ? ColorName.textPrimary 
                            : Colors.grey.shade500,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    _isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                    color: _isOpen ? ColorName.primary : Colors.grey.shade600,
                    size: 24.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
        
        if (widget.errorText != null) ...[
          SizedBox(height: 6.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Text(
              widget.errorText!,
              style: TextStyle(fontSize: 12.sp, color: Colors.red),
            ),
          ),
        ],
      ],
    );
  }
}