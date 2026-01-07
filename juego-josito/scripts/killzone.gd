extends Area2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var label_bananas: Label = $"../../../Jugador/Camera2D/LabelBananas"

var bananas = 0


func _ready():
	bananas = label_bananas.text.to_int()
	
	# Opcional: Imprimir para verificar



func _on_body_entered(body: Node2D) -> void:
	bananas = label_bananas.text.to_int()
	label_bananas.text = str(bananas)
	# Verificamos que el objeto que entra sea el jugador
	if body is CharacterBody2D:
		print("Has muerto")
		audio_stream_player.play()
		bananas -= 1
		label_bananas.text = str(bananas)
		# Reiniciamos la escena inmediatamente para que el jugador reaparezca
		if bananas < 1: 
			audio_stream_player.play()
			get_tree().reload_current_scene()
			
