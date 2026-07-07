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
