extends Control

@onready var menu: Control = self

@onready var resume: Button = $PanelContainer/VBoxContainer/resume
@onready var restart: Button = $PanelContainer/VBoxContainer/restart
@onready var quit: Button = $PanelContainer/VBoxContainer/quit


func _ready():
	menu.hide()

func _unhandled_input(event):
	if event.is_action_pressed("esc"):
		pause_or_unpause()

func pause_or_unpause():
	if get_tree().paused:
		menu.hide()
		get_tree().paused = false
	else:
		menu.show()
		get_tree().paused = true

func _on_resume_pressed():
	pause_or_unpause()

func _on_quit_pressed():
	get_tree().quit()
	

func _on_restart_pressed():
	get_tree().paused = false
	menu.hide()
	get_tree().reload_current_scene()
