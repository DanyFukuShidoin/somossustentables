package com.somos.sustentables.repository

import com.somos.sustentables.entity.Checkpoint
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CheckPointRepository : JpaRepository<Checkpoint, Long>
