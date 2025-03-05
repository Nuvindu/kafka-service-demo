import ballerina/http;
import ballerinax/kafka;

service / on new http:Listener(8082) {
    kafka:Consumer consumer;

    function init() returns error? {
        self.consumer = check new (bootstrapServers, consumerConfig);
    }

    resource function get offsets() returns kafka:PartitionOffset[]|error? {
        return check self.consumer->getEndOffsets([{
            topic: "topic_11",
            partition: 6
        }], 60);
    }
}
