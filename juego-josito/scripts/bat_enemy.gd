extends CharacterBody2D

# Configuración técnica para cumplir con "Enemigos Inteligentes" 
const SPEED = 130.0
var personaje_objetivo: CharacterBody2D = null
var en_persecucion: bool = false

# Variables con tus nombres de nodos exactos
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var area_persecucion: Area2D = $area_persecucion
@onready var killzone: Area2D = $killzone

func _physics_process(_delta: float) -> void:
	if en_persecucion and personaje_objetivo:
		# Algoritmo de persecución por vectores 
		var direccion = (personaje_objetivo.global_position - global_position).normalized()
		velocity = direccion * SPEED
		
		# Orientación del sprite
		if direccion.x > 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false
		
		animated_sprite_2d.play("flying") # Asegúrate de tener esta animación
	else:
		# Movimiento suave hacia el reposo si pierde al jugador
		velocity = velocity.move_toward(Vector2.ZERO, 7)
		# animated_sprite_2d.play("idle")

	move_and_slide()

# --- SEÑALES DE area_persecucion ---

func _on_area_persecucion_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		personaje_objetivo = body
		en_persecucion = true
		print("Murciélago detectó al personaje")

func _on_area_persecucion_body_exited(body: Node2D) -> void:
	if body == personaje_objetivo:
		en_persecucion = false
		personaje_objetivo = null
