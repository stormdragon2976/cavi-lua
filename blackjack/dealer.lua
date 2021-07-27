function dealer()
exit = false
dealer_cards = {}
human_cards = {}
computer_cards = {}
-- Deal two cards to the dealer.
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(dealer_cards, card)
shown = card
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(dealer_cards, card)
human = coroutine.create(human_player)
computer = coroutine.create(computer_player)
-- Deal two cards to each player.
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(human_cards, card)
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(human_cards, card)
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(computer_cards, card)
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(computer_cards, card)
-- Now we're ready to start the players.
human_err, human_answer = coroutine.resume(human, shown, human_cards)
if human_err ~= true then
print("Error in human! " .. human_answer)
return
end
computer_err, computer_answer = coroutine.resume(computer, shown, computer_cards)
if computer_err ~= true then
print("Error in computer! " .. computer_answer)
return
end
while not exit do
if coroutine.status(human) ~= "dead" and human_answer ~= "stay" then
if human_answer == "shown" then
human_err, human_answer = coroutine.resume(human)
elseif human_answer == "hit" then
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
human_err, human_answer = coroutine.resume(human, card)
end
if human_err ~= true then
print("Error in human! " .. human_answer)
return
end
end
if coroutine.status(computer) ~= "dead" and computer_answer ~= "stay" then
if computer_answer == "shown" then
computer_err, computer_answer = coroutine.resume(computer)
elseif computer_answer == "hit" then
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
computer_err, computer_answer = coroutine.resume(computer, card)
end
if computer_err ~= true then
print("Error in computer! " .. computer_answer)
return
end
end
if (human_answer == "stay" or coroutine.status(human) == "dead") and (computer_answer == "stay" or coroutine.status(computer) == "dead") then
exit = true
end
end
-- Now see what the dealer gets.
while card_score(dealer_cards) < 17 do
num = math.random(1, #deck)
card = deck[num]
table.remove(deck, num)
table.insert(dealer_cards, card)
print("The dealer hits.")
end
result = card_score(dealer_cards)
if result > 21 then
result = "bust"
else
print("The dealer stays.")
end
if coroutine.status(human) ~= "dead" then
human_err, human_answer = coroutine.resume(human, result)
if human_err ~= true then
print("Error in human! " .. human_answer)
return
end
end
if coroutine.status(computer) ~= "dead" then
computer_err, computer_answer = coroutine.resume(computer, result)
if computer_err ~= true then
print("Error in computer! " .. computer_answer)
return
end
end
end
