```
Expose service

oc expose svc el-vote-app
echo "URL: $(oc  get route el-vote-app --template='http://{{.spec.host}}')"
```

```
Empty GIT commit

git commit -m "empty-commit" --allow-empty && git push origin master
```
