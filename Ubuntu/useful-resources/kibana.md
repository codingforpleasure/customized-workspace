<!--ts-->


<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 25 Dec 2022 02:25:26 IST -->

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
