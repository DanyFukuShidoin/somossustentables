package com.somos.sustentables.entity

import org.springframework.lang.NonNull
import java.time.LocalDateTime
import javax.persistence.*

@Entity
@Table(name = "checkpoint", schema = "somossustentables")
data class Checkpoint(
        @Id
        var id: Long,
        @NonNull
        var checkpoint_id: Int,
        var name: String,
        var description: String,
        var type: String,
        @JoinColumn(name = "condition_type")
        var conditionType: String,
        @NonNull
        var created: LocalDateTime,
        @NonNull
        var updated: LocalDateTime,
        @NonNull
        var updatedBy: String

        /*
        @OneToOne
        @JoinColumn(name = "address_id")
        var address: Address,
        @OneToOne
        @JoinColumn(name = "owner_id")
        var owner: Owner,
        @OneToMany
        @JoinColumn(name = "attribute_id")
        var attributes: Attribute,
        @OneToMany
        @JoinColumn(name = "room_id")
        var rooms: Room,
         */
)

