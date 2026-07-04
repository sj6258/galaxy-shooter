extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("loop")

func _process(_delta):
	if global.game_over == true:
		$AnimationPlayer.pause()
