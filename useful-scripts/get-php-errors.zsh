#!bin/zsh

kubectl exec -i $(kubectl get pods -l role=bza -o jsonpath="{.items[0].metadata.name}") -- sh -c "tail -f /var/log/blazemeter/php_errors.log"