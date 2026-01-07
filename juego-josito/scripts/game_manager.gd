extends Node


@onready var label_manzanas: Label = $"../LabelManzanas"
@onready var label_bananas: Label = $"../LabelBananas"
@onready var audio_stream_player: AudioStreamPlayer = $"../../../AudioStreamPlayer"


var apple = 0
var banana = 0

func _ready():
	banana = label_bananas.text.to_int()
	
	# Opcional: Imprimir para verificar
	print("Bananas cargadas desde el Label: ", banana)


func addApple():
	apple += 1
	label_manzanas.text = str(apple) 

func addBanana():
	banana = label_bananas.text.to_int()
	banana += 1
	label_bananas.text = str(banana)
