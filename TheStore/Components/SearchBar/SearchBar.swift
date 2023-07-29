//  Created by Maciej Gorecki on 29/07/2023.

import SwiftUI

struct SearchBar: View {
  @State var text = ""
  
  var body: some View {
    TextField("haha", text: $text)
  }
}

#Preview {
  SearchBar()
}
