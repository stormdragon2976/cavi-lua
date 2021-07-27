require("card_score") -- Count up the score for the cards.
require("deck") -- Includes the shuffling of the deck.
require("computer_player") -- Computer's coroutine.
require("human_player") -- Human player's coroutine.
require("dealer") -- The main manager of the players and player himself, the dealer.

-- Initialize random seed.
-- Without this the game would always have the same order of object x/y.
math.randomseed(os.time())
                                                                                                                                                                                                                                                
-- Pop 5 random numbers and discard, to make things just a little more random.
-- Not strictly required, but it does help.
for i = 1, 5, 1 do math.random() end

deck = shuffle_deck() -- Roughly shuffled deck, again no warranties apply.
dealer() -- Play one game and that's all folks.
