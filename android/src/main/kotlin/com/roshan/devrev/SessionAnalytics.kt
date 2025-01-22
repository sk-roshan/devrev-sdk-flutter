package com.roshan.devrev

import ai.devrev.sdk.DevRev
import ai.devrev.sdk.pauseRecording
import ai.devrev.sdk.resumeRecording
import ai.devrev.sdk.startRecording
import ai.devrev.sdk.stopRecording
import android.content.Context

class SessionAnalytics {
    fun startRecording(context: Context) {
        DevRev.startRecording(
            context = context
        );
    }

    fun stopRecording() {
        DevRev.stopRecording()
    }

    fun pauseRecording() {
        DevRev.pauseRecording()
    }

    fun resumeRecording() {
        DevRev.resumeRecording()
    }
}