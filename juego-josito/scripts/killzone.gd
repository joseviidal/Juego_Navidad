extends Area2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	# Verificamos que el objeto que entra sea el jugador
	if body is CharacterBody2D:
		print("Has muerto")
		audio_stream_player.play()
		# Reiniciamos la escena inmediatamente para que el jugador reaparezca
		get_tree().reload_current_scene()
