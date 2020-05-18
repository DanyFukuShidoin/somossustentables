package com.somos.sustentables.entity

import org.springframework.lang.NonNull
import java.time.LocalDateTime
import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.Table


@Entity
@Table(name = "address", schema = "somossustentables")
data class Address(
        @Id
        var id: Long,
        @NonNull
        var address_id: Int,
        var name: String,
        @NonNull
        var created: LocalDateTime,
        @NonNull
        var updated: LocalDateTime,
        @NonNull
        var updatedBy: String
)
