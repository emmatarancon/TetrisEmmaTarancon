extends Node2D

var peça1:PackedScene = load("res://Escenes/pieza_1.tscn")
var peça2:PackedScene = load("res://Escenes/pieza_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	defineix_diccionari_posicions()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.creanovapeça == true :
		var peça = randi_range(1,1)
		if peça == 1:
			var novapeça = peça1.instantiate()
			add_child(novapeça)
		elif peça == 2:
			var novapeça = peça2.instantiate()
			add_child(novapeça)
		Global.creanovapeça = false
	

func defineix_diccionari_posicions():
	var y = -3
	while y <= Global.num_cuadraditos_vertical:
		Global.posicionns_ocupades["Y_"+str(y)+", X_0"] = false
		var x = 1
		while x <= Global.num_cuadraditos_horizontal:
			Global.posicionns_ocupades["Y_"+str(y)+", X_"+str(x)] = true
			x += 1
		Global.posicionns_ocupades["Y_"+str(y)+", X_"+str(Global.num_cuadraditos_horizontal+1)] = false
		y += 1
	var x = 1
	while x <= Global.num_cuadraditos_horizontal:
		Global.posicionns_ocupades["Y_"+str(Global.num_cuadraditos_vertical+1)+", X_"+str(x)] = false
		x += 1
	print(Global.posicionns_ocupades)
	#POSICIONS_OCUPADES = {[coordenada_y,coordenada_x]:true_o_false}

