extends StaticBody2D

var plant = Global.plantselected
var plantgrowing = false
var plant_grown = false

func _physics_process(delta: float) -> void:
	print(Global.plantselected)
	if plantgrowing == false :
		plant = Global.plantselected

func _on_area_2d_area_entered(area: Area2D) -> void:
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true 
			$carrots_timer.start()
			$plants.play("carrots_growing")
		if plant == 2:
			plantgrowing = true 
			$onions_timer.start()
			$plants.play("onions_growing")
		if plant == 3:
			plantgrowing = true 
			$strawberry_timer.start()
			$plants.play("strawberry_growing")
		if plant == 4:
			plantgrowing = true 
			$cabbage_timer.start()
			$plants.play("cabbage_growing")
	else:
		print("plant growing")


func _on_carrots_timer_timeout() -> void:
	var carrot_plant = $plants
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrots_timer.start()
	elif carrot_plant.frame == 1 :
		carrot_plant.frame = 2
		plant_grown = true
	


func _on_onions_timer_timeout() -> void:
	var onion_plant = $plants
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$onions_timer.start()
	elif onion_plant.frame == 1 :
		onion_plant.frame = 2
		plant_grown = true
	


func _on_strawberry_timer_timeout() -> void:
	var strawberry_plant = $plants
	if strawberry_plant.frame == 0:
		strawberry_plant.frame = 1
		$strawberry_timer.start()
	elif strawberry_plant.frame == 1 :
		strawberry_plant.frame = 2
		plant_grown = true


func _on_cabbage_timer_timeout() -> void:
	var cabbage_plant = $plants
	if cabbage_plant.frame == 0:
		cabbage_plant.frame = 1
		$cabbage_timer	.start()
	elif cabbage_plant.frame == 1 :
		cabbage_plant.frame = 2
		plant_grown = true
