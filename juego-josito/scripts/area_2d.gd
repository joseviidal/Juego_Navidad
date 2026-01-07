extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_body_entered(body: Node2D) -> void:
	timer.start()


func _on_timer_timeout() -> void:
	audio_stream_player.play()
	get_tree().reload_current_scene()
