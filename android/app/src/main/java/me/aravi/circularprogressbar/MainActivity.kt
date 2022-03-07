package me.aravi.circularprogressbar

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.animation.core.animateFloatAsState
import androidx.compose.animation.core.tween
import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.size
import androidx.compose.runtime.*
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Brush
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.Stroke
import androidx.compose.ui.unit.Dp
import androidx.compose.ui.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Box(
                contentAlignment = Alignment.Center,
                modifier = Modifier.fillMaxSize(),
            ) {
                CircularProgressBar(percentage = 0.9f)
            }
        }
    }
}


@Composable
fun CircularProgressBar(
    percentage: Float,
    radius: Dp = 80.dp,
    animationDuration: Int = 1000,
) {

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