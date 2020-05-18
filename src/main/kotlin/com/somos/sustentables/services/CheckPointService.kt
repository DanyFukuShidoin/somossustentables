package com.somos.sustentables.services

import com.somos.sustentables.entity.Checkpoint
import com.somos.sustentables.repository.CheckPointRepository
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service

@Service
class CheckPointService(val checkPointRepository: CheckPointRepository) {
    fun getBydId(id: Long): Checkpoint? {
        return checkPointRepository.findByIdOrNull(id)
    }
}
