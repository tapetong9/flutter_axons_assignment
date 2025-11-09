# 📱 วิธีดาวน์โหลด APK

## 🚀 GitHub Actions จะ Build APK ให้อัตโนมัติ!

ทุกครั้งที่มีการ push โค้ด GitHub Actions จะ build APK ให้อัตโนมัติ

---

## 📥 วิธีดาวน์โหลด APK:

### ขั้นตอนที่ 1: เข้า GitHub Repository
ไปที่: `https://github.com/tapetong9/flutter_axons_assignment`

### ขั้นตอนที่ 2: คลิกที่ Tab "Actions"
![Actions Tab](https://docs.github.com/assets/cb-25535/images/help/repository/actions-tab.png)

### ขั้นตอนที่ 3: เลือก Workflow Run ล่าสุด
- คลิกที่ "Build Flutter APK" workflow ที่มี ✅ (สำเร็จ)
- หรือกด "workflow_dispatch" เพื่อรันใหม่

### ขั้นตอนที่ 4: ดาวน์โหลด APK
- Scroll ลงไปที่ส่วน **Artifacts**
- คลิก **axons-app-dev-release** เพื่อดาวน์โหลด
- จะได้ไฟล์ `.zip` มา → แตกไฟล์ → จะได้ `axons-app-dev-release.apk`

### ขั้นตอนที่ 5: ติดตั้งบนมือถือ Android
1. โอน APK ไปที่มือถือ
2. เปิดไฟล์ APK
3. อนุญาตให้ติดตั้งจาก Unknown Sources (ถ้าถูกถาม)
4. กดติดตั้ง
5. เปิดแอปได้เลย! 🎉

---

## 🔄 รันใหม่ได้ตลอดเวลา

ถ้าต้องการ build APK ใหม่:
1. ไปที่ Tab "Actions"
2. คลิก "Build Flutter APK" workflow
3. กด "Run workflow" (ปุ่มสีฟ้า)
4. เลือก branch ที่ต้องการ
5. กด "Run workflow"

GitHub จะ build ให้ภายใน 5-10 นาที!

---

## 📝 หมายเหตุ:

- APK นี้เป็น **Development mode** (ใช้ `main_dev.dart`)
- ถ้าต้องการ Production mode แก้ไขใน workflow file ที่ `-t lib/main_dev.dart` → `-t lib/main_prod.dart`
- Artifacts จะถูกเก็บไว้ 30 วัน

---

## 🆘 ต้องการความช่วยเหลือ?

หากมีปัญหาในการดาวน์โหลดหรือติดตั้ง สามารถ:
1. ตรวจสอบ workflow logs ใน GitHub Actions
2. เช็คว่า build สำเร็จหรือไม่ (มี ✅)
3. ติดต่อทีมพัฒนา

---

**Happy Testing! 🎉**
