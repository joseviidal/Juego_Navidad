extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node2D) -> void:
	timer.start()



func _on_timer_timeout() -> void:
	audio_stream_player.play()
	
	# Esta línea es la magia: espera hasta que el audio termine
	await audio_stream_player.finished
	
	get_tree().reload_current_scene()
