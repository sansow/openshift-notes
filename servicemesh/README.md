```Deploying Openshift service mesh on OCP 4.5.4```

```
Install the operators

Goto OperatorHub and install Elasticsearch, Red Hat OpenShift Jaeger, Kiali Operator (provided by Red Hat) and Red Hat OpenShift Service Mesh Operators.
```

```
Deploy Redhat Openshift Servicemesh ControlPlane

Create new project `istio-system`

Under Istio Service Mesh Control Plane, create instance
Create ServiceMeshMemberRoll and add member as bookinfo
```

```
Deploy bookinfo application

oc new-project bookinfo
oc apply -f https://raw.githubusercontent.com/Maistra/istio/maistra-1.2/samples/bookinfo/platform/kube/bookinfo.yaml
oc create -f https://raw.githubusercontent.com/Maistra/istio/maistra-1.2/samples/bookinfo/networking/bookinfo-gateway.yaml
oc get routes -n istio-system istio-ingressgateway

export INGRESS_HOST=<HOST>

for i in {1..20}; do sleep 0.5; curl -I $INGRESS_HOST/productpage; done
```
