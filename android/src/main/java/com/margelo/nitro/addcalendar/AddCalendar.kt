package com.margelo.nitro.addcalendar

import android.content.Intent
import android.provider.CalendarContract
import com.facebook.proguard.annotations.DoNotStrip
import com.margelo.nitro.NitroModules
import com.margelo.nitro.core.Promise

@DoNotStrip
class AddCalendar : HybridAddCalendarSpec() {
    override fun addEvent(newEvent: NewEvent): Promise<Boolean> {
        val promise = Promise<Boolean>()

        val activity = NitroModules.applicationContext?.currentActivity

        if (activity == null) {
            promise.resolve(false)
            return promise
        }

        try {
            val intent = Intent(Intent.ACTION_INSERT).apply {
                data = CalendarContract.Events.CONTENT_URI
                putExtra(CalendarContract.Events.TITLE, newEvent.title)
								val fullDescription = if (newEvent.url != null) {
										"${newEvent.description}\n${newEvent.url}"
								} else {
										newEvent.description
								}			
                putExtra(CalendarContract.Events.DESCRIPTION, fullDescription)
                putExtra(CalendarContract.Events.EVENT_LOCATION, newEvent.location)
                putExtra(CalendarContract.EXTRA_EVENT_BEGIN_TIME, newEvent.startDate.toLong())
                putExtra(CalendarContract.EXTRA_EVENT_END_TIME, newEvent.endDate.toLong())
								newEvent.url?.let {
										putExtra(CalendarContract.EXTRA_CUSTOM_APP_URI, it)
								}
            }

            activity.startActivity(intent)

            promise.resolve(true)
        } catch (e: Exception) {
            promise.resolve(false)
        }

        return promise
    }
}
