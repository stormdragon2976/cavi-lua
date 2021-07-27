function card_score(cards)
has_ace = false
score = 0
for x = 1, #cards, 1 do
rank = string.sub(cards[x], 1, 1)
if rank == "x" or rank == "j" or rank == "q" or rank == "k" then -- It's a ten-score card.
score = score + 10
elseif rank == "a" then -- It's an ace.
score = score + 11
has_ace = true
else
score = score + tonumber(rank)
end
end
if score > 21 and has_ace == true then -- The score is over 21, if this is the first ace counted count it as 1.
score = score - 10
end
return score
end
