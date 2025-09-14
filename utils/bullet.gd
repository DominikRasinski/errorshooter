extends Area2D

class_name Bullet

@export var speed = 500;
@export var life_time = 2;

var direction: Vector2;

func _ready() -> void:
	await get_tree().create_timer(life_time).timeout;
	queue_free();
	
func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		global_position += direction * speed * delta;
		

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("normal_enemy"):
		body.dead = true;
		queue_free()
	if body.is_in_group("glitched_enemy"):
		body.dead = true;
		GameManager.set_kills(1)
		queue_free()
