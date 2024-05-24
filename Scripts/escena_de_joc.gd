extends Node2D

var peça2:PackedScene = load("res://Escenes/pieza_2.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var novapeça = peça2.instantiate()
	add_child(novapeça)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.es_pot_moure == 1 :
		Global.es_pot_moure = 2
		$EsperaMovimentCostats.start()


func _on_espera_moviment_costats_timeout():
	Global.es_pot_moure = 0
