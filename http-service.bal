import ballerina/http;
import ballerinax/kafka;

http:Listener httpListener = check new (9090);

http:Service httpService = service object {

    resource function get offsets() returns kafka:PartitionOffset[]|error? {
        return check kafkaConsumer->getEndOffsets([{
            topic,
            partition: 6
        }], 60);
    }
};
