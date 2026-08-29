import SwiftUI

struct CarouselView<Content: View>: View {
    @ViewBuilder let content: Content
    
    var body: some View {
        // Group(subviewsOf:) extrait chaque vue individuelle passée en paramètre
        Group(subviewsOf: content) { subviews in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(subviews) { subview in
                        subview
                            .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                            .scrollTransition(.interactive, axis: .horizontal) { view, phase in
                                view
                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.9)
                                    .opacity(phase.isIdentity ? 1.0 : 0.7)
                            }
                    }
                }
                .scrollTargetLayout()
            }
            .contentMargins(.horizontal, 32, for: .scrollContent)
            .scrollTargetBehavior(.viewAligned)
        }
    }
}
