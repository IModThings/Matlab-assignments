%Texas_HoldEm('JD', '2C')
function CardMatrix=Texas_HoldEm(card1, card2)
Cards = {'A','K','Q','J','10','9','8','7','6','5','4','3','2'};
Suits = {'S','D','H','C'};
NumSuits = length(Suits);
NumCards = length(Cards);

%Parse Player 1's cards
PlayersCards = zeros(1, 2);
PlayersCards(1) = GetCard(card1);
PlayersCards(2) = GetCard(card2);

if PlayersCards(1) == PlayersCards(2)
    error('Player 1 must be dealt two different cards')
end

%Organize Player 1's cards into a matrix
CardMatrix = zeros(4,13);
CardMatrix(PlayersCards) = 1;

%---------------------- INSERT CODE FOR TASK 1 HERE ----------------------%

available = NumSuits-sum(CardMatrix);
numPairs = 0;
for ii = 1:NumCards;
  numPairs = numPairs+nchoosek(available(ii), 2);
end
probPair=numPairs/nchoosek(50,2)

%---------------------- INSERT CODE FOR TASK 2 HERE ----------------------%

available=NumSuits-sum(sum(CardMatrix(:,1)))
remaining=(NumCards-1)*NumSuits-sum(sum(CardMatrix(:,2:end)))

numAceHigh = nchoosek(available, 1)*nchoosek(remaining, 1)
probAceHigh = numAceHigh/nchoosek(50,2)

%---------------------- INSERT CODE FOR TASK 3 HERE ----------------------%

available = NumCards-sum(CardMatrix, 2);

numSuited = 0;
for ii = 1:NumSuits
  numSuited=numSuited+nchoosek(available(ii), 2);
end

probSuited=numSuited/nchoosek(50,2)

%---------------------- INSERT CODE FOR TASK 4 HERE ----------------------%

numBetter = 0;
if find(sum(CardMatrix) == 2)
  higherRankedCards=find(sum(CardMatrix) == 2)-1;
  for ii = 1:higherRankedCards
    numBetter=numBetter+nchoosek(NumSuits, 2);
  end
else
  available=NumSuits-sum(CardMatrix);
  for ii=1:NumCards
    numBetter=numBetter+nchoosek(available(ii), 2);
  end
  higherRankedCards = find(sum(CardMatrix), 1, 'first') -1;
  for ii = 1:higherRankedCards
    remaining = (NumCards-ii)*NumSuits-2;
    numBetter=numBetter+nchoosek(NumSuits, 1)*nchoosek(remaining, 1);
  end
end
probBetter = numBetter/nchoosek(50,2)

%---------------------- INSERT CODE FOR TASK 5 HERE ----------------------%

prob = [probBetter, probSuited, probAceHigh, probPair];
barh(prob)
for ii = 1:length(prob)
    text(prob(ii) + 0.005, ii, sprintf('%.2f%%', prob(ii)*100), ...
         'FontSize', 12)
end
title('Pre-Flop Probabilities for Player 2', 'FontSize', 15)
xlabel('Probability', 'FontSize', 15)
set(gca, 'YTickLabel', {'Better Hand', 'Suited Hand', 'Ace High Hand', '1 Pair'})
set(gca, 'FontSize', 15)

%-------------------------------------------------------------------------%

% Gets the card associated with a card string
function card = GetCard(cardStr)
    if isempty(cardStr)
        card = 0;
    else
        cardNum = find(strcmpi(Cards,cardStr(1:(end-1))));
        suit = find(strcmpi(Suits,cardStr(end)));
        if ((length(cardNum) ~= 1) || (length(suit) ~= 1))
            card = 0;
        else
            card = suit + (cardNum - 1) * NumSuits;
        end
    end
end

end