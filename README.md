# PixelLoaders

Animated pixel-grid loading indicators for SwiftUI. Each loader renders a grid of tiny rounded squares whose opacities cycle through pre-computed frame data, creating pulsing and sweeping effects.

## Installation

Add PixelLoaders to your project via Swift Package Manager:

```
https://github.com/pxlshpr/PixelLoaders.git
```

Or in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/pxlshpr/PixelLoaders.git", from: "0.0.1")
]
```

## Quick Start

```swift
import PixelLoaders

// Default "thinking" style (purple)
PixelGridLoader()

// Built-in "debugging" style (blue)
PixelGridLoader(style: .debugging)
```

## Built-in Styles

| Style | Default Color | Pattern |
|---|---|---|
| `.thinking` | Purple | Organic pulse |
| `.debugging` | Blue | Diagonal sweep |

Use the `PixelGridLoaderStyle` enum to iterate over all built-in styles:

```swift
ForEach(PixelGridLoaderStyle.allCases, id: \.self) { style in
    PixelGridLoader(style: style)
}
```

## Parameters

### Full initializer

| Parameter | Type | Default | Description |
|---|---|---|---|
| `frames` | `[[Double]]` | `thinkingFrames` | 2D opacity lookup table |
| `color` | `Color` | `.purple` | Fill color for every pixel |
| `gridSize` | `Int` | `5` | Rows and columns in the grid |
| `pixelSize` | `CGFloat` | `8` | Width/height of each pixel in points |
| `gap` | `CGFloat` | `3` | Spacing between pixels in points |
| `cornerRadius` | `CGFloat` | `2` | Corner radius of each pixel |
| `cycleDuration` | `TimeInterval` | `1.0` | Seconds per animation loop |

### Style initializer

```swift
PixelGridLoader(style: .thinking, pixelSize: 12, gap: 4, cycleDuration: 0.8)
```

## Custom Frame Data

Supply your own `[[Double]]` to create entirely custom animations. Each inner array contains one `Double` (0.0–1.0) per grid cell (`gridSize * gridSize` values). The outer array has one entry per animation frame.

```swift
// Simple 3×3 blink animation (4 frames)
let blink: [[Double]] = [
    [1, 0, 1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0, 1, 0],
]

PixelGridLoader(
    frames: blink,
    color: .green,
    gridSize: 3,
    pixelSize: 10,
    cycleDuration: 0.5
)
```

## Platform Requirements

- iOS 16.0+
- macOS 13.0+

## License

[WTFPL](LICENSE) — Do What The Fuck You Want To Public License.
