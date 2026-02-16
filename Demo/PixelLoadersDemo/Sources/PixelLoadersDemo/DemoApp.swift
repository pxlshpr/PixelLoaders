import SwiftUI
import PixelLoaders

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            DemoView()
        }
    }
}

struct DemoView: View {

    @State private var pixelSize: CGFloat = 8
    @State private var gap: CGFloat = 3
    @State private var speed: Double = 1.0

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {

                // MARK: - Built-in Styles
                section("Built-in Styles") {
                    HStack(spacing: 40) {
                        labeled("Thinking") {
                            PixelGridLoader(style: .thinking)
                        }
                        labeled("Debugging") {
                            PixelGridLoader(style: .debugging)
                        }
                    }
                }

                // MARK: - Custom Colors
                section("Custom Colors") {
                    HStack(spacing: 40) {
                        labeled("Green") {
                            PixelGridLoader(color: .green)
                        }
                        labeled("Orange") {
                            PixelGridLoader(color: .orange)
                        }
                        labeled("Pink") {
                            PixelGridLoader(color: .pink)
                        }
                    }
                }

                // MARK: - Sizes
                section("Sizes") {
                    HStack(spacing: 40) {
                        labeled("Small") {
                            PixelGridLoader(pixelSize: 4, gap: 2)
                        }
                        labeled("Medium") {
                            PixelGridLoader(pixelSize: 8, gap: 3)
                        }
                        labeled("Large") {
                            PixelGridLoader(pixelSize: 14, gap: 5)
                        }
                    }
                }

                // MARK: - Speeds
                section("Speeds") {
                    HStack(spacing: 40) {
                        labeled("0.5s") {
                            PixelGridLoader(cycleDuration: 0.5)
                        }
                        labeled("1.0s") {
                            PixelGridLoader(cycleDuration: 1.0)
                        }
                        labeled("2.0s") {
                            PixelGridLoader(cycleDuration: 2.0)
                        }
                    }
                }

                // MARK: - Interactive
                section("Interactive") {
                    PixelGridLoader(
                        pixelSize: pixelSize,
                        gap: gap,
                        cycleDuration: speed
                    )
                    .padding(.bottom, 8)

                    slider("Pixel Size", value: $pixelSize, range: 2...20)
                    slider("Gap", value: $gap, range: 0...10)
                    slider("Speed", value: $speed, range: 0.2...3.0)
                }
            }
            .padding(24)
        }
        #if os(macOS)
        .frame(minWidth: 400, minHeight: 600)
        #endif
    }

    // MARK: - Helpers

    private func section<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(spacing: 12) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            content()
        }
    }

    private func labeled<Content: View>(
        _ label: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(spacing: 8) {
            content()
            Text(label)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }

    private func slider(
        _ label: String,
        value: Binding<CGFloat>,
        range: ClosedRange<CGFloat>
    ) -> some View {
        HStack {
            Text(label)
                .font(.caption)
                .frame(width: 80, alignment: .leading)
            Slider(value: value, in: range)
            Text(String(format: "%.1f", value.wrappedValue))
                .font(.caption.monospacedDigit())
                .frame(width: 40)
        }
    }

    private func slider(
        _ label: String,
        value: Binding<Double>,
        range: ClosedRange<Double>
    ) -> some View {
        HStack {
            Text(label)
                .font(.caption)
                .frame(width: 80, alignment: .leading)
            Slider(value: value, in: range)
            Text(String(format: "%.1f", value.wrappedValue))
                .font(.caption.monospacedDigit())
                .frame(width: 40)
        }
    }
}
