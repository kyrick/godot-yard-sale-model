extends Node2D


export var number_rounds: = 1000000
export var number_agents: = 1000

export(PackedScene) var Agent

var _width = ProjectSettings.get_setting("display/window/size/width")
var _height = ProjectSettings.get_setting("display/window/size/height")

var _agents = []

func _ready():
	randomize()
	for _i in range(number_agents):
		var agent = Agent.instance()
		var max_wealth = number_agents * agent.wealth
		agent.position = Vector2(rand_range(10, _width - 10), rand_range(10, _height - 10))
		agent.set_max_wealth(max_wealth)
		$Agents.add_child(agent)
		_agents.append(agent)

func _process(_delta):
	for agent in _agents:
		var random_agent = _agents[randi() % _agents.size()]
		agent.exchange(random_agent)
