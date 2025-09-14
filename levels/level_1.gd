extends Node2D

@onready var canvas_modulate: CanvasModulate = %CanvasModulate
@onready var player: Player = $CanvasModulate/Player

var _timer
var time_for_light = 10.0

func _ready() -> void:
	get_tree().paused = false;

func _process(delta: float) -> void:
	if canvas_modulate.color == Color.BLACK:
		player.point_light_2d.visible = true
		_timer = get_tree().create_timer(time_for_light)
	else:
		player.point_light_2d.visible = false;
		
	if _timer:
		await _timer.timeout
		canvas_modulate.color = Color.WHITE;

	if GameManager.get_health() == 0:
		get_tree().current_scene.add_child(GameManager.get_game_over())
		get_tree().paused = true;
	
	if GameManager.get_kills() == GameManager.get_win_kills():
		GameManager.load_main_menu()
