//  Created by Maciej Gorecki on 03/09/2023.

import SwiftUI

struct NotificationBar: View {
  @EnvironmentObject var notifications: NotificationManager

  let message: String

  var body: some View {
    Text(message)
      .foregroundStyle(.white)
      .bold()
      .font(.callout)
      .frame(maxWidth: .infinity)
      .padding()
      .background(
        LinearGradient(
          colors: [
            Color(hex: "#B24592"),
            Color(hex: "#F15F79")
          ],
          startPoint: .leading,
          endPoint: .trailing
        )
      )
      .clipShape(
        RoundedRectangle(
          cornerRadius: 16,
          style: .continuous
        )
      )
      .padding()
      .transition(
        .move(edge: .top)
        .combined(with: .opacity)
      )
  }
}

#Preview {
  NotificationBar(
    message: "some message"
  )
  .environmentObject(NotificationManager())
}
