#include <jni.h>
#include "addcalendarOnLoad.hpp"

JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void*) {
  return margelo::nitro::addcalendar::initialize(vm);
}
