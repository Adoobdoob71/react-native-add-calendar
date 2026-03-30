import Foundation
import NitroModules
import EventKit
import EventKitUI
import UIKit

class CalendarUICoordinator: NSObject, EKEventEditViewDelegate {
  let promise: Promise<Bool>

  init(promise: Promise<Bool>) {
    self.promise = promise
  }

  func eventEditViewController(
    _ controller: EKEventEditViewController,
    didCompleteWith action: EKEventEditViewAction
  ) {
    controller.dismiss(animated: true) {
      self.promise.resolve(withResult: action == .saved)
    }
  }
}

class AddCalendar: HybridAddCalendarSpec {
  let eventStore = EKEventStore()
  private var coordinator: CalendarUICoordinator?

  public func addEvent(newEvent: NewEvent) -> Promise<Bool> {
    let promise = Promise<Bool>()

    DispatchQueue.main.async {
      Task {
        let granted = await self.requestCalendarAccess()
        guard granted else {
          promise.resolve(withResult: false)
          return
        }

        let event = EKEvent(eventStore: self.eventStore)
        event.title = newEvent.title
        event.location = newEvent.location
        event.startDate = Date(timeIntervalSince1970: newEvent.startDate / 1000)
        event.endDate = Date(timeIntervalSince1970: newEvent.endDate / 1000)
        event.notes = newEvent.description
				if let urlString = newEvent.url {
          event.url = URL(string: urlString)
				}
        event.calendar = self.eventStore.defaultCalendarForNewEvents

        let uiCoordinator = CalendarUICoordinator(promise: promise)
        self.coordinator = uiCoordinator

        let editController = EKEventEditViewController()
        editController.event = event
        editController.eventStore = self.eventStore
        editController.editViewDelegate = uiCoordinator

        let windowScene = UIApplication.shared.connectedScenes
          .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene

        if let rootVC = windowScene?.windows.first(where: { $0.isKeyWindow })?.rootViewController {
          var topVC = rootVC
          while let presented = topVC.presentedViewController {
            topVC = presented
          }
          topVC.present(editController, animated: true)
        } else {
          promise.resolve(withResult: false)
        }
      }
    }

    return promise
  }

  private func requestCalendarAccess() async -> Bool {
    if #available(iOS 17.0, *) {
      return await withCheckedContinuation { continuation in
        self.eventStore.requestWriteOnlyAccessToEvents { granted, _ in
          continuation.resume(returning: granted)
        }
      }
    } else {
      return await withCheckedContinuation { continuation in
        self.eventStore.requestAccess(to: .event) { granted, _ in
          continuation.resume(returning: granted)
        }
      }
    }
  }
}
