extends Node

var words = {
	"filler": {
		"start": [
			"you know", "you see", "okay"
		],
		"any": [
			"um", "uh", "umm", "uhh", #"like", "well",
			"um", "uh", "umm", "uhh", #"like", "well",
			"er", "err", "so", "hmm"
		],
		"other": [
			"totally", "basically",
			"actually", "seriously", "I mean", 
			"you know what I mean?",
			"At the end of the day",
			"believe me", "I guess", "I suppose", "or something",
			"okay", ""
		],
		"punctuation": [
			"","", ",", "..", "...", "..."
		]
	}
}

var punctuation_time_bonus = {
	"": 0,
	",": 0.2,
	"..": 0.4,
	"...": 0.5 
}

enum { FILLER, WORD, NO_TYPE }

var people = {
	"none": {
		"path": "",
		
		"types": [WORD],
		
		"minBubbles": 4,
		"maxBubbles": 4,
		
		"startDialogue": [[1]],
		"matches": {
			1: {
				"m": ["Play"],
				"r": [1],
				"cb": funcref(self, "switch_scene"),
				"cb_arg": "tutorial"
			}
		},
		"responses": {
			1: {
				"r": [" "],
				"m": [1]
			}
		}
	},
	"dummy": {
		"path": "res://assets/images/characters/dummy",
		
		"types": [WORD],
		
		"minBubbles": 4,
		"maxBubbles": 10,
		
		"startDialogue": [[1]],
		"matches": {
			1: {
				"m": ["okay", "easy", "okay easy", "that's easy", "easy peasy", "easy peasy weazy", "easy peasy weazy fleezy", "that's easy peasy"],
				"r": [2, 5],
			},
			2: {
				"m": ["tutorial?", "tutorial!?"],
				"r": [3]
			},
			3: {
				"m": ["that's sad", "that's really sad", "that's life", "that's unfortunate", "that's really unfortunate", "oh that's sad", "oh that's really sad", "oh that's unfortunate", "oh that's really unfortunate","oh", "oh my", "oh my god", "oh my gosh", "shucks"],
				"r": [4]
			},
			4: {
				"m": ["red", "blue", "green", "yellow", "purple", "orange"],
				"r": [6]
			},
			5: {
				"m": ["cats", "dogs", "CATS!", "DOGS!", "neither"],
				"r": [6]
			},
			6: {
				"m": ["goodbye", "bye"],
				"r": [7]
			}
		},
		"responses": {
			1: {
				"r": ["Welcome to the tutorial\n\nFirst, try clicking on the bubbles around your head."],
				"m": [1, 2]
			},
			2: {
				"r": ["Perfect! Now...\nWhat's your favorite color?"],
				"m": [4]
			},
			5: {
				"r": ["Easy right?\nAre you a cat person or a dog person?"],
				"m": [5]
			},
			3: {
				"r": ["My sole purpose in life is to teach you how to play the game.", "I was created just to teach you how to play the game."],
				"m": [3]
			},
			4: {
				"r": ["Yeah... :'(\n\nAnyway, click on the map to leave the tutorial ;P"],
				"m": [6],
				"cb": funcref(self, "_show_map_button")
			},
			6: {
				"r": ["Looks like you're getting the hang of this!\nClick on the map to leave the tutorial."],
				"m": [6],
				"cb": funcref(self, "_show_map_button")
			},
			7: {
				"r": ["I'm sorry, I have no more dialogue.", "Sorry, I've run out of dialogue", "You're on your own now.", "Good luck."],
				"m": [6]
			}
		}
	},
	"boss": {
		"path": "res://assets/images/characters/boss",
		
		"types": [FILLER, FILLER, WORD],
		
		"minBubbles": 8,
		"maxBubbles": 16,
		
		"startDialogue": [[1]],
		"matches": {
			#---------------
			# DAY 1
			#---------------
			1: {
				"m": ["sorry sir", "I'm sorry sir", "sorry boss", "I'm sorry boss", "so sorry boss", "I'm sorry"],
				"r": [2]
			},
			2: {
				"m": ["okay boss", "okay sir", "yes sir", "yes boss"],
				"r": [3]
			},
			3: {
				"m": [	"it_is fine", "it_is going well", "it_is going fine", "it_is on_track", "the presentation is going well", "the presentation is going fine",
						"it_is fine sir", "it_is going well sir", "it_is going fine sir", "it_is on_track sir", "the presentation is going well sir", "the presentation is going fine sir"],
				"r": [4]
			},
			4: {
				"m": [	"what presentation", "what is a presentation", "the presentation", "the presentation is going badly",
						"what presentation sir", "what is a presentation sir", "the presentation sir", "the presentation is going badly sir"],
				"r": [6]
			},
			5: {
				"m": ["what day is_it today", "what day is_it", "what day is_it today sir", "what day is_it sir"],
				"r": [5]
			}
		},
		"responses": {
			#---------------
			# DAY 1
			#---------------
			1: {
				
				"r": ["You're late!"],
				"m": [1]
			},
			2: {
				"r": ["Yeah just get to work kiddo.", "I've heard that one before.\nNow get to work."],
				"m": [2]
			},
			3: {
				"r": ["How's the presentation coming along?", "Remember — you've got a presentation on Thursday."],
				"m": [3,4,5]
			},
			4: {
				"r": ["Good, just making sure you're on track.", "Good, just making sure you're on track kiddo."],
				"m": []
			},
			5: {
				"r": ["It's Monday today kiddo.\nNow, about that presentation?", "Don't play \"time travel\" with me kid.\nNow, about that presentation?"],
				"m": [3,4]
			},
			6: {
				"r": ["You got to be kidding me.\n\nYou better be ready on Thursday.", "Seriously?\nThis presenation is important kid, don't mess this one up."],
				"m": []
			}
		}
	},
	"mom": {
		"path": "res://assets/images/characters/mom",
		
		"types": [FILLER, WORD],
		
		"minBubbles": 6,
		"maxBubbles": 12,
		
		"startDialogue": [[1], [10], [20], [20], [20], [20]],
		"matches": {
			#---------------
			# DAY 1
			#---------------
			1: {
				"m": ["morning", "good morning", "morning mom", "good morning mom", "good"],
				"r": [3]
			},
			2: {
				"m": ["thanks", "thanks mom"],
				"r": [2,3]
			},
			3: {
				"m": ["yes", "I am", "yes I am", "I think so", "I think I am", "I think yes"],
				"r": [4]
			},
			4: {
				"m": ["no", "I am not", "no I am not", "no I am not ready", "no sorry", "sorry"],
				"r": [5]
			},
			5: {
				"m": ["yes mom", "okay mom", "yes", "alright", "yes yes"],
				"r": [4]
			},
			#---------------
			# DAY 2
			#---------------
			10: {
				"m": [	"work was good", "work was fine", "my_day was fine", "my_day was good", "good", "fine",
						"work was good mom", "work was fine mom", "my_day was fine mom", "fine mom"],
				"r": [11]
			},
			11: {
				"m": ["work was boring", "work sucks", "work was boring mom", "work was stupid"],
				"r": [12]
			},
			12: {
				"m": [	"what", "what is_it", "what favor", "ugh what is it", "ugh what favor",
						"what mom", "what is_it mom", "what favor mom", "ugh what is it mom", "ugh what favor mom"],
				"r": [13]
			},
			13: {
				"m": [	"okay", "okay mom", "yes mom", "alright", "alright mom", "sure", "sure mom"],
				"r": [14]
			},
			14: {
				"m": [ "can you give_me money", "okay can you give_me money", "sure can you give_me money", "alright can you give me money",
						"can you give_me money mom", "okay can you give_me money mom", "sure can you give_me money mom", "alright can you give me money mom"],
				"r": [15, 16]
			},
			15: {
				"m": [	"mom I_don't drink_milk", "mom...", "mom I_don't earn_much", "I_don't drink_milk", "I_dont earn_much", "I_don't drink_milk mom", "I_dont earn_much mom"],
				"r": [16]
			},
			16: {
				"m": [	"yes probably", "yes", "I think_so", "yes I think_so", "yes mom"],
				"r": [14]
			},
			#---------------
			# DAY 3
			#---------------
			20: {}, # set in increment day function
			21: {
				"m": ["what really?", "what why?", "why", "what come_on", "shucks", "aw really?", "really?", "aw why?", "aw come_on", "come_on really?"],
				"r": [22]
			},
			22: {
				"m": ["5_stars", "4_stars", "3_stars", "2_stars", "1_star"],
				"r": [23]
			}
		},
		"responses": {
			#---------------
			# DAY 1
			#---------------
			1: {
				"r": ["good morning JON, breakfast is ready"],
				"m": [1, 2]
			},
			2: {
				"r": ["Aww sweetie, you're welcome.\n\nAre you ready for work?"],
				"m": [3, 4],
				"cb": funcref(self, "_show_work_button")
			},
			3: {
				"r": ["Are you ready for work pumpkin?"],
				"m": [3, 4],
			},
			4: {
				"r": ["Hup hup, off you go! Don't want to be late huh?", "Have a good day sweetie!", "Have fun at work."],
				"m": [5],
				"cb": funcref(self, "_show_work_button")
			},
			5: {
				"r": ["WHAT? It's 8:30 and you're NOT READY YET?\nYou better get ready and go to work THIS INSTANT!"],
				"m": [5]
			},
			#---------------
			# DAY 2
			#---------------
			10: {
				"r": ["Morning pumpkin.\nHow was work yesterday?", "Morning sweetie,\nhow was work yesterday?", "Good morning sweetie, how was your day yesterday?"],
				"m": [10, 11]
			},
			11: {
				"r": ["That's great.\nSay, I have a small favor to ask you sweetie.", "Good to hear it.\nHey sweetie, I have a small favor to ask of you."],
				"m": [12]
			},
			12: {
				"r": ["Sorry to hear that.\nHey pumpkin, can you do me a favor?"],
				"m": [12]
			},
			13: {
				"r": ["When I was coming home last night, I forgot to buy milk. Do you think you could hop over to the store today and buy some?"],
				"m": [13, 14]
			},
			14: {
				"r": ["Thanks sweetie, I'm counting on you", "Thanks pumpkin, I'm counting on you", "Thanks sweetie, what would I do without you?"],
				"m": [],
				"cb": funcref(self, "_unlock_store_button")
			},
			15: {
				"r": ["Money? aren't you making enough money now at work?", "Money? aren't you making enough money now at work sweetie?"],
				"m": [15]
			},
			16: {
				"r": ["Right, here you go. $ 6 should be enough?"],
				"m": [16],
				"cb": funcref(self, "_add_money"),
				"cb_arg": 6
			},
			#---------------
			# DAY 3
			#---------------
			20: {}, # set in increment day function
			21: {
				"r": ["Sorry folks, that's all there is to this game for now."],
				"m": [21]
			},
			22: {
				"r": ["I hope you have enjoyed my game.\nPlease rate and leave a comment on my Ludum Dare page if you'd like to see more."],
				"m": [22]
			},
			23: {
				"r": ["Thanks for playing!"],
				"m": []
			}
		}
	},
	"shopkeeper": {
		"path": "res://assets/images/characters/shopkeeper",
		
		"types": [FILLER, FILLER, WORD],
		
		"minBubbles": 4,
		"maxBubbles": 12,
		
		"startDialogue": [[], [1], [1], [1], [1], [1]],
		"matches": {
			#---------------
			# DAY 2
			#---------------
			1: {
				"m": ["I want milk", "got milk?", "I want milk please", "I want to_buy milk", "can I_buy milk"],
				"r": [2],
				"cb": funcref(self, "_store_buy"),
				"cb_arg": "milk"
			},
			2: {
				"m": ["I want chocolate", "got chocolate?", "I want chocolate please", "I want to_buy chocolate", "can I_buy chocolate"],
				"r": [2],
				"cb": funcref(self, "_store_buy"),
				"cb_arg": "chocolate"
			},
			3: {
				"m": ["I want chocolate milk", "got chocolate milk?", "I want chocolate milk please", "I want to_buy chocolate milk", "can I_buy chocolate milk"],
				"r": [2],
				"cb": funcref(self, "_store_buy"),
				"cb_arg": "chocolate milk"
			},
			
			10: {
				"m": ["thank you", "thank you sir", "oh", "oh thank you", "oh thank you sir"],
				"r": [3]
			},
			11: {
				"m": ["bye", "goodbye", "bye sir", "goodbye sir"],
				"r": [4]
			}
		},
		"responses": {
			#---------------
			# DAY 2
			#---------------
			1: {
				"r": ["HELLO SIR.", "GREETINGS AND SALUTATIONS.", "GOOD MORNING SIR.", "GOOD EVENING SIR.", "HOW DO YOU DO?", "WELCOME.", "CAN I HELP YOU?", "WELCOME BACK."],
				"m": [1, 2, 3]
			},
			3: {
				"r": ["CAN I HELP YOU?", "ANYTHING ELSE?", "YOU'RE WELCOME.", "THANK YOU.."],
				"m": [1, 2, 3]
			},
			4: {
				"r": ["GOODBYE.", "GOODBYE SIR.", "AU REVOIR.", "AU REVOIR MONSIEUR."],
				"m": []
			},
			2: {} # modified in "_store_buy" function
		}
	}
}

var shop_prices = {
	"milk": 7,
	"chocolate milk": 9,
	"chocolate": 4
}

var inventory = []

var curCharacter = "dummy"

var day = -1

var scenes = {
	"menu": {
		"character": "none",
		"pitch": 0.9
	},
	"tutorial": {
		"character": "dummy",
		"pitch": 0.6,
	},
	"house": {
		"character": "mom",
		"pitch": 0.9,
	},
	"office": {
		"character": "boss",
		"pitch": 0.5,
	},
	"store": {
		"character": "shopkeeper",
		"pitch": 0.3,
	}
}

var visited_today = []

var curScene

var curResponse
var curMatches = []

var curText = []

var bubble_container
var character
var meter

var player_text
var character_text

var panel

var audio

var money_node
var money

func choice(arr):
	if arr.size() > 0:
		return arr[randi() % arr.size()]

func _ready():
	randomize()
	
	bubble_container = get_node("Camera/Player/BubbleContainer")
	character = get_node("Camera/Character")
	meter = get_node("Camera/Meter")
	
	panel = get_node("Camera/Panel")
	
	meter.connect("meter_reset", self, "_player_speak")
	
	player_text = get_node("Camera/PlayerText")
	character_text = get_node("Camera/CharacterText")
	
	money_node = get_node("Camera/Money")
	
	audio = get_node("Audio")
	audio.play("music")
	
	# character_text.set("custom_colors/font_color", Color(0,0,0))
	
	_switch_scene("menu")

func generateBubbles(n=-1):
	print("GENERATE BUBBLES")
	if people[curCharacter].responses[curResponse].m.size() == 0:
		return
	if n == -1:
		n = people[curCharacter].minBubbles
	for i in range(n):
		createBubble()

func createBubble():
	var type = choice(people[curCharacter].types)
	if get_words_in_bubbles(WORD).size() < 2:
		type = WORD
	var word
	var punctuation = ""
	if type == FILLER:
		word = choice(words.filler.any)
		punctuation = choice(words.filler.punctuation)
	elif type == WORD:
		var words = get_all_next_words()
		#print("m ", curMatches)
		#print("NEXT ", words, "BUBBLES ", get_words_in_bubbles(WORD))
		for w in get_words_in_bubbles(WORD):
			words.erase(w)
		#print("WORDS ",words)
		if words.size() == 0:
			#words = get_all_next_words()
			return
		word = choice(words)
		
	var bubblez = get_node("Camera/Player/BubbleContainer").get_children()
	for i in range(max(bubblez.size() - people[curCharacter].maxBubbles, 0)):
		choice(bubblez).destroy(0.1)
	
	var bubble = bubble_container.spawn_bubble(type, word, punctuation)
	bubble.connect("bubble_pressed", self, "_add_word")

func get_bubbles_by_type(type=NO_TYPE):
	var bubbles = []
	for bubble in get_node("Camera/Player/BubbleContainer").get_children():
		if (type == NO_TYPE or bubble.type == type) and not bubble.destroyed:
			bubbles.push_front(bubble)
	return bubbles

func get_words_in_bubbles(type):
	var words = get_bubbles_by_type(type)
	for i in range(words.size()):
		words[i] = words[i].word
	return words
	
func get_actual_words():
	var words = []
	for o in curText:
		if o.type != FILLER:
			words.push_back(o)
	return words

func equal_to(text):
	var actual_words = get_actual_words()
	var length = actual_words.size()
	var split = text.split(" ")
	var is_equal = false
	if split.size() == length:
		is_equal = true
		for i in range(length):
			if actual_words[i].word != split[i]:
				is_equal = false
	return is_equal

func get_next_words(m):
	var words = []
	var actual_words = get_actual_words()
	var index = actual_words.size()
	for text in people[curCharacter].matches[m].m:
		var split = text.split(" ")
		#print("INDEX ",index, "SIZE ", split.size())
		if split.size() > index:
			var next = true
			#print(index)
			for i in range(index):
				#print(i, ", ", actual_words[i].word, ", " , split[i])
				if actual_words[i].word != split[i]:
					next = false
			if next:
				var word = split[index]
				words.push_front(word)
	return words

func get_all_next_words():
	var words = []
	for m in curMatches:
		for word in get_next_words(m):
			if not words.has(word):
				words.push_front(word)
	return words

func _add_word(_type, _word, _punctuation):
	if _type != FILLER:
		var newMatches = []
		for m in curMatches:
			if get_next_words(m).has(_word):
				newMatches.push_front(m)
		curMatches = newMatches
	else:
		meter.speed += 0.07
	
	curText.push_back({
		"type": _type,
		"word": _word,
		"punctuation": _punctuation
	})
	
	var next_words = get_all_next_words()
	for bubble in get_node("Camera/Player/BubbleContainer").get_children():
		if bubble.type != FILLER:
			if not next_words.has(bubble.word):
				bubble.destroy(0.2)
	
	set_timeout("generateBubbles", [3], 0.1)
	
	update_player_text()
	
	meter.add_percentage(0.4 + punctuation_time_bonus[_punctuation])

func update_player_text():
	player_text.set("custom_colors/font_color", Color(0, 0, 0))
	
	var text = ""
	for i in range(curText.size()):
		text += curText[i].word.replace('_', ' ') + curText[i].punctuation + " "
	
	player_text.set_text(text)

func set_timeout(fn, args, time):
	var timer = Timer.new()
	timer.connect("timeout", self, fn, args)
	timer.connect("timeout", timer, "queue_free")
	timer.set_wait_time( time )
	timer.set("one_shot", true)
	add_child(timer)
	timer.start()

func update_character_text(a=0,b=0):
	var text = choice(people[curCharacter].responses[curResponse].r)
	var time = 0.001
	for i in range(text.length()):
		time += (randi() % 20) / 200.0
		set_timeout("_set_character_text", [text.substr(0, i+1)], time)
	set_timeout("generateBubbles", [], time)

func _set_character_text(text):
	character_text.set_text(text)

func _player_speak():
	var tween = player_text.get_node('Tween')
	tween.interpolate_property(player_text, "custom_colors/font_color", Color(0,0,0), Color(1,1,1), 0.2, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
	
	var possibleResponses = []
	for m in curMatches:
		var obj = people[curCharacter].matches[m]
		for text in obj.m:
			var equal = equal_to(text)
			if equal:
				possibleResponses.push_back(obj)
	
	if possibleResponses.size() > 0:
		possibleResponses = choice(possibleResponses)
	
	if possibleResponses.has("m"):
		curResponse = choice(possibleResponses.r)
		
		var arg = null
		if possibleResponses.has("cb_arg"):
			arg = possibleResponses.cb_arg
		
		if possibleResponses.has("cb"):
			if arg != null:
				possibleResponses.cb.call_func(arg)
			else:
				possibleResponses.cb.call_func()
		
		arg = null
		if people[curCharacter].responses[curResponse].has("cb_arg"):
			arg = people[curCharacter].responses[curResponse].cb_arg
		
		if people[curCharacter].responses[curResponse].has("cb"):
			if arg != null:
				people[curCharacter].responses[curResponse].cb.call_func(arg)
			else:
				people[curCharacter].responses[curResponse].cb.call_func()
		
		var bubbles = get_bubbles_by_type(WORD)
		if people[curCharacter].responses[curResponse].m.size() == 0:
			bubbles = get_bubbles_by_type()
		
		for bubble in bubbles:
			bubble.destroy()
		
		meter.speed = 0.45
		
		curText = []
		curMatches = people[curCharacter].responses[curResponse].m
		
		update_character_text()
	else:
		meter.moving = true
		var bubbles = get_bubbles_by_type(WORD)
		if bubbles.size() > 0:
			choice(bubbles)._pressed()
		else:
			generateBubbles(people[curCharacter].minBubbles)

func switch_scene(scene):
	if curScene == scene:
		get_node("Camera/Map").hide()
		return
	
	#if scene != curScene:
	var tween = Tween.new()
	panel.add_child(tween)
	tween.interpolate_property(panel, "visibility/opacity", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.connect("tween_complete", self, "__switch_scene", [scene])
	tween.connect("tween_complete", tween, "queue_free")
	tween.start()

func __switch_scene(a,b,scene):
	# print("|",a,"|",b,"|",scene,"|")
	_switch_scene(scene)
	
	if money == null and scene != "tutorial":
		_add_money(0)

func _switch_scene(scene):
	var tween = Tween.new()
	panel.add_child(tween)
	
	if scene == "house":
		increment_day()
	
	if scene == "office" and not visited_today.has("office"):
		_add_money(10)
	
	meter.moving = false
	meter.percentage = 1
	meter.update_meter()
	
	visited_today.push_back(scene)
	
	tween.interpolate_property(panel, "visibility/opacity", 1, 0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.3)
	
	# tween.interpolate_property(music, "params/pitch_scale", music, music.get("params/pitch_scale"), scenes[scene].pitch, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, 0.3)
	audio.voice_set_pitch_scale(0, scenes[scene].pitch)
	
	tween.connect("tween_complete", self, "_init_scene")
	tween.connect("tween_complete", tween, "queue_free")
	tween.start()
	
	_set_character_text("")
	
	for child in get_children():
		if child.get_type() == "Timer":
			child.stop()
			child.queue_free()
	
	for child in get_node("Camera/Player/BubbleContainer").get_children():
		child.queue_free()
	
	player_text.set_text("")
	character_text.set_text("")
	player_text.set("custom_colors/font_color", Color(0,0,0))
	
	get_node("Camera/Map").hide()
	
	curScene = scene
	curCharacter = scenes[scene].character
	
	character.init(people[curCharacter].path)
	curResponse = choice(people[curCharacter].startDialogue[max(min(day, people[curCharacter].startDialogue.size() - 1), 0)])
	curMatches = people[curCharacter].responses[curResponse].m

func _init_scene(a=0,b=0):
	update_character_text()

func _show_map_button():
	get_node("Camera/MapButton").show()

func _add_money(n):
	if money == null:
		money = 0
		money_node.show()
		get_node("Camera/Day").show()
	money += n
	money_node.get_node("Label").set_text("$ " + str(money))

func _show_work_button():
	get_node("Camera/Map/Office").show()

func increment_day():
	day += 1
	visited_today = []
	if day == 1:
		get_node("Camera/Map/Office").hide() # REMOVE LATER
	if day == 2:
		if inventory.has("milk"):
			inventory.erase("milk")
			people["mom"].responses[20] = {
				"r": ["Good morning pumpkin, thanks for buying milk"],
				"m": [20]
			}
			people["mom"].matches[20] = {
				"m": ["you're welcome", "welcome", "no_problem", "good morning mom", "you're welcome mom", "no_problem mom", "good morning", "morning", "morning mom"],
				"r": [21]
			}
		elif inventory.has("chocolate milk"):
			inventory.erase("chocolate milk")
			people["mom"].responses[20] = {
				"r": ["YOU DIDN'T BUY MILK?\nOoh, chocolate milk? even better! I love you sweetie."],
				"m": [20]
			}
			people["mom"].matches[20] = {
				"m": ["you're welcome", "welcome", "no_problem", "you're welcome mom", "no_problem mom"],
				"r": [21]
			}
		else:
			people["mom"].responses[20] = {
				"r": ["YOU DIDN'T BUY MILK?\n\nDIIIIEEEE!"],
				"m": [20]
			}
			people["mom"].matches[20] = {
				"m": ["sorry", "sorry mom", "shucks"],
				"r": [21]
			}
	get_node("Camera/Day").set_text("Day " + str(day + 1))

func _unlock_store_button():
	get_node("Camera/Map/Store").show()

func _store_buy(item):
	var price = shop_prices[item]
	if money >= price:
		_add_money(-price)
		inventory.push_back(item)
		people["shopkeeper"].responses[2] = {
			"r": ["PLEASURE DOING BUSINESS WITH YOU", "THAT WILL BE $ " + str(price) + ".\n\nTHANK YOU."],
			"m": [10, 11]
		}
	else:
		people["shopkeeper"].responses[2] = {
			"r": ["YOU HAVE INSUFFICIENT FUNDS", "NOT ENOUGH MONEY KID", "INSUFFICIENT FUNDS TO BUY " + item.capitalize()],
			"m": [10, 11]
		}