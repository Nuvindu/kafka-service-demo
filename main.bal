import ballerinax/kafka;
import ballerina/lang.runtime;
import ballerina/io;

configurable string topic = ?;
configurable kafka:ProducerConfiguration producerConfig = ?;

type Student record {
    string name;
    string favorite_color;
};

public function main() returns error? {

    check kafkaListener.attach(kafkaService, "/");
    check kafkaListener.'start();
    runtime:registerListener(kafkaListener);

    kafka:Producer kafkaProducer = check new (bootstrapServers, producerConfig);
    Student student = {
        name: "student_name",
        favorite_color: "favourite_colour"
    };

    while true {
        io:println("Publishing data: ", student);
        check kafkaProducer->send({
            topic: topic,
            'key: "key-value",
            value: student
        });
        io:println("Data is published: ", student);
        runtime:sleep(5);
    }

}
