extends UnitState

const SPEED_BUFF: float = 100.0

func enter(previous_state_path: String, data := {}) -> void:
	unidad.set_dark(0.5)
	unidad.speed += SPEED_BUFF

func update(_delta: float) -> void:
	var local_direction = unidad.frente.target_position.normalized()
	var global_direction = local_direction.rotated(unidad.frente.rotation)
	unidad.position += global_direction * unidad.speed * _delta

func exit() -> void:
	unidad.set_dark(0)
	unidad.speed -= SPEED_BUFF
