class_name UnitState extends State

const IDLE = "Idle"
const WALK = "Walk"
const ATTACK = "Attack"
const ALERT = "Alert"

var unidad: Unit
var enemigo_mas_cercano: Area2D

func _ready() -> void:
	await owner.ready
	unidad = owner as Unit
	assert(unidad != null, "The UnitState state type must be used only in the unidad scene. It needs the owner to be a Unit node.")
	unidad.collision.connect(_handle_collision)

func _handle_collision(body: Node2D, on: bool) -> void:
	if on:
		on_collision(body)
	else :
		off_collision(body)

func on_collision(body: Node2D) -> void:
	if body.name == "deteccion_area":
		enemigo_mas_cercano = body
	finished.emit(ALERT)
	
func off_collision(body: Node2D) -> void:
	finished.emit(IDLE)
