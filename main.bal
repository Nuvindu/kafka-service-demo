import ballerinax/kafka;
import ballerina/io;

configurable string topic = ?;
configurable kafka:ProducerConfiguration producerConfig = ?;
configurable string[] bootstrapServers = ?;
configurable kafka:ConsumerConfiguration consumerConfig = ?;

final kafka:Consumer kafkaConsumer = check new (bootstrapServers, consumerConfig);

public function main() returns error? {
    while true {
        kafka:AnydataConsumerRecord[] result = check kafkaConsumer->poll(10);
        foreach kafka:AnydataConsumerRecord value in result {
            io:println("Event received: ", value);
        }
    }
}
