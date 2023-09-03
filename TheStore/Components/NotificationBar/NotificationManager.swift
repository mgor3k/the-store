//  Created by Maciej Gorecki on 03/09/2023.

import Foundation

final class NotificationManager: ObservableObject {
  private var queuedMessages: [String] = []

  @Published var currentMessage: String?

  func showMessage(_ message: String) {
    guard currentMessage == nil else {
      queuedMessages.append(message)
      return
    }

    currentMessage = message

    scheduleHide()
  }

  func hideMessage() {
    currentMessage = nil

    if !queuedMessages.isEmpty {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
        currentMessage = queuedMessages.removeFirst()

        scheduleHide()
      }
    }
  }

  private func scheduleHide() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
      hideMessage()
    }
  }
}
