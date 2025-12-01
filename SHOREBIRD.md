# Build Android
- Nếu project chưa có file key.properties thì tạo file này trong thư mục android và thêm nội dung sau:
    ```properties
  # ví du:
    storePassword=123456
    keyPassword=123456
    keyAlias=xxxx
    storeFile=/Users/xx/Documents/android_keystore_xxx_keystore.jks
    ```
- Trong đó:
    - storePassword: mật khẩu của keystore
    - keyPassword: mật khẩu của key
    - keyAlias: tên key
    - storeFile: đường dẫn đến file keystore

- Build release với shorebird:
    ```bash
    shorebird release android --flutter-version=3.32.0
    ```
- Build apk cho firebase distribution:
    ```bash
    shorebird release android --artifact=apk --flutter-version=3.32.0
    ```
- Trong đó:
    - --flutter-version: version của flutter mà project đang sử dụng
- Tạo bản vá cho android:
    ```bash
    shorebird patch android
    ```

# Build iOS
- Build release với shorebird:
    ```bash
    shorebird release ios --flutter-version=3.32.0
    ``` 
- Build ipa cho firebase distribution:
    ```bash
    shorebird release ios --flutter-version=3.27.2 --export-method ad-hoc
    ```
- Sau khi build xong mở file build/ios/archive/xxx.xcarchive bằng Xcode và thực hiện luồng upload app lên App Store như bình thường
    - Open **Xcode**.
    - Click on **File** > **Open**.
    - Navigate to your project folder.
    - Open `build/ios/archive/xxx.xcarchive`

- Tạo bản vá cho iOS:
    ```bash
    shorebird patch ios
    ```

# Preview

- Preview release:
    ```bash
    shorebird preview
    ```