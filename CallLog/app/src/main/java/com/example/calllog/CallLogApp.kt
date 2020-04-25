package com.example.calllog

import android.app.Application
import android.content.Intent
import android.os.Build


class CallLogApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(Intent(this, CallService::class.java))
        } else {
            startService(Intent(this, CallService::class.java))
        }

    }
}