Feature: Poker Hands
  In order to determine who wins a round of poker
  A poker dealer should be able to identify the type of poker hands and declare a winner

  Background:
    Given a poker round is complete

  Scenario Outline: Compare two poker hands
    Given player1 has the cards <player_1_cards>
    And player2 has the cards <player_2_cards>
    Then player1 has a <player_1_hand_type>
    And player2 has a <player_2_hand_type>
    And the winner is <winner>
  Examples:
    | player_1_cards | player_2_cards | player_1_hand_type | player_2_hand_type | winner  |
    | 2S,3S,4S,5S,AC | 2H,3H,4H,5H,KD | High Card (A)      | High Card (K)      | player1 |
    | 2S,3S,4S,5S,AC | 2H,3H,4H,5H,5D | High Card (A)      | One Pair (5)       | player2 |
    | 2S,3S,AS,5S,5C | 2H,3H,AH,6H,6D | One Pair (5)       | One Pair(6)        | player2 |