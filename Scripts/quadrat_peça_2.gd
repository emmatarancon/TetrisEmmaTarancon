extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Global.posicionns_ocupades[position.x/Global.amplada_cuadraditos] = position.y/Global.amplada_cuadraditos
