class_name Unit 
## Representa una Unidad Basica
extends RigidBody2D

signal collision(body: Node, is_on: bool)

var speed: float = 50.0

var color_unidad: Color

@onready var sprite: Sprite2D = $Sprite2D
@onready var frente: RayCast2D = $frente
@onready var deteccion: Area2D = $deteccion_area
@onready var emote: Sprite2D = $emote

func  _ready() -> void:
	print(get_rid())
	deteccion.body_entered.connect(on_damage)
	deteccion.body_exited.connect(on_exit)
	emote.visible = false

func init(color: Color, posicion: Vector2, mirada: float) -> void:
	color_unidad = color
	sprite.modulate = color_unidad
	position = posicion
	frente.rotate(mirada)
	
func on_damage(body: Node) -> void:
	if(body.name == "character"):
		collision.emit(body, true)
	
func on_exit(body: Node) -> void:
	if(body.name == "character"):
		collision.emit(body, false)
	
func set_dark(valor: float):
	sprite.modulate = color_unidad.darkened(valor)
	
## Muestra una exclamacion sobre la unidad.
func mostrar_emote() -> void:
	emote.visible = true

## Oculta una exclamacion sobre la unidad.
func ocultar_emote() -> void:
	emote.visible = false
	
## Normaliza el Raycast que mira al frente.
func normalizar() -> void:
	frente.target_position = frente.target_position.normalized()
	
func rotar(angulo: float) -> void:
	var tween = create_tween()
	tween.tween_property(frente, "target_position", angulo, 1.0).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).finished.connect(func(): normalizar())
