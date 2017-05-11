local kubeapi = import "kubeapi.libsonnet";

function(
  params={},
)


local some_other_app = {
    local application = self,
    package: import "Chart.jsonnet",
    variables: (import "values.jsonnet")(params.variables),
    resources: {
      "other-app-svc.json": kubeapi.k8s.service.Create(name="logstash", ports=[5044]),
    }
};

local importDep(dep, patch={}},) = {
    resources+: dep.resources + patch
  };


local app = {
    local application = self,
    package: import "Chart.jsonnet",
    variables: (import "values.jsonnet")(params.variables),
    resources: {
      "logstash-svc.json": {
        content: kubeapi.k8s.service.Create(name="logstash", ports=[5044])
        protected: true
      },
      "logstash-configmap.json": (import "templates/logstash-configmap.jsonnet")(application.variables),
    }
} +
importDep(some_other_app,
     {
      "other-app-svc.json"+: kubeapi.k8s.service.mergePorts([9090])
     }) +
importDep(some_other_app2);


kubeapi.render(app, params)



