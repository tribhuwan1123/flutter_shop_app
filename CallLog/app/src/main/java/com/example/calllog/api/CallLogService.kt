package com.example.calllog.api

import com.example.calllog.model.CalLogApiModel
import retrofit2.Call
import com.example.calllog.response.CallLogResponse
import com.google.gson.JsonObject
import okhttp3.RequestBody
import retrofit2.http.*

interface CallLogService {



    @POST("/calllog/addlog")
    fun postCallLog(
        @Header("Content-Type") content_type: String = "application/json",
        @Header("token") token: String = "TBN",
        @Header("calledBy") calledBy: String = "9817519776",
        @Body mBody: ArrayList<CalLogApiModel>
    ): Call<CallLogResponse.LogResponse>

    @POST("/calllog/addlog")
    fun postCallLogDate(
        @Header("Content-Type") content_type: String = "application/json",
        @Header("token") token: String = "TBN",
        @Header("calledBy") calledBy: String = "9817519776",
        @Body mBody: ArrayList<CalLogApiModel>
    ): Call<CallLogResponse.LogResponse>


}
