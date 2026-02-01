extends UnitState

func physics_update(_delta: float) -> void:
	var local_direction = unidad.frente.target_position.normalized()
	var global_direction = local_direction.rotated(unidad.frente.rotation)
	unidad.move_and_collide(global_direction * unidad.speed * _delta)
	#unidad.position += global_direction * unidad.speed * _delta

func exit() -> void:
	var local_direction = unidad.frente.target_position.normalized()
	var global_direction = local_direction.rotated(unidad.frente.rotation)
	var final_pos = unidad.position + global_direction * unidad.speed * 0.02
	
	var freno = create_tween()
	
	freno.tween_property(unidad, "position", final_pos, 1.0).set_ease(Tween.EASE_OUT)
