<!--ts-->
<!--te-->


```bash
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
