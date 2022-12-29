<!--ts-->
   * [Run Kibana service](#run-kibana-service)
   * [Run Kibana Service](#run-kibana-service-1)
   * [Kibana Status](#kibana-status)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Thu 29 Dec 2022 13:42:10 IST -->

<!--te-->


```bash
```


## Run Kibana service

```bash
sudo systemctl start kibana.service
```

## Run Kibana Service

```bash
sudo systemctl stop kibana.service
```

## Kibana Status

```bash
sudo systemctl status kibana.service
```


Accessing Kibana:
```bash
localhost:5601
```


Server status details:
```bash
localhost:5601/api/status
```

In Kibana:
```bash
GET _search
{
  "query": {
    "match_all": {}
  } , "size": 50
}
```
