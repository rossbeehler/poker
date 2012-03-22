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
    | 2S,3S,4S,5S,AD | 2C,3C,4C,5C,KD | High Card (A)      | High Card (K)      | player1 |