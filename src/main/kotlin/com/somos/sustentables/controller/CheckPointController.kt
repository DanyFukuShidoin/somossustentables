package com.somos.sustentables.controller

import com.somos.sustentables.entity.Checkpoint
import com.somos.sustentables.services.CheckPointService
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.bind.annotation.PathVariable

@Api(tags = ["CheckPointController"], description = "Endpoints to CheckPoint")
@RestController
@RequestMapping("/api/checkPoint")
class CheckPointController(
        private val checkPointService: CheckPointService
) {

    @GetMapping("/")
    @ResponseBody
    fun inicio(model: Model): String {
        model.addAttribute("title","Titulo Somos Sustentables")
        return "Somos Sustentables"
    }

    @GetMapping("/{checkPointId}")
    @ApiOperation(value = "Finds a CheckPoint by checkPoint id.")
    fun getCheckpoint(@PathVariable checkPointId: Long): Checkpoint? {
        val checkpoint: Checkpoint? = checkPointService.getBydId(checkPointId)
        return checkpoint
    }
}
