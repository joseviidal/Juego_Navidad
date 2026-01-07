extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var GameManager: Node = %GameManager

# Variable para que no se active mil veces seguidas
var is_active = false

func _ready():
	# Conectamos la señal por código para evitar errores manuales en el editor
	body_entered.connect(_on_body_entered)
	
	# Inicia con la animación de apagado (asegúrate de tener una llamada "idle")
	# animated_sprite.play("idle") 

func _on_body_entered(body):
	# Verificamos que sea el Jugador y que el checkpoint no esté ya activo
	if body.name == "Player" and not is_active:
		activate_checkpoint()

func activate_checkpoint():
	print("¡Checkpoint activado!")
	is_active = true
	
	# 1. Cambiar la animación (Si tienes una llamada "activated")
	# animated_sprite.play("activated")
	
	# OPCIONAL: Si no tienes animaciones, descomenta esta línea para que se ponga verde
	# animated_sprite.modulate = Color.GREEN
	
	# 2. Guardar la posición en el Game Manager
	# Usamos global_position para guardar la coordenada exacta en el mundo
	GameManager.last_checkpoint_pos = global_position
