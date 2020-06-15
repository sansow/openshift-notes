```
Openshift version: 4.3.0
Kubernetes Version: v1.16.2
```

```
git clone git@github.com:VinayBhalerao/vote-cicd.git

oc new-project vote-cicd
```

```
oc apply -f 02-pipelineresources/
pipelineresource.tekton.dev/vote-api-repo created
pipelineresource.tekton.dev/vote-api-image created
pipelineresource.tekton.dev/vote-ui-repo created
pipelineresource.tekton.dev/vote-ui-image created

tkn resource list

```

```
oc apply -f 03-tasks/
task.tekton.dev/oc-apply-deployment created

tkn tasks list
```

```
oc apply -f 04-pipelines/
pipeline.tekton.dev/build-and-deploy created

tkn pipeline list
```

```
oc apply -f 05-pipelineruns
pipelinerun.tekton.dev/build-deploy-api-pipelinerun created
pipelinerun.tekton.dev/build-deploy-ui-pipelinerun created

tkn pipeline logs -f
```

```
oc get route vote-ui --template='http://{{.spec.host}}'
```
