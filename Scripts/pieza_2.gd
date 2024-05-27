extends Area2D

const cuadraditos_vertical_pieza = 2
const cuadraditos_horizontal_pieza = 3
var es_pot_moure = true
var viu = true

# Called when the node enters the scene tree for the first time.
func _ready():
	$abaix.start()
	position.y = -1*Global.amplada_cuadraditos*cuadraditos_vertical_pieza
	position.x = Global.amplada_cuadraditos*(randi_range(0,Global.num_cuadraditos_horizontal-cuadraditos_horizontal_pieza))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if viu == true:
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == false:
			viu = false
			ha_acabat_de_moures()
	if es_pot_moure == true and viu == true:
		if Input.is_action_pressed("baixar"):
			if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == true:
				position.y += Global.amplada_cuadraditos
				es_pot_moure = false 
				$costats.start()
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+4)] == true:
			if Input.is_action_pressed("dreta"):
				position.x += Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+0)] == true:
			if Input.is_action_pressed("esquerra"):
				position.x += -Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()

func _on_costats_timeout():
	es_pot_moure = true

func _on_abaix_timeout():
	if viu == true:
		position.y += Global.amplada_cuadraditos
		$abaix.start()

func ha_acabat_de_moures():
	Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] = false
	Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] = false
	Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] = false
	Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] = false
	Global.creanovapeça = true
	es_pot_moure = false
