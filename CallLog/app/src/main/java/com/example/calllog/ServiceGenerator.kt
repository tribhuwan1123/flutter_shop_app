package com.example.calllog

import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory

object ServiceGenerator {
    private var ourInstance: Retrofit? = null

    val instance: Retrofit
        get() {
            if (ourInstance == null) {
                ourInstance = Retrofit.Builder()
                    .baseUrl("https://cms.kalasherp.com/")
                    .addConverterFactory(GsonConverterFactory.create())
                    .build()

            }
            return ourInstance!!

        }
}