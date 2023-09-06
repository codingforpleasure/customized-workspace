* <!--ts-->
   * [MathJax](#mathjax)

<!-- Added by: gil_diy, at: Tue 22 Feb 2022 09:44:05 IST -->

<!--te-->

# MathJax

[Link](https://jojozhuang.github.io/tutorial/mathjax-cheat-sheet-for-mathematical-notation/)



There are 37 Events:

* 50 m freestyle
* 100 m freestyle
* 200 m freestyle
* 400 m freestyle
* 800 m freestyle
* 1500 m freestyle
* 100 m backstroke
* 200 m backstroke
* 100 m breaststroke
* 200 m breaststroke
* 100 m butterfly
* 200 m butterfly
* 200 m individual medley
* 400 m individual medley
* 4 × 100 m freestyle relay
* 4 × 200 m freestyle relay
* 4 × 100 m medley relay
* 10 km open water

Facts:

**Fact #1:** 37 events  (18x2 each gender + 1 mixed)

**Fact #2:** Lets say on each competition there is 10 lanes (it's the most commonly used and not 8).

**Fact #3:** There are three rounds (heats, semifinals, and finals) 


$P(singleWin)=(3/10)^2*(1/10)$

$P(wins=>19)=P(wins = 19) + P(wins = 20) + P(wins = 21) + ..  + P(wins = 37)=?$

Lets check gradually, for multiple games:

$P(wins=1)=\dbinom{37}{1}(3/10)^2*(1/10)$

$P(wins=2)=\dbinom{37}{2} ((3/10)^2*(1/10))^2$

$P(wins=3)=\dbinom{37}{3} ((3/10)^2*(1/10))^3$

$P(wins=k)=\dbinom{37}{k} ((3/10)^2*(1/10))^k$

Threfore we can write:

$P(wins=>19)=\dbinom{37}{19} ((3/10)^2*(1/10))^{19} + \dbinom{37}{20} ((3/10)^2*(1/10))^{20}+ ... +\dbinom{37}{37} ((3/10)^2*(1/10))^{37}$


$P(wins=>19)=\sum_{k=19}^{37}\dbinom{37}{k} ((3/10)^2*(1/10))^k$


