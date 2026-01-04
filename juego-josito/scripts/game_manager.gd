extends Node


@onready var label_manzanas: Label = $"../LabelManzanas"
@onready var label_bananas: Label = $"../LabelBananas"


@onready var label_manzanas_2: Label = $"../../../Win/LabelManzanas2"
@onready var label_bananas_2: Label = $"../../../Win/LabelBananas2"

var apple = 0
var banana = 0


func addApple():
	apple += 1
	label_manzanas.text = str(apple) 
	label_manzanas_2.text = str(apple)


func addBanana():
	banana += 1
	label_bananas.text = str(banana)
	label_bananas_2.text = str(banana)
