# Deep Reinforcement Learning

* The idea behind Reinforcement Learning is that an agent (an AI) will learn from the environment by interacting with it (through trial and error) and receiving rewards (negative or positive) as feedback for performing actions. **Learning from interactions with the environment comes from our natural experiences.**

* Reinforcement learning is a framework for solving control tasks (also called decision problems) by building agents that learn from the environment by interacting with it through trial and error and receiving rewards (positive or negative) as unique feedback.


 **The reward hypothesis: the central idea of Reinforcement Learning**

* Why is the goal of the agent to maximize the expected return?

Because RL is based on the reward hypothesis, which is that all goals can be described as the maximization of the expected return (expected cumulative reward).

That’s why in Reinforcement Learning, to have the best behavior, **we aim to learn to take actions that maximize the expected cumulative reward**.


## **Markov Property**

In papers, you’ll see that the RL process is called a **Markov Decision Process (MDP)**.

We’ll talk again about the Markov Property in the following units. But if you need to remember something today about it, it’s this: the Markov Property implies that **our agent needs only the current state to decide what action to take and not the history of all the states and actions they took before**.

The RL process is a loop that outputs a sequence of state, action, reward and next state.

* To calculate the expected cumulative reward (expected return), we discount the rewards: the rewards that come sooner (at the beginning of the game) are more probable to happen since they are more predictable than the long term future reward.

* To solve an RL problem, you want to find an optimal policy. The policy is the “brain” of your agent, which will tell us what action to take given a state. The optimal policy is the one which gives you the actions that maximize the expected return.

There are two ways to find your optimal policy:

* By training your policy directly: policy-based methods.
* By training a value function that tells us the expected return the agent will get at each state and use this function to define our policy: value-based methods.