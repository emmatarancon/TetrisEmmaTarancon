extends Area2D

const cuadraditos_vertical_pieza = 3
const cuadraditos_horizontal_pieza = 2
var es_pot_moure = true
var viu = true
var rotacio = 0
var avall = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$abaix.start()
	position.y = -1*Global.amplada_cuadraditos*cuadraditos_vertical_pieza
	position.x = Global.amplada_cuadraditos*(randi_range(0,Global.num_cuadraditos_horizontal-cuadraditos_horizontal_pieza))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if viu == true:
		mirar_si_es_pot_moure_avall()
		if avall == false:
			viu = false
			ha_acabat_de_moures()
	if es_pot_moure == true and viu == true:
		if Input.is_action_pressed("baixar"):
			mirar_si_es_pot_moure_avall()
			if avall == true:
				position.y += Global.amplada_cuadraditos
				es_pot_moure = false 
				$costats.start() 
		if Input.is_action_pressed("dreta"):
			if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == true:
				position.x += Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()
		if Input.is_action_pressed("esquerra"):
			if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+0)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+0)] == true and Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+0)] == true:
				position.x+= -Global.amplada_cuadraditos
				es_pot_moure= false
				$costats.start()
		if Input.is_action_pressed("rotar"):
			rotacio += 1
			if rotacio == 1:
				position.x += 2*Global.amplada_cuadraditos
				position.y += Global.amplada_cuadraditos
				rotation_degrees += 90
			if rotacio == 2:
				position.x += -Global.amplada_cuadraditos
				position.y += 2*Global.amplada_cuadraditos
				rotation_degrees += 90
			if rotacio == 3:
				position.x += -2*Global.amplada_cuadraditos
				position.y += -Global.amplada_cuadraditos
				rotation_degrees += 90
			if rotacio == 4:
				position.x += Global.amplada_cuadraditos
				position.y += -2*Global.amplada_cuadraditos
				rotation_degrees += 90
				rotacio = 0
			es_pot_moure= false
			$costats.start()

func mirar_si_es_pot_moure_avall():
	if rotacio == 0:
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+4)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+4)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == false:
			avall = false
		else:
			avall = true
	if rotacio == 1:
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == false:
			avall = false
		else:
			avall = true
	if rotacio == 2:
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+4)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == false:
			avall = false
		else:
			avall = true
	if rotacio == 3:
		if Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] == false or Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+3)] == false:
			avall = false

func mirar_si_es_pot_moure_dreta():
	if rotacio == 0:
		pass

func _on_abaix_timeout():
	if viu == true:
		position.y += Global.amplada_cuadraditos
		$abaix.start()

func _on_costats_timeout():
	es_pot_moure = true

func ha_acabat_de_moures():
	if rotacio == 0:
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+1)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+3)+", X_"+str((position.x/Global.amplada_cuadraditos)+2)] = false
	elif rotacio == 1:
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)-2)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+2)+", X_"+str((position.x/Global.amplada_cuadraditos)-2)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)-1)] = false
		Global.posicionns_ocupades["Y_"+str((position.y/Global.amplada_cuadraditos)+1)+", X_"+str((position.x/Global.amplada_cuadraditos)+0)] = false
	print(Global.posicionns_ocupades)
	Global.creanovapeça = true
	es_pot_moure = false
