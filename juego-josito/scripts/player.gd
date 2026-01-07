extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
# Nueva variable para el doble salto
var can_double_jump : bool = false 

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Añadir gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		# Si toca el suelo, recupera la capacidad de doble salto
		can_double_jump = true

	# Lógica de Salto y Doble Salto
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			# Salto normal
			velocity.y = JUMP_VELOCITY
			animated_sprite_2d.play("jump")
		elif can_double_jump:
			# SEGUNDO SALTO: Solo si no está en el suelo y tiene el permiso
			velocity.y = JUMP_VELOCITY
			animated_sprite_2d.play("double_jump") # Puedes usar una animación de 'spin' si tienes
			can_double_jump = false # Gastamos el doble salto

	# Movimiento horizontal
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if is_on_floor():
			animated_sprite_2d.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_sprite_2d.play("idle")
		
	# Orientación del sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	move_and_slide()

func _on_animated_sprite_2d_animation_finished() -> void:
	if is_on_floor():
		animated_sprite_2d.play("idle")
