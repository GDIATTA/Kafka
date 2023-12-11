## 1)Create a topic with 3 partitions 
kafka-topics.sh --command-config playgroud.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic third_topic --create --partitions 3
## Windows
kafka-topics.bat --create --bootstrap-server localhost:9092 --topic third_topic --partitions 3
WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. To avoid issues it is best to use either, but not both.
Created topic third_topic.

## 2) start one consumer
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092
 --topic third_topic --group my-first-application
## Windows
kafka-console-consumer.bat --topic third_topic --bootstrap-server localhost:9092 --group my-first-application

## 3) start one producer and start producing
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092
 --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic third_topic
## Windows
kafka-console-producer.bat --broker-list localhost:9092 --topic third_topic 
--producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner

## 4) Start another consumer part of the same group. See messages being spread
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic third_topic --group my-first-application
## Windows
kafka-console-consumer.bat --topic third_topic --bootstrap-server localhost:9092 --group my-first-application

## 5) Start another consumer part of a different group from beginning
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --topic third_topic --group my-second-application --from-beginning
## Windows
kafka-console-consumer.bat --topic third_topic --bootstrap-server localhost:9092 --group my-second-application 
--from-beginning

## 6)create a topic with 3 partitions 
kafka-topics.sh --command-config playgroud.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic second_topic --create --partitions 3
## Windows
kafka-topics.bat --create --bootstrap-server localhost:9092 --topic second_topic --partitions 3
WARNING: Due to limitations in metric names, topics with a period ('.') or underscore ('_') could collide. To avoid issues it is best to use either, but not both.
Created topic third_topic.

## 7) start one consumer
kafka-console-consumer.sh --consumer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic second_topic --from-beginning
## Windows
kafka-console-consumer.bat --topic third_topic --bootstrap-server localhost:9092 --from-beginning

## 8) start one producer and start producing
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner --topic second_topic
## Windows
kafka-console-producer.bat --broker-list localhost:9092 --topic second_topic --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner

## 9) Display key, values and timestamp in consumer
kafka-console-consumer.bat --topic second_topic --bootstrap-server localhost:9092 
--formatter kafka.tools.DefaultMessageFormatter --property print.timestamp=true --property print.key=true --property print.value=true --property print.partition=true --from-beginning

## 10) create a topic with 1 partition 
kafka-topics.sh --command-config playgroud.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic second_topic --create --partitions 1
## Windows
kafka-topics.bat --create --bootstrap-server localhost:9092 --topic second_topic --partitions 1

## 11) start one producer 
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
 --topic first_topic
## Windows
kafka-console-producer.bat --broker-list localhost:9092 --topic first_topic

## 12) producing with properties 
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092  
--topic first_topic --producer-property acks=all
## Windows
kafka-console-producer.bat --broker-list localhost:9092 --topic first_topic --producer-property acks=all

## 13) producing to a non existing topic 
kafka-console-producer.sh --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092  
--topic new_topic
## Windows
kafka-console-producer.bat --broker-list localhost:9092 --topic new_topic
>hello world
[2023-12-11 10:42:39,548] WARN [Producer clientId=console-producer] Error while fetching metadata with correlation id 4 : {new_topic=LEADER_NOT_AVAILABLE} (org.apache.kafka.clients.NetworkClient)

## 14) Show the list of topic
kafka-topics.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --list
__consumer_offsets
firs_topic
first_topic
new_topic
second_topic
third_topic
## Windows
c:\kafka\bin\windows>kafka-topics.bat --bootstrap-server localhost:9092 --list
__consumer_offsets
firs_topic
first_topic
new_topic
second_topic
third_topic

## 15)Describe the topics
kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --describe
## Windows
c:\kafka\bin\windows>kafka-topics.bat --bootstrap-server localhost:9092 --topic firs_topic --describe
Topic: firs_topic       TopicId: mgrFWAd0RoWyxyKGuxFRhg PartitionCount: 1       ReplicationFactor: 1    Configs:
        Topic: firs_topic       Partition: 0    Leader: 0       Replicas: 0     Isr: 0

## 16) produce with keys
kafka-console-producer --producer.config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic first_topic --property parse.key=true --property key.separator=:
## Windows
c:\kafka\bin\windows>kafka-console-producer --bootstrap-server localhost:9092 --topic firs_topic --property parse.key=true --property key.separator=:
>example key: example value
>name:stephane

## 17)documentation for the command
kafka-consumer-groups.sh
## Windows
kafka-consumer-groups.bat

## 18) list consumer groups
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 --list
## Windows
kafka-consumer-groups.bat --bootstrap-server localhost:9092 --list

## 19) describe one specific group
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--describe --group my-second-application
## Windows
kafka-consumer-groups.bat --bootstrap-server localhost:9092 --describe --group my-second-application

## 20) Dry Run: reset the offsets to the beginning of each partition
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--group my-first-application --reset-offsets --to-earliest --topic third_topic --dry-run
## Windows
kafka-consumer-groups.bat --bootstrap-server localhost:9092 --group my-first-application 
--reset-offsets --to-earliest --topic third_topic --dry-run

## 21) execute flag is needed
kafka-consumer-groups.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--group my-first-application --reset-offsets --to-earliest --topic third_topic --dry-run
## Windows
kafka-consumer-groups.bat --bootstrap-server localhost:9092 --group my-first-application --reset-offsets 
--to-earliest --topic third_topic --execute

## 22) consume from where the offsets have been reset
kafka-console-consumer.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic third_topic --group my-first-application
## Windows
kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic third_topic --group my-first-application

## 23)Describe topics
kafka-topics.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic first_topic --describe
## Windows
kafka-topics.bat --bootstrap-server localhost:9092 --topic first_topic --describe

## 24)Delete topics
kafka-topics.sh --command-config playground.config --bootstrap-server cluster.playground.cdkt.io:9092 
--topic first_topic --delete
## Windows
kafka-topics.bat --bootstrap-server localhost:9092 --topic first_topic --delete


