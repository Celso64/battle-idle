# Unidad Basica
class_name Unit extends Area2D

signal collision(body: Node2D, is_on: bool)

var speed: float = 50.0

var color_unidad: Color

@onready var sprite: Sprite2D = $Sprite2D
@onready var frente: RayCast2D = $frente
@onready var deteccion: Area2D = $deteccion_area
@onready var emote: Sprite2D = $emote

func  _ready() -> void:
	deteccion.area_entered.connect(on_damage)
	deteccion.area_exited.connect(on_exit)
	emote.visible = false

func init(color: Color, posicion: Vector2, mirada: float) -> void:
	color_unidad = color
	sprite.modulate = color_unidad
	position = posicion
	frente.rotate(mirada)
	
func on_damage(body: Node2D) -> void:
	if(body.name == "deteccion_area"):
		collision.emit(body, true)
	
func on_exit(body: Node2D) -> void:
	if(body.name == "deteccion_area"):
		collision.emit(body, false)
	
func set_dark(valor: float):
	sprite.modulate = color_unidad.darkened(valor)
	
func mostrar_emote() -> void:
	emote.visible = true

func ocultar_emote() -> void:
	emote.visible = false
	
func normalizar() -> void:
	print(frente.target_position)
	frente.target_position = frente.target_position.normalized()
	print(frente.target_position)
	
func rotar(angulo: float) -> void:
	var tween = create_tween()
	tween.tween_property(frente, "target_position", angulo, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).finished.connect(func(): normalizar())
