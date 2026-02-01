extends UnitState

func enter(previous_state_path: String, data := {}) -> void:
	print(unidad.name)
	unidad.mostrar_emote()
	get_tree().create_timer(0.2).timeout.connect(mirar)

func mirar() -> void:
	if enemigo_mas_cercano:
		_rotate_ray_with_tween(enemigo_mas_cercano)
		finished.emit(RUN)
	else:
		finished.emit(IDLE)

func exit() -> void:
	unidad.ocultar_emote()
	
func _rotate_ray_with_tween(target: RigidBody2D):
	var target_angle = unidad.frente.to_local(target.global_position)
	var tween = create_tween()
	tween.tween_property(unidad.frente, "target_position", target_angle, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).finished.connect(func(): unidad.normalizar())
