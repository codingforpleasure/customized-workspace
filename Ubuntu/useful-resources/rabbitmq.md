<!--ts-->
   * [RabbitMQ](#rabbitmq)
      * [RabbitMQ Operations](#rabbitmq-operations)
         * [Publishing a message](#publishing-a-message)
         * [Consuming a message](#consuming-a-message)

<!-- Added by: gil_diy, at: Sat 05 Mar 2022 15:45:10 IST -->

<!--te-->

# RabbitMQ 

Message Broker that implements Advanced Message Queuing Protocol (AMQP)

The entities in an **Advance Message Queuing Protocol** standardizes messaging using Producers, Broker, and Consumers.

* The aim of a **Messaging system** is to **loose coupling** and for **scalabilty**.


**Core concepts**




## RabbitMQ Operations

### Publishing a message

**Producer** sends a message, it uses an **exchange**.
The exchange forwards the message to a queue.

* The producer needs to specify a message with a binding key (routing key)


### Consuming a message

The Consumer picks up a message from a queue and consume it.

An exchange is connected to a queue by a binding key.

# 

[Link](https://youtu.be/deG25y_r6OY)