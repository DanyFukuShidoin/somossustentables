package com.somos.sustentables

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SustentablesApplication

fun main(args: Array<String>) {
	try {
		println("spring.profiles.active: " + System.getProperty("spring.profiles.active"))
		println("application.environment: " + System.getProperty("application.environment"))
		println("application.environment: " + System.getProperty("classpath:db/migrations/versioned"))
		runApplication<SustentablesApplication>(*args)
	} catch (e: Exception) {
		e.printStackTrace()
		throw e
	}
}
