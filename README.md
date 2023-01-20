```sh
.
├── Dockerfile              ### Manifest for creating a docker image with a python service
├── LICENSE                 
├── README.md               
├── configs                 ### A set of configurations for clickhouse and grafana
│   ├── clickhouse           
│   │   ├── grafana.xml       
│   │   └── init-db.sh       
│   └── grafana              ## A set of configurations for grafana
│       ├── alerts.json       
│       ├── dashboard.yaml    
│       └── datasource.yaml   
├── docker-compose.yml      ### Manifest for launching containers with all the services
├── requirements.txt        ### Dependencies for python service
└── src                     ### The source code of the service in python
    ├── data_generator.py    
    ├── kafka_sender.py      
    └── main.py              
```