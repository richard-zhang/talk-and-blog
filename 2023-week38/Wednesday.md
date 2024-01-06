## Message Queue
- Rabbit MQ is a message broker implementing AMQP
- 
## Experimenting with RabbitMQ
1. brew install rabbitmq
2. add queue using [rabbitmqctl and rabbitmqadmin](https://stackoverflow.com/questions/4545660/rabbitmq-creating-queues-and-bindings-from-command-line)
3. round-robin dispatching (worker queue)
4. rabbitmqctl list_queues name messages_ready messages_unacknowledged
5. http://localhost:15672 for the management UI
  1. guest/guest as the default username and password
6. core ideas of amqp:
  1. code generation based on xml
  2. for each xml class definition
    1. generate the type
    2. generate the smart constructor of the type
    3. generate reader and writer for the definiion
    4. the response field will generate a request method
      1. use response field module's read method
      2. use own write method
  3. write method will convert to binary message according to the spec (a list of types)
  4. high-level usage side? how to make use of the generated code
    1. 
