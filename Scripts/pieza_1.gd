extends Area2D

const cuadraditos_vertical_pieza = 3
const cuadraditos_horizontal_pieza = 2
var es_pot_moure = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$abaix.start()
	position.y = -1*Global.amplada_cuadraditos*cuadraditos_vertical_pieza
	position.x = Global.amplada_cuadraditos*(randi_range(0,Global.num_cuadraditos_horizontal-cuadraditos_horizontal_pieza))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if es_pot_moure == true:
		if position.y < Global.amplada_cuadraditos*(Global.num_cuadraditos_vertical-cuadraditos_vertical_pieza):
			if Input.is_action_pressed("baixar"):
				position.y += Global.amplada_cuadraditos
				es_pot_moure = false 
				$costats.start() 
		if position.x < Global.amplada_cuadraditos*(Global.num_cuadraditos_horizontal-cuadraditos_horizontal_pieza):
			if Input.is_action_pressed("dreta"):
				position.x += Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()
		if position.x > 0:
			if Input.is_action_pressed("esquerra"):
				position.x+= -Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()

func _on_abaix_timeout():
	if position.y < Global.amplada_cuadraditos*(Global.num_cuadraditos_vertical-cuadraditos_vertical_pieza):
		position.y += Global.amplada_cuadraditos
		$abaix.start()
	else:
		$abaix.stop()
		$costats.stop()
		Global.posicionns_ocupades[position.x/Global.amplada_cuadraditos] = position.y/Global.amplada_cuadraditos
		Global.creanovapeça = true
		es_pot_moure = false

func _on_costats_timeout():
	es_pot_moure = true
