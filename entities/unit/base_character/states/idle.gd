extends UnitState

func update(_delta: float) -> void:
	if true:
		finished.emit(WALK)

func _collision(body: Node2D):
	unidad.set_dark(0.5)
	
