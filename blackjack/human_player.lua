function human_player(dealer_showing, cards)
print("Here are your cards: Note that card names are abbreviated, meaning a is ace, q is queen, d is diamonds, etc")
print(cards[1] .. " and " .. cards[2])
print("Dealer is showing " .. dealer_showing)
if card_score(cards) == 21 then -- It's a blackjack!
print("Blackjack! You beat the dealer!")
return
else
coroutine.yield("shown")
end
while true do -- Everything that exits the function uses return.
answer = ""
while answer ~= "hit" and answer ~= "stay" do
print("What would you like to do? hit or stay?")
answer = io.read()
answer = string.lower(answer)
end
if answer == "stay" then
dealer_score = coroutine.yield(answer)
your_score = card_score(cards)
if dealer_score == "bust" then
print("You got " .. your_score .. " and the dealer busted. You win!")
elseif your_score > dealer_score then
print("You got " .. your_score .. " and the dealer got " .. dealer_score .. "... You win!")
elseif your_score == dealer_score then
print("You got " .. your_score .. " which is the same as the dealer's... You push.")
else
print("You got " .. your_score .. " and the dealer got " .. dealer_score .. "... You lose. Better luck next time.")
end
return
else
card = coroutine.yield(answer)
print("You got " .. card)
table.insert(cards, card)
your_score = card_score(cards)
if your_score > 21 then
print("Oops, You scored " .. your_score .. "... You bust!")
return
end
end
end
end
