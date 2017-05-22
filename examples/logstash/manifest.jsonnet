local kubecfg = import "kubecfg.libsonnet";

function(
  params={},
)


kubecfg.render({
    local application = self,
    params: params,
    // metadata import
    package: import "Chart.jsonnet",

    // default parametrized values
    variables: (import "values.jsonnet")(params.variables),

    // resources to deploy
    resources: {
      "logstash-svc.json": kubecfg.k8s.service.Create(name="logstash", ports=[5040]),
       "logstash-configmap.json": (import "templates/logstash-configmap.jsonnet")(application.variables),
    }

}, params)






