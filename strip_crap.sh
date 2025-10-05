rm -rf hardware/interfaces/neuralnetworks/
find hardware/interfaces -type d -name aidl -exec rm -rf {} +
rm -rf vendor/qcom/opensource/commonsys-intf/display/aidl
rm -rf vendor/qcom/opensource/vibrator/effect
rm -rf system/tools/aidl/tests/


# nuke all aidl and test trees we don’t want
rm -rf system/tools/aidl/tests
rm -rf system/tools/aidl/build/test_*
rm -rf system/tools/xsdc/tests
rm -rf system/tools/hidl/hidl2aidl/test
rm -rf system/libvintf/xsd
find hardware/interfaces/audio -type d -name config -exec rm -rf {} + || true

find system/tools/aidl -type f -name "Android.bp" \
  ! -path "*/build/Android.bp" -delete || true


rm -rf system/tools/aidl/build/test_* \
       system/tools/aidl/tests \
       system/tools/aidl/build/Android.bp


rm -rf frameworks/native/libs/permission
rm -rf frameworks/native/libs/binderthreadstate
rm -rf frameworks/native/libs/binder/tests
rm -rf frameworks/native/libs/binder/rust
rm -rf frameworks/native/libs/binder/ndk/tests


sed -i '/^aidl_interface {/,/^}/d' \
    frameworks/native/libs/binder/Android.bp


rm -rf hardware/interfaces/audio
rm -rf hardware/interfaces/tv
rm -rf vendor/qcom/opensource/commonsys-intf/display


rm -rf system/tools/hidl/test/


rm -rf  hardware/interfaces/graphics/composer
rm -rf  hardware/interfaces/identity
rm -rf  hardware/interfaces/automotive
rm -rf  hardware/interfaces/compatibility_matrices



rm -rf build/make/tools
rm -rf build/soong/linkerconfig
rm -rf build/soong/filesystem
rm -rf build/soong/apex
rm -rf build/soong/sdk

rm -rf system/tools/xsdc
rm -rf build/soong/python/tests

rm -rf frameworks/native/libs/math
rm -rf build/soong/cc/libbuildversion

rm -rf build/soong/bloaty
rm -rf build/soong/rust
rm -rf frameworks/native/cmds/installd


mkdir -p build/grom_build_stubs/prebuilts
echo "int fake_libcpp_static(void) { return 0; }" | clang -xc - -c -o build/grom_build_stubs/prebuilts/fake.o
ar rcs build/grom_build_stubs/prebuilts/libc++_static.a build/grom_build_stubs/prebuilts/fake.o
