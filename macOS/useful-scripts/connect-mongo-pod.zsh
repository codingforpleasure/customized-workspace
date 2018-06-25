#!/bin/zsh
kubectl exec -i $(kubectl get pods -l role=bza -o jsonpath="{.items[0].metadata.name}") -it bash
