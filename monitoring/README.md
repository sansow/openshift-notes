oc create -f prometheus-example-app.yaml
oc expose service  prometheus-example-app -n ns1

oc -n openshift-monitoring create configmap cluster-monitoring-config
oc -n openshift-monitoring edit configmap cluster-monitoring-config
oc -n openshift-user-workload-monitoring get pod

oc create -f example-app-service-monitor.yaml
oc -n ns1 get servicemonitor

oc create -f example-app-alerting-rule.yaml
oc -n ns1 get PrometheusRule

check metrics at `/metrics` endpoint
entry query in dev console `http_requests_total{job="prometheus-example-app"}`
