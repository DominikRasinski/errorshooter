extends Control

class_name PlayerUI

@onready var kills: Label = %kills
@onready var lifebar: ProgressBar = %lifebar

var _kills = 0;

func _ready():
	kills.text = "0" + "/" + str(GameManager.get_win_kills());
	lifebar.value = float(GameManager.get_health());
	
func _process(delta: float) -> void:
	if GameManager.get_kills() != 0:
		_kills = GameManager.get_kills();
		kills.text = str(_kills) + "/" + str(GameManager.get_win_kills());
	
	lifebar.value = float(GameManager.get_health())
