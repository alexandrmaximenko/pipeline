#!/bin/bash
set -e

# Create the destination table MergeTree
clickhouse client -n <<-EOSQL
    CREATE TABLE IF NOT EXISTS pipelineData
    (
        timestamp DateTime64(9),
        bid_1 Float32,
        bid_2 Float32,
        bid_3 Float32,
        bid_4 Float32,
        bid_5 Float32,
        bid_6 Float32,
        bid_7 Float32,
        bid_8 Float32,
        bid_9 Float32,
        bid_10 Float32,
        bid_11 Float32,
        bid_12 Float32,
        bid_13 Float32,
        bid_14 Float32,
        bid_15 Float32,
        bid_16 Float32,
        bid_17 Float32,
        bid_18 Float32,
        bid_19 Float32,
        bid_20 Float32,
        bid_21 Float32,
        bid_22 Float32,
        bid_23 Float32,
        bid_24 Float32,
        bid_25 Float32,
        bid_26 Float32,
        bid_27 Float32,
        bid_28 Float32,
        bid_29 Float32,
        bid_30 Float32,
        bid_31 Float32,
        bid_32 Float32,
        bid_33 Float32,
        bid_34 Float32,
        bid_35 Float32,
        bid_36 Float32,
        bid_37 Float32,
        bid_38 Float32,
        bid_39 Float32,
        bid_40 Float32,
        bid_41 Float32,
        bid_42 Float32,
        bid_43 Float32,
        bid_44 Float32,
        bid_45 Float32,
        bid_46 Float32,
        bid_47 Float32,
        bid_48 Float32,
        bid_49 Float32,
        bid_50 Float32,
        ask_1 Float32,
        ask_2 Float32,
        ask_3 Float32,
        ask_4 Float32,
        ask_5 Float32,
        ask_6 Float32,
        ask_7 Float32,
        ask_8 Float32,
        ask_9 Float32,
        ask_10 Float32,
        ask_11 Float32,
        ask_12 Float32,
        ask_13 Float32,
        ask_14 Float32,
        ask_15 Float32,
        ask_16 Float32,
        ask_17 Float32,
        ask_18 Float32,
        ask_19 Float32,
        ask_20 Float32,
        ask_21 Float32,
        ask_22 Float32,
        ask_23 Float32,
        ask_24 Float32,
        ask_25 Float32,
        ask_26 Float32,
        ask_27 Float32,
        ask_28 Float32,
        ask_29 Float32,
        ask_30 Float32,
        ask_31 Float32,
        ask_32 Float32,
        ask_33 Float32,
        ask_34 Float32,
        ask_35 Float32,
        ask_36 Float32,
        ask_37 Float32,
        ask_38 Float32,
        ask_39 Float32,
        ask_40 Float32,
        ask_41 Float32,
        ask_42 Float32,
        ask_43 Float32,
        ask_44 Float32,
        ask_45 Float32,
        ask_46 Float32,
        ask_47 Float32,
        ask_48 Float32,
        ask_49 Float32,
        ask_50 Float32,
        stats Tuple (bid_avg Float32, ask_avg Float32)
    ) ENGINE = MergeTree ORDER BY (timestamp)
EOSQL

# Create the Kafka table engine
clickhouse client -n <<-EOSQL
    CREATE TABLE IF NOT EXISTS default.pipelineData_queue
    (
        timestamp Float64,
        bid_1 Float32,
        bid_2 Float32,
        bid_3 Float32,
        bid_4 Float32,
        bid_5 Float32,
        bid_6 Float32,
        bid_7 Float32,
        bid_8 Float32,
        bid_9 Float32,
        bid_10 Float32,
        bid_11 Float32,
        bid_12 Float32,
        bid_13 Float32,
        bid_14 Float32,
        bid_15 Float32,
        bid_16 Float32,
        bid_17 Float32,
        bid_18 Float32,
        bid_19 Float32,
        bid_20 Float32,
        bid_21 Float32,
        bid_22 Float32,
        bid_23 Float32,
        bid_24 Float32,
        bid_25 Float32,
        bid_26 Float32,
        bid_27 Float32,
        bid_28 Float32,
        bid_29 Float32,
        bid_30 Float32,
        bid_31 Float32,
        bid_32 Float32,
        bid_33 Float32,
        bid_34 Float32,
        bid_35 Float32,
        bid_36 Float32,
        bid_37 Float32,
        bid_38 Float32,
        bid_39 Float32,
        bid_40 Float32,
        bid_41 Float32,
        bid_42 Float32,
        bid_43 Float32,
        bid_44 Float32,
        bid_45 Float32,
        bid_46 Float32,
        bid_47 Float32,
        bid_48 Float32,
        bid_49 Float32,
        bid_50 Float32,
        ask_1 Float32,
        ask_2 Float32,
        ask_3 Float32,
        ask_4 Float32,
        ask_5 Float32,
        ask_6 Float32,
        ask_7 Float32,
        ask_8 Float32,
        ask_9 Float32,
        ask_10 Float32,
        ask_11 Float32,
        ask_12 Float32,
        ask_13 Float32,
        ask_14 Float32,
        ask_15 Float32,
        ask_16 Float32,
        ask_17 Float32,
        ask_18 Float32,
        ask_19 Float32,
        ask_20 Float32,
        ask_21 Float32,
        ask_22 Float32,
        ask_23 Float32,
        ask_24 Float32,
        ask_25 Float32,
        ask_26 Float32,
        ask_27 Float32,
        ask_28 Float32,
        ask_29 Float32,
        ask_30 Float32,
        ask_31 Float32,
        ask_32 Float32,
        ask_33 Float32,
        ask_34 Float32,
        ask_35 Float32,
        ask_36 Float32,
        ask_37 Float32,
        ask_38 Float32,
        ask_39 Float32,
        ask_40 Float32,
        ask_41 Float32,
        ask_42 Float32,
        ask_43 Float32,
        ask_44 Float32,
        ask_45 Float32,
        ask_46 Float32,
        ask_47 Float32,
        ask_48 Float32,
        ask_49 Float32,
        ask_50 Float32,
        stats Tuple (bid_avg Float32, ask_avg Float32)
    )
    ENGINE = Kafka('kafka:9092', 'metrics_raw', 'clickhouse-consumer',
                'JSONEachRow') settings kafka_thread_per_consumer = 0, kafka_num_consumers = 1;
EOSQL

# Create the Kafka table engine
clickhouse client -n <<-EOSQL
    CREATE MATERIALIZED VIEW IF NOT EXISTS default.pipelineData_mv TO default.pipelineData AS
    SELECT *
    FROM default.pipelineData_queue;
EOSQL