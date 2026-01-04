extends CharacterBody2D

@onready var ray_cast_2d_right: RayCast2D = $RayCast2D_right
@onready var ray_cast_2d_left: RayCast2D = $RayCast2D_left
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60.0
var direction = 1

func _process(delta):
	if ray_cast_2d_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false	
	
	if ray_cast_2d_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	
	position.x += direction * SPEED * delta
