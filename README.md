# FPSOverlay

**FPSOverlay** là một tweak nhẹ dành cho iOS, hiển thị chỉ số FPS (khung hình/giây), phần trăm pin và thời gian hệ thống trực tiếp trên màn hình. Công cụ này hữu ích cho lập trình viên, game thủ hoặc người dùng muốn theo dõi hiệu năng thiết bị theo thời gian thực.

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
- Thiết bị iOS đã jailbreak.
- Theos build environment.
- MobileSubstrate hoặc ElleKit (tùy jailbreak).

### Build & Cài đặt
Trong thư mục dự án:

```bash
tạo deb cho jailbreak: make package
tạo dylib cho non-jailbreak: make
