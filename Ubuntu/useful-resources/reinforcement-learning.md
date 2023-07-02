
- [Deep Reinforcement Learning](#deep-reinforcement-learning)
  - [**Markov Property**](#markov-property)
  - [Glossary](#glossary)
  - [Gymnasium is the new version of Gym library maintained by the Farama Foundation.](#gymnasium-is-the-new-version-of-gym-library-maintained-by-the-farama-foundation)


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


## Glossary

**Agent**

    An agent learns to make decisions by trial and error, with rewards and punishments from the surroundings Environment

An environment is a simulated world where an agent can learn by interacting with it.
Markov Property

It implies that the action taken by our agent is conditional solely on the present state and independent of the past states and actions.
Observations/State

    State: Complete description of the state of the world.
    Observation: Partial description of the state of the environment/world.

**Actions**

    Discrete Actions: Finite number of actions, such as left, right, up, and down.
    Continuous Actions: Infinite possibility of actions; for example, in the case of self-driving cars, the driving scenario has an infinite possibility of actions occurring.

**Rewards and Discounting
**
    Rewards: Fundamental factor in RL. Tells the agent whether the action taken is good/bad.
    RL algorithms are focused on maximizing the cumulative reward.
    Reward Hypothesis: RL problems can be formulated as a maximisation of (cumulative) return.
    Discounting is performed because rewards obtained at the start are more likely to happen as they are more predictable than long-term rewards.

**Tasks**

    Episodic: Has a starting point and an ending point.
    Continuous: Has a starting point but no ending point.

**Exploration v/s Exploitation Trade-Off**

    Exploration: It’s all about exploring the environment by trying random actions and receiving feedback/returns/rewards from the environment.
    Exploitation: It’s about exploiting what we know about the environment to gain maximum rewards.
    Exploration-Exploitation Trade-Off: It balances how much we want to explore the environment and how much we want to exploit what we know about the environment.

**Policy**

    Policy: It is called the agent’s brain. It tells us what action to take, given the state.
    Optimal Policy: Policy that maximizes the expected return when an agent acts according to it. It is learned through training.

**Policy-based Methods:**

    An approach to solving RL problems.
    In this method, the Policy is learned directly.
    Will map each state to the best corresponding action at that state. Or a probability distribution over the set of possible actions at that state.

**Value-based Methods:**

    Another approach to solving RL problems.
    Here, instead of training a policy, we train a value function that maps each state to the expected value of being in that state.


## Gymnasium is the new version of Gym library maintained by the Farama Foundation.

The Gymnasium library provides two things:

* An interface that allows you to create RL environments.
* A collection of environments (gym-control, atari, box2D...).
