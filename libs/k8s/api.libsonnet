local reference_api = {
  core: {
      v1: {
          Binding: import "api/core/v1/binding.libsonnet",
          ComponentStatus: import "api/core/v1/component_status.libsonnet",
          ConfigMap: import "api/core/v1/config_map.libsonnet",
          Container: import "api/core/v1/container.libsonnet",
          Event: import "api/core/v1/event.libsonnet",
          Endpoints: import "api/core/v1/endpoints.libsonnet",
          LimitRange: import "api/core/v1/limit_range.libsonnet",
          Namespace: import "api/core/v1/namespace.libsonnet",
          PersistentVolumeClaim: import "api/core/v1/persistent_volume_claim.libsonnet",
          PersistentVolume: import "api/core/v1/persistent_volume.libsonnet",
          PodTemplate: import "api/core/v1/pod_template.libsonnet",
          Pod: import "api/core/v1/pod.libsonnet",
          ReplicationController: import "api/core/v1/replication_controller.libsonnet",
          Secret: import "api/core/v1/secret.libsonnet",
          Service: import "api/core/v1/service.libsonnet",
          Volume: import "api/core/v1/volume.libsonnet",
      },
  },

    apps: {
        v1beta1: {
        Deployment: import "api/apps/v1beta1/deployment.libsonnet",
        StatefulSet: import "api/apps/v1beta1/stateful_set.libsonnet",
        },
    },

    extensions: {
        v1beta1: {
        DaemonSet: import "api/extensions/v1beta1/daemon_set.libsonnet",
        Ingress: import "api/extensions/v1beta1/ingress.libsonnet",
        NetworkPolicy: import "api/extensions/v1beta1/network_policy.libsonnet",
        PodSecurityPolicy: import "api/extensions/v1beta1/pod_security_policy.libsonnet",
        ReplicaSet: import "api/extensions/v1beta1/replica_set.libsonnet",
        ThirdPartyResource: import "api/extensions/v1beta1/third_party_resource.libsonnet",

        },
    },


};

local flat =
    reference_api.core.v1 +
    reference_api.extensions.v1beta1 +
    reference_api.apps.v1beta1;

local groups = {
    workloads: {
        Container: flat.Container,
        Deployment: flat.Deployment,
        CronJob: null,
        DaemonSet: flat.DaemonSet,
        Job: null,
        Pod: flat.Pod,
        ReplicaSet: flat.ReplicaSet,
        ReplicationController: flat.ReplicationController,
        StatefulSet: flat.StatefulSet,
    },

    loadbalancing: {
        Endpoints: flat.Endpoints,
        Ingress: flat.Ingress,
        service: flat.Service,
    },

    discovery: self.loadbalancing,
    config: {
        ConfigMap: flat.ConfigMap,
        Secret: flat.Secret,
        PersistentVolumeClaim: flat.PersistentVolumeClaim,
        Volume: flat.Volume,
        StorageClass: null
    },
    storage: self.config,
    metadata: {
        LimitRange: flat.LimitRange,
        Event: flat.Event
    },
    cluster: {

    },
};
{
    reference: reference_api,
} + groups  + flat
