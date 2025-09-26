# FPSOverlay

**FPSOverlay** là một tweak iOS, hiển thị chỉ số FPS, phần trăm pin và thời gian hệ thống trực tiếp trên màn hình.

---

## 🚀 Tính năng

- 📊 Hiển thị FPS theo thời gian thực.
- 🔋 Hiển thị phần trăm pin hiện tại.
- 🕒 Hiển thị đồng hồ hệ thống (định dạng HH:mm:ss).
- 🎨 Màu chữ thay đổi theo mức pin:
  - **Xanh lá**: pin > 60%
  - **Cam**: pin từ 30% đến 60%
  - **Đỏ**: pin < 30%
- 📱 Tự động căn chỉnh vị trí để tránh notch/safe area.
- 🧼 Thiết kế tối giản, nền trong suốt.

---

## 📦 Cài đặt

### Yêu cầu
- Thiết bị iOS đã jailbreak
- Theos
- MobileSubstrate hoặc ElleKit (tùy jailbreak)
- Có thể dùng MacOS hoặc Linuxux nếu thiết bị không thể jailbreak

### Build & Cài đặt
Trong thư mục dự án:

Nếu muốn tạo dylib
```bash
make
```
Nếu muốn tạo deb
```bash
make package
```
