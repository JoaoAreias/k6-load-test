#  ------------ Connect ------------
#  This script establishes a secure tunnel to the Minikube cluster,
#  binding it to the localhost address and forwarding Graphana's port.

minikube tunnel --bind-address="127.0.0.1" -c &

export POD_NAME=$(kubectl --namespace default get pod -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=prometheus" -oname)
kubectl --namespace default port-forward $POD_NAME 3000:3000 &

kubectl port-forward svc/prometheus-kube-prometheus-prometheus 9090:9090 &
kubectl port-forward svc/api-service 8080:80
