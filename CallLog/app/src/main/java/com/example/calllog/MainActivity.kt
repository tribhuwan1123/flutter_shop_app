package com.example.calllog

import android.Manifest
import android.Manifest.permission.READ_CALL_LOG
import android.annotation.SuppressLint
import android.content.pm.PackageManager
import android.os.Build
import android.os.Bundle
import android.provider.CallLog
import android.util.Log
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.ViewModelProvider
import com.example.calllog.model.CalLogApiModel
import com.example.calllog.vm.CallLogViewModel
import java.lang.Long
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.*
import kotlin.collections.ArrayList


@Suppress("DEPRECATION")
class MainActivity : AppCompatActivity() {
    private val CALL_REQUEST_CODE = 101
    val callLogList = ArrayList<CalLogApiModel>()
    private lateinit var callLogModel: CalLogApiModel

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setUpPermissions()
        val callLog: ArrayList<CalLogApiModel> = getCallDetails()!!
        sendToServer(callLog)
    }

    private fun sendToServer(m: ArrayList<CalLogApiModel>) {
        val callLogViewModel = ViewModelProvider(this).get(CallLogViewModel::class.java)
        callLogViewModel.postLogList(m)

        callLogViewModel.callLogResponse.observe(this, androidx.lifecycle.Observer { response ->
            println("This is the response " + response.message + response.postedData)
        })
    }


    private fun setUpPermissions() {
        val permission = ContextCompat.checkSelfPermission(
            MainActivity@ this,
            READ_CALL_LOG
        )

        if (permission != PackageManager.PERMISSION_GRANTED) {
            Log.i("Permission", "Permission to storage denied")
            makeRequest()
        }
    }

    private fun makeRequest() {
        ActivityCompat.requestPermissions(
            this,
            arrayOf(Manifest.permission.READ_CALL_LOG),
            CALL_REQUEST_CODE
        )
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        when (requestCode) {
            CALL_REQUEST_CODE -> {
                if (grantResults.isEmpty() || grantResults[0] != PackageManager.PERMISSION_GRANTED) {

                    Log.i("Permission", "Permission has been denied by user")
                } else {
                    Log.i("Permission", "Permission has been granted by user")
                }
            }
        }

    }

    @SuppressLint("SimpleDateFormat")
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun getCallDetails(): ArrayList<CalLogApiModel>? {
        val sb = StringBuffer()
        val managedCursor = managedQuery(
            CallLog.Calls.CONTENT_URI, null,
            null, null, null
        )
        val number = managedCursor.getColumnIndex(CallLog.Calls.NUMBER)
        val type = managedCursor.getColumnIndex(CallLog.Calls.TYPE)
        val date = managedCursor.getColumnIndex(CallLog.Calls.DATE)
        val duration = managedCursor.getColumnIndex(CallLog.Calls.DURATION)
        sb.append("Call Details :")
        try {
            while (managedCursor.moveToNext()) {
                val phNumber = managedCursor.getString(number)
                val callType = managedCursor.getString(type)
                val callDate = managedCursor.getString(date)
                val callDayTime = Date(Long.valueOf(callDate))
                val callDuration = managedCursor.getString(duration)
                var dir: String? = null
                val dircode = callType.toInt()
                when (dircode) {
                    CallLog.Calls.OUTGOING_TYPE -> dir = "OUTGOING"
                    CallLog.Calls.INCOMING_TYPE -> dir = "INCOMING"
                    CallLog.Calls.MISSED_TYPE -> dir = "MISSED"
                    CallLog.Calls.REJECTED_TYPE -> dir = "REJECTED"
                }
                callLogModel = CalLogApiModel(
                    phNumber,
                    dir!!,
                    callDuration,
                    callDayTime
                )

                callLogList.add(callLogModel)
                if (callLogList.size > 1) {
                    return callLogList
                }
            }
            managedCursor.close()
        } catch (e: NullPointerException) {
            println("There is an exception" + e.message + e.localizedMessage)
        }
        return callLogList
    }


}
