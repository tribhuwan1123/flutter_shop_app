package com.example.calllog.response


object CallLogResponse {
    data class LogResponse(
        var message: String,
        var code: Int,
        var postedData: String
    )
}