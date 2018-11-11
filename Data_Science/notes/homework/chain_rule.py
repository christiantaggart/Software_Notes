'''
Question 4

You are playing a game in which you shuffle a standard 52-card deck, then place the deck face down and reveal the card at the top of the deck. You continue drawing and revealing cards from the top until you see a face card.

What is the probability that you will reveal exactly four non-face cards before you reveal a face card?

NOTE: Face cards are the Jack, Queen, and King of each suit. There are 4 suits of 13 cards in a 52 card deck


'''


face_cards = 12

def cards(pulls):
    total = 52
    total_faceless = total - face_cards
    proly = 1
    for i in range(pulls):
        if i <= 3:
            print(i)
            print('pre total_faceless  ',total_faceless, " total ", total)
            proly *= (total_faceless / total)
            print('                                       __each proly ', proly)
            total -= 1
            total_faceless -= 1
        else:
            proly *= (face_cards / total)

        

    print('Final proly ', round((proly),3))


cards(5)


# jesus this was not a fun one.
# make the instructions clearer