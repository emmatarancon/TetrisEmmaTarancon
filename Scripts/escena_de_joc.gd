extends Node2D

var peça1:PackedScene = load("res://Escenes/pieza_1.tscn")
var peça2:PackedScene = load("res://Escenes/pieza_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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

