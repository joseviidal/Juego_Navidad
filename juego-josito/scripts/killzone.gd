extends Area2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var label_bananas: Label = $"../../../Jugador/Camera2D/LabelBananas"
@onready var label_manzanas: Label = $"../../../Jugador/Camera2D/LabelManzanas"

var bananas = 0

func _ready():
	bananas = label_bananas.text.to_int()

func _on_body_entered(body: Node2D) -> void:
	bananas = label_bananas.text.to_int()
	label_bananas.text = str(bananas)
	# Verificamos que el objeto que entra sea el jugador
	if body is CharacterBody2D:
		print("Has perdido una vida")
		audio_stream_player.play()
		bananas -= 1
		label_bananas.text = str(bananas)
		# Reiniciamos la escena inmediatamente para que el jugador reaparezca
		if bananas < 1: 
			print("Has muerto")
			audio_stream_player.play()
			get_tree().reload_current_scene()
