function shuffle_deck()
deck = {} -- Empty for now.
cards = {} -- Also empty for now.
suits = {"c", "d", "h", "s"} -- The letter of the card suit.
ranks = {"2", "3", "4", "5", "6", "7", "8", "9", "x", "j", "q", "k", "a"} -- The rank of the card, from 2 to ace.
for x = 1, #ranks, 1 do -- Loop from 2 to ace.
for y = 1, #suits, 1 do -- Loop from clubs to spades.
table.insert(cards, ranks[x] .. suits[y]) -- Insert a card in the format "ac" for ace of clubs, or "5d" for 5 of diamonds.
end -- Suits.
end -- Ranks.
-- Now comes the shuffling: Pick a number from 1 to size of cards remaining, remove it from the cards, and add it to the deck. Repeat until there are no cards left.
while #cards > 0 do -- Loop until there are zero cards left to add to the deck.
num = math.random(1, #cards)
card = cards[num]
table.remove(cards, num)
table.insert(deck, card)
end
return deck -- Done! Here's your roughly shuffled deck. No warrantys apply.
end
