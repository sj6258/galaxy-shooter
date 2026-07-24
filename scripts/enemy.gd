extends CharacterBody2D

@export var health = 1
@export var speed = 100.0
@export var type = "ship"

var destroyed = false

func _ready() -> void:
	$AnimationPlayerBoom.play("idle")
	$AnimationPlayerHurting.play("idle")
	

func _process(delta: float) -> void:
	if global.game_on == true and global.game_over == false:
		velocity = Vector2(0,1) * speed
		move_and_slide()
	if health <= 0 and destroyed == false:
		destroyed = true
		global.score += 1
		destroy()
		

func destroy():
	speed = 0
	if type == "ship":
		$Sprite2D.visible = false
		$AnimationPlayerBoom.play("hurting")
		$AudioStreamPlayer2D.play()
		await $AnimationPlayerBoom.animation_finished
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		health -= 3
		if type == "meteor":
			area.get_parent().health -= 100
	if area.is_in_group("laser"):
		health -= 1
		if type == "ship" and health > 0:
			$AnimationPlayerHurting.play("hurting")
		if area.get_parent().laser_type != 3:
			area.get_parent().queue_free()


func _on_timer_timeout() -> void:
	queue_free()
