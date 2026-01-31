extends Node2D

const unidad_escena: PackedScene = preload("res://entities/unit/base_character/character_base.tscn")
const colores: Array[Color] = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW]

func _ready() -> void:	
	for i in range(2):
		var unidad_nueva: Area2D = unidad_escena.instantiate()
		add_child(unidad_nueva)
		var nueva_pos: Vector2 = Vector2(100+500*(i+1), 256 + 150 * i)
		var nueva_mirada: float = deg_to_rad(90+180*(i-1))
		unidad_nueva.init(colores[i], nueva_pos, nueva_mirada)
