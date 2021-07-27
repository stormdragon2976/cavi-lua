function computer_player(dealer_showing, cards)
aggression = math.random(-2, 2) + 16
dealer_rank = string.sub(dealer_showing, 1, 1) -- Get the rank of the dealer card that is showing.
if dealer_rank == "8" or dealer_rank == "9" or dealer_rank == "x" or dealer_rank == "j" or dealer_rank == "q" or dealer_rank == "k" then
aggression = aggression + 1 -- Be a little more aggressive since it looks like the dealer has good cards.
end
print("The computer player is dealt their cards.")
if card_score(cards) == 21 then -- It's a blackjack!
print("The computer player got blackjack! They beat the dealer!")
return
else
coroutine.yield("shown")
end
while true do
current_score = card_score(cards)
if current_score >= aggression then
answer = "stay"
else
answer = "hit"
end
if answer == "stay" then
print("The computer player stays.")
dealer_score = coroutine.yield(answer)
your_score = card_score(cards)
if dealer_score == "bust" then
print("The computer got " .. your_score .. " and the dealer busts. They win!")
elseif your_score > dealer_score then
print("The computer player got " .. your_score .. " and the dealer got " .. dealer_score .. "... They win!")
elseif your_score == dealer_score then
print("The computer player got " .. your_score .. " which is the same as the dealer's... They push.")
else
print("The computer player got " .. your_score .. " and the dealer got " .. dealer_score .. "... They lose. Better luck next time.")
end
return
else
print("The computer player hits.")
card = coroutine.yield(answer)
table.insert(cards, card)
your_score = card_score(cards)
if your_score > 21 then
print("Oops, The computer player scored " .. your_score .. "... They bust!")
return
end
end
end
end
