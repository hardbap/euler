## Project Euler 54 - Poker Hands

A Ruby implementation of the [Poker problem](https://projecteuler.net/problem=54).

## How many hands does Player 1 win?

Based on my calculations Player 1 wins _379_ games.

## Run it

`ruby euler.rb`

## Run the test suite

`rake`

## Known issues

* Code does not detect a Straight that starts with an A but this is outside the
scope of the problem. The problem only defines the A as having one value and
there are no such Straights in the `poker.txt`.
