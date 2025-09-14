extends Control

@onready var retry_click: AudioStreamPlayer2D = %RetryClick
@onready var quit_click: AudioStreamPlayer2D = %QuitClick

func _on_retry_pressed() -> void:
	retry_click.play()
	GameManager.loadLevel();


func _on_quit_pressed() -> void:
	quit_click.play()
	GameManager.load_main_menu()
