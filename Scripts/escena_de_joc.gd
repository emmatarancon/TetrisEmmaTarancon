extends Node2D

var peça1:PackedScene = load("res://Escenes/pieza_1.tscn")
var peça2:PackedScene = load("res://Escenes/pieza_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	defineix_diccionari_posicions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.creanovapeça == true :
		var peça = randi_range(1,2)
		if peça == 1:
			var novapeça = peça1.instantiate()
			add_child(novapeça)
		elif peça == 2:
			var novapeça = peça2.instantiate()
			add_child(novapeça)
		Global.creanovapeça = false

func defineix_diccionari_posicions():
	var i = 1
	while i < Global.num_cuadraditos_vertical+1:
		var j = 1
		while j < Global.num_cuadraditos_horizontal+1:
			Global.posicionns_ocupades["Y_"+str(i)+", X_"+str(j)] = true
			j += 1
		i += 1
	var k = 1
	while k < Global.num_cuadraditos_horizontal:
		Global.posicionns_ocupades["Y_"+str(Global.num_cuadraditos_vertical+1)+", X_"+str(k)] = false
		k += 1
	#POSICIONS_OCUPADES = {[coordenada_y,coordenada_x]:true_o_false}
	print(Global.posicionns_ocupades)

