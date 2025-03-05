import ballerina/io;
import ballerinax/kafka;

configurable string[] bootstrapServers = ?;
configurable kafka:ConsumerConfiguration consumerConfig = ?;

listener kafka:Listener kafkaListener = new (bootstrapServers, consumerConfig);

kafka:Service kafkaService =  service object {

    remote function onConsumerRecord(kafka:Caller caller, kafka:AnydataConsumerRecord[] students) returns error? {
        io:println(students);
    }
};
