package com.example.calllog.vm

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.calllog.ServiceGenerator
import com.example.calllog.api.CallLogService
import com.example.calllog.model.CalLogApiModel
import com.example.calllog.response.CallLogResponse
import com.google.gson.JsonObject
import okhttp3.RequestBody
import okio.Buffer
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import java.io.IOException

class CallLogViewModel : ViewModel() {

    val _callLog = MutableLiveData<CallLogResponse.LogResponse>()
    val callLogResponse: MutableLiveData<CallLogResponse.LogResponse>
        get() = _callLog

    private val api by lazy {
        val retrofit = ServiceGenerator.instance
        retrofit.create(CallLogService::class.java)
    }

    fun postLogList(
        m: ArrayList<CalLogApiModel>
    ): MutableLiveData<CallLogResponse.LogResponse> {

        api.postCallLog("application/json","TBN", "9817519776", m)
            .enqueue(object : Callback<CallLogResponse.LogResponse> {
                override fun onFailure(call: Call<CallLogResponse.LogResponse>, t: Throwable) {
                    println("There is an error 1" + t.localizedMessage)
                }

                override fun onResponse(
                    call: Call<CallLogResponse.LogResponse>,
                    response: Response<CallLogResponse.LogResponse>
                ) {
                    if (response.isSuccessful) {
                        _callLog.value = response.body()
                        println("This is the response" + response.body())
                    } else println("There is an error 2" + response)
                }

            })
        return _callLog
    }

}
private fun bodyToString(request: RequestBody): String? {
    return try {
        val buffer = Buffer()
        if (request != null) request.writeTo(buffer) else return ""
        buffer.readUtf8()
    } catch (e: IOException) {
        "did not work"
    }
}
