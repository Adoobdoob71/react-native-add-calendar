package com.margelo.nitro.addcalendar

import com.margelo.nitro.NitroModules
import com.margelo.nitro.core.Promise
import com.facebook.react.BaseReactPackage
import com.facebook.react.bridge.NativeModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.module.model.ReactModuleInfoProvider
import com.facebook.react.ReactPackage
import com.facebook.react.uimanager.ViewManager

class AddCalendarPackage : BaseReactPackage() {
    override fun getModule(name: String, reactContext: ReactApplicationContext): NativeModule? {
        return null
    }

    override fun getReactModuleInfoProvider(): ReactModuleInfoProvider {
        return ReactModuleInfoProvider { HashMap() }
    }

    companion object {
        init {
            System.loadLibrary("addcalendar")
        }
    }
}
