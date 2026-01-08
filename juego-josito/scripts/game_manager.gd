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
	
func siguienteNivel():
	# 1. Obtenemos la ruta completa del archivo actual
	# Ej: "res://niveles/Mapa 2.tscn"
	var ruta_actual = get_tree().current_scene.scene_file_path
	print(ruta_actual)
	
	if ruta_actual != "res://scenes/mapa_2.tscn" and ruta_actual != "res://scenes/mapa_3.tscn":
		ruta_actual = "res://scenes/mapa_1.tscn"
		print(ruta_actual)
	# 2. Vamos a buscar el número en el nombre del archivo.
	# Usamos una expresión regular (RegEx) para encontrar números
	var regex = RegEx.new()
	regex.compile("\\d+") # Busca cualquier secuencia de dígitos
	
	var resultado = regex.search(ruta_actual)
	
	if resultado:
		# Encontramos un número (ej: "2")
		var numero_actual = resultado.get_string().to_int()
		var siguiente_numero = numero_actual + 1
		
		# 3. Reemplazamos el "2" por el "3" en la ruta
		# Cuidado: Esto reemplaza el primer número que encuentre en el nombre
		var proxima_ruta = ruta_actual.replace(str(numero_actual), str(siguiente_numero))
		
		# 4. Comprobamos si el archivo existe antes de cambiar (para no crashear en el último nivel)
		if ResourceLoader.exists(proxima_ruta):
			print("Cambiando a: " + proxima_ruta)
			# Usamos call_deferred para evitar errores de físicas
			call_deferred("_cambiar_escena", proxima_ruta)
		else:
			print("¡No existe el nivel " + proxima_ruta + "! ¿Es el final del juego?")
			# Aquí podrías mandar al menú principal
	else:
		print("El nombre del nivel no tiene número, no sé a cual ir.")

func _cambiar_escena(ruta):
	get_tree().change_scene_to_file(ruta)
