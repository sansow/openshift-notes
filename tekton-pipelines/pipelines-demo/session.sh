oc new-project pipelines-tutorial

oc create -f https://raw.githubusercontent.com/openshift/pipelines-tutorial/master/01_pipeline/01_apply_manifest_task.yaml

oc create -f https://raw.githubusercontent.com/openshift/pipelines-tutorial/master/01_pipeline/02_update_deployment_task.yaml

oc create -f https://raw.githubusercontent.com/openshift/pipelines-tutorial/master/01_pipeline/04_pipeline.yaml

tkn task list
tkn pipeline list

oc create -f https://raw.githubusercontent.com/openshift/pipelines-tutorial/master/01_pipeline/03_resources.yaml

tkn resource list

tkn pipeline start build-and-deploy -r git-repo=api-repo -r image=api-image -p deployment-name=vote-api

tkn pipeline start build-and-deploy -r git-repo=ui-repo -r image=ui-image -p deployment-name=vote-ui

oc get route vote-ui --template='http://{{.spec.host}}'
