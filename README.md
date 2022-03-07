# Circular Progress Bar

Comparison between Jetpack Compose &amp; SwiftUI by building a basic circular progress bar with gradience and animation

[**iOS-SwiftUI**](https://github.com/kamaravichow/compare-circular-progress/blob/main/ios/CircularProgressBar/CircularProgressBar/CircularProgressView.swift) | [**Android-ComposeUI**](https://github.com/kamaravichow/compare-circular-progress/blob/dc62ecb60b433d54afabb205ed7547d5e063a78c/android/app/src/main/java/me/aravi/circularprogressbar/MainActivity.kt)


## UI codes 

#### iOS

Circular gradient progressbar with animation in SwiftUI

![iOSMockUp](https://github.com/kamaravichow/compare-circular-progress/raw/main/docs/iphone_mock.png)

```swift
struct CircularProgressView: View {
    
    var progress = 10.0
    
    var body: some View {
      
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(
                            colors: [.blue, .green, .blue]),
                            center: .center
                        ),
                        style: StrokeStyle(lineWidth: 15.0,
                                           lineCap: .round,
                                           lineJoin: .round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0), value: progress)
        }
        .frame(width: 250, height: 250)
        .padding()
    }
```

#### Android

![AndroidMockup](https://github.com/kamaravichow/compare-circular-progress/raw/main/docs/android-mock.png)

Composable function to create a basic circular progress with compose UI

```kotlin
@Composable
fun CircularProgressBar(
    percentage: Float,
    radius: Dp = 80.dp,
    animationDuration: Int = 1000,) {
    var animFinished by remember {
        mutableStateOf(false)
    }

    val current_percent = animateFloatAsState(
        targetValue = if (animFinished) percentage else 0f,
        animationSpec = tween(
            durationMillis = animationDuration,
        )
    )

    LaunchedEffect(key1 = true) {
        animFinished = true
    }
    Box(
        contentAlignment = Alignment.Center,
        modifier = Modifier.size(radius * 2) // diameter
    ) {

        Canvas(modifier = Modifier.size(radius * 2)) {
            drawArc(
                brush = Brush.radialGradient(
                    colors = listOf(
                        Color(0xFFA0B2FF),
                        Color(0xFF1D41C5),
                        Color(0xFF0132FF)
                    )
                ),
                startAngle = -90f,
                sweepAngle = 360 * current_percent.value,
                useCenter = false,
                style = Stroke(
                    10.dp.toPx(),
                    cap = StrokeCap.Round,
                ),
            )
        }
    }
}
```



## Conclusion

I think building android UI became pretty good with Compose UI but it still needs to improve to compete with SwiftUI which is more straightforward and easy to implement predictable UIs.

What do you think ?

[**Discuss Here**](https://github.com/kamaravichow/compare-circular-progress/discussions/1)
