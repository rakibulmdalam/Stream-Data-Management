package de.tum.in.iot;


//import org.apache.flink.api.common.functions.MapFunction;
import org.apache.flink.api.common.functions.RuntimeContext;
import org.apache.flink.streaming.api.datastream.DataStream;
import org.apache.flink.streaming.api.environment.StreamExecutionEnvironment;
import org.apache.flink.streaming.connectors.elasticsearch.ElasticsearchSinkFunction;
import org.apache.flink.streaming.connectors.elasticsearch.RequestIndexer;
import org.apache.flink.streaming.connectors.elasticsearch5.ElasticsearchSink;
//import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer010;
//import org.apache.flink.streaming.util.serialization.SimpleStringSchema;
import org.apache.flink.api.common.serialization.SimpleStringSchema;
import org.apache.flink.streaming.connectors.kafka.FlinkKafkaConsumer011;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.client.Requests;

import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.util.*;

public class Tunnel {

    public static void main(String[] args) {

        final StreamExecutionEnvironment env = StreamExecutionEnvironment.getExecutionEnvironment();

        Properties properties = new Properties();
        properties.setProperty("bootstrap.servers", "localhost:9092");
        properties.setProperty("group.id", "test");

        //FlinkKafkaConsumer010<String> myConsumer = new FlinkKafkaConsumer010<>(
        FlinkKafkaConsumer011<String> myConsumer = new FlinkKafkaConsumer011<>(
                "temperature",
                new SimpleStringSchema(),
                properties);

        DataStream<String> stream = env.addSource(myConsumer);
        Map<String, String> config = new HashMap<>();
        config.put("cluster.name", "elasticsearch");
        // This instructs the sink to emit after every element, otherwise they would be buffered
        config.put("bulk.flush.max.actions", "1");

        List<InetSocketAddress> transportAddresses = new ArrayList<>();
        try {
            transportAddresses.add(new InetSocketAddress(InetAddress.getByName("127.0.0.1"), 9300));
            stream.addSink(new ElasticsearchSink<>(config, transportAddresses, new ElasticsearchSinkFunction<String>() {
                public IndexRequest createIndexRequest(String element) {
                    Map<String, String> json = new HashMap<>();
                    json.put("data", element);

                    return Requests.indexRequest()
                            .index("temperature")
                            .type("test")
                            .source(json);
                }

                @Override
                public void process(String element, RuntimeContext ctx, RequestIndexer indexer) {
                    indexer.add(createIndexRequest(element));
                }
            }));
        } catch (UnknownHostException e) {
            //e.printStackTrace();
            System.out.println(e.toString());
        }
       /* try {
            writeElastic(stream);
        } catch (UnknownHostException e) {
            //e.printStackTrace();
            System.out.println("elastic excpetion occurred");
        }*/

        /*stream.map(new MapFunction<String, String>() {
            private static final long serialVersionUID = -6867736771747690202L;

            @Override
            public String map(String value) {
                return value;
            }
        }).print();*/

        try {
            env.execute();
        } catch (Exception e) {
            //e.printStackTrace();
            System.out.println("env excpetion occurred");
        }
    }
}
