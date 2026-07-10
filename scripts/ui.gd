extends Node2D



func _on_button_play_pressed() -> void:
	$CanvasLayer/startscreen.visible = false
	$CanvasLayer/choosescreen.visible = true


func _on_button_ship_one_pressed() -> void:
	global.chosen_ship = 1
	$CanvasLayer/choosescreen/ships/shipOne.visible = true
	$CanvasLayer/choosescreen/ships/shipTwo.visible = false
	$CanvasLayer/choosescreen/ships/shipThree.visible = false

func _on_button_ship_two_pressed() -> void:
	global.chosen_ship = 2
	$CanvasLayer/choosescreen/ships/shipOne.visible = false
	$CanvasLayer/choosescreen/ships/shipTwo.visible = true
	$CanvasLayer/choosescreen/ships/shipThree.visible = false


func _on_button_ship_three_pressed() -> void:
	global.chosen_ship = 3
	$CanvasLayer/choosescreen/ships/shipOne.visible = false
	$CanvasLayer/choosescreen/ships/shipTwo.visible = false
	$CanvasLayer/choosescreen/ships/shipThree.visible = true


func _on_button_choose_pressed() -> void:
	global.game_on = true
	$CanvasLayer/choosescreen.visible = false
	$CanvasLayer/ingamescreen.visible = true
	$CanvasLayer/choosescreen.queue_free()


func _on_button_mute_pressed() -> void:
	if global.mute == false:
		global.mute = true
		$CanvasLayer/ingamescreen/ButtonMute/LabelOn.visible = true
		$CanvasLayer/ingamescreen/ButtonMute/LabelOff.visible = false
	else:
		global.mute = false
		$CanvasLayer/ingamescreen/ButtonMute/LabelOn.visible = false
		$CanvasLayer/ingamescreen/ButtonMute/LabelOff.visible = true



func _on_button_menu_pressed() -> void:
	global.reset_values()
	get_tree().reload_current_scene()

func _process(_delta):
	if global.game_over == true:
		$CanvasLayer/ingamescreen.visible = false
		$CanvasLayer/gameoverscreen.visible = true
	$CanvasLayer/ingamescreen/LabelScore.text = str(global.score)
	$CanvasLayer/gameoverscreen/LabelScore.text = "Score : " + str(global.score)
