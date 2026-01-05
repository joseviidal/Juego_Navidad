extends Node


@onready var label_manzanas: Label = $"../LabelManzanas"
@onready var label_bananas: Label = $"../LabelBananas"


var apple = 0
var banana = 0


func addApple():
	apple += 1
	label_manzanas.text = str(apple) 


func addBanana():
	banana += 1
	label_bananas.text = str(banana)
