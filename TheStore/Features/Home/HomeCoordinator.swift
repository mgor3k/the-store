import SwiftUI

struct HomeCoordinator: View {
  @Namespace var namespace

  @State var selectedProduct: Product?

  var body: some View {
    ZStack {
      HomeView(
        namespace: namespace,
        selectedProduct: $selectedProduct
      )

      if let selectedProduct {
        DetailsView(
          namespace: namespace,
          product: selectedProduct,
          onBackTapped: {
            self.selectedProduct = nil
          }
        )
      }
    }
    .animation(
      .snappy.speed(1.35),
      value: selectedProduct
    )
  }
}

#Preview {
  HomeCoordinator()
}
