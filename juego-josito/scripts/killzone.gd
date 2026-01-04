extends Area2D

func _on_body_entered(body: CharacterBody2D) -> void:
	print("Has tocado la gallina")
	#body.get_node("CollisionShape2D").queue_free()
	get_tree().reload_current_scene()
