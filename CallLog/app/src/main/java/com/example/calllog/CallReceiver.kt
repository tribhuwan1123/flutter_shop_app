package com.example.calllog

import android.content.Context
import android.os.Handler
import android.util.Log
import android.widget.Toast
import java.util.*

class CallReceiver : PhonecallReceiver() {
    override fun onIncomingCallReceived(ctx: Context?, number: String?, start: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + start, Toast.LENGTH_LONG).show()
            Log.i("Tribhuwan", "CAlled to $number")
            println("Tribhuwan $number")

        }
    }

    override fun onIncomingCallAnswered(ctx: Context?, number: String?, start: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + start, Toast.LENGTH_LONG).show()
            println("Tribhuwan $number")

            Log.i("Tribhuwan", "CAlled to $number")
        }
    }

    override fun onIncomingCallEnded(ctx: Context?, number: String?, start: Date?, end: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + start, Toast.LENGTH_LONG).show()
            println("Tribhuwan $number")

            Log.i("Tribhuwan", "CAlled to $number")
        }
    }

    override fun onOutgoingCallStarted(ctx: Context?, number: String?, start: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + start, Toast.LENGTH_LONG).show()
            println("Tribhuwan1 $number")

            Log.i("Tribhuwan", "Called to $number")
        }
    }

    override fun onOutgoingCallEnded(ctx: Context?, number: String?, start: Date?, end: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + end, Toast.LENGTH_LONG).show()
            Log.i("Tribhuwan", "Called to $number  " + end)
            println("Tribhuwan2 $number")

        }
    }

    override fun onMissedCall(ctx: Context?, number: String?, start: Date?) {
        val handler = Handler()
        handler.post {
            Toast.makeText(ctx, number + "" + start, Toast.LENGTH_LONG).show()
            Log.i("Tribhuwan", "CAlled to $number")
            println("Tribhuwan Missed call $number")
        }
    }

}