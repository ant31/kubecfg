
local utils = import "utils/utils.libsonnet";
local kutils = import "k8s/k8s-utils.libsonnet";

{
    local topSelf = self,
    "io.k8s.kubernetes.pkg.apis.authorization.v1.NonResourceAttributes":: function(path=function(patch){}) {
        _ref: {name: "NonResourceAttributes"},

        Path(value, partial=false):: (
        // Path is the URL path of the request.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Verb(value, partial=false):: (
        // Verb is the standard HTTP verb.
            assert utils.asserts.type(value, 'string', 'verb');
            kutils.mixin({"verb": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EndpointAddress":: function(path=function(patch){}) {
        _ref: {name: "EndpointAddress"},

        ip: null,

        Ip(value, partial=false):: (
        // The IP of this endpoint.
        // May not be loopback (127.0.0.0/8), link-local (169.254.0.0/16), or link-local multicast ((224.0.0.0/24).
        // IPv6 is also accepted but not fully supported on all platforms.
        // Also, certain kubernetes components, like kube-proxy, are not IPv6 ready..
            assert utils.asserts.type(value, 'string', 'ip');
            kutils.mixin({"ip": value}, path, partial)
        ),

        Hostname(value, partial=false):: (
        // The Hostname of this endpoint.
            assert utils.asserts.type(value, 'string', 'hostname');
            kutils.mixin({"hostname": value}, path, partial)
        ),

        NodeName(value, partial=false):: (
        // Optional: Node hosting this endpoint.
        // This can be used to determine endpoints local to a node..
            assert utils.asserts.type(value, 'string', 'nodeName');
            kutils.mixin({"nodeName": value}, path, partial)
        ),

        TargetRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectReference'](function(patch) path({targetRef+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerImage":: function(path=function(patch){}) {
        _ref: {name: "ContainerImage"},

        names: [],

        SizeBytes(value, partial=false):: (
        // The size of the image in bytes..
            assert utils.asserts.type(value, 'integer', 'sizeBytes');
            kutils.mixin({"sizeBytes": value}, path, partial)
        ),

        Names(value, partial=false):: (
        // Names by which this image is known.
        // e.g.
        // ["gcr.io/google_containers/hyperkube:v1.0.7", "dockerhub.io/google_containers/hyperkube:v1.0.7"].
            assert utils.asserts.type(value, 'array', 'names');
            kutils.mixin({"names": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.RollbackConfig":: function(path=function(patch){}) {
        _ref: {name: "RollbackConfig"},

        Revision(value, partial=false):: (
        // The revision to rollback to.
        // If set to 0, rollbck to the last revision..
            assert utils.asserts.type(value, 'integer', 'revision');
            kutils.mixin({"revision": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollingUpdateDeployment":: function(path=function(patch){}) {
        _ref: {name: "RollingUpdateDeployment"},

        MaxSurge::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({maxSurge+: patch})),
        MaxUnavailable::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({maxUnavailable+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.APIResource":: function(path=function(patch){}) {
        _ref: {name: "APIResource"},

        name: null,

        namespaced: null,

        kind: null,

        verbs: [],

        ShortNames(value, partial=false):: (
        // shortNames is a list of suggested short names of the resource..
            assert utils.asserts.type(value, 'array', 'shortNames');
            kutils.mixin({"shortNames": value}, path, partial)
        ),

        Namespaced(value, partial=false):: (
        // namespaced indicates if a resource is namespaced or not..
            assert utils.asserts.type(value, 'boolean', 'namespaced');
            kutils.mixin({"namespaced": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // kind is the kind for the resource (e.g.
        // 'Foo' is the kind for a resource 'foo').
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Verbs(value, partial=false):: (
        // verbs is a list of supported kube verbs (this includes get, list, watch, create, update, patch, delete, deletecollection, and proxy).
            assert utils.asserts.type(value, 'array', 'verbs');
            kutils.mixin({"verbs": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // name is the name of the resource..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.util.intstr.IntOrString":: function(path=function(patch){}) {
        _ref: {name: "IntOrString"},

    },

    "io.k8s.kubernetes.pkg.api.v1.Lifecycle":: function(path=function(patch){}) {
        _ref: {name: "Lifecycle"},

        PreStop::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Handler'](function(patch) path({preStop+: patch})),
        PostStart::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Handler'](function(patch) path({postStart+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.AzureDiskVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "AzureDiskVolumeSource"},

        diskName: null,

        diskURI: null,

        DiskURI(value, partial=false):: (
        // The URI the data disk in the blob storage.
            assert utils.asserts.type(value, 'string', 'diskURI');
            kutils.mixin({"diskURI": value}, path, partial)
        ),

        DiskName(value, partial=false):: (
        // The Name of the data disk in the blob storage.
            assert utils.asserts.type(value, 'string', 'diskName');
            kutils.mixin({"diskName": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        CachingMode(value, partial=false):: (
        // Host Caching mode: None, Read Only, Read Write..
            assert utils.asserts.type(value, 'string', 'cachingMode');
            kutils.mixin({"cachingMode": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSet":: function(path=function(patch){}) {
        _ref: {name: "StatefulSet"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSetStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSetSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.APIVersion":: function(path=function(patch){}) {
        _ref: {name: "APIVersion"},

        Name(value, partial=false):: (
        // Name of this version (e.g.
        // 'v1')..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1.UserInfo":: function(path=function(patch){}) {
        _ref: {name: "UserInfo"},

        Username(value, partial=false):: (
        // The name that uniquely identifies this user among all active users..
            assert utils.asserts.type(value, 'string', 'username');
            kutils.mixin({"username": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // A unique value that identifies this user across time.
        // If this user is deleted and another user by the same name is added, they will have different UIDs..
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

        Groups(value, partial=false):: (
        // The names of groups this user is a part of..
            assert utils.asserts.type(value, 'array', 'groups');
            kutils.mixin({"groups": value}, path, partial)
        ),

        Extra(value, partial=false):: (
        // Any additional information provided by the authenticator..
            assert utils.asserts.type(value, 'object', 'extra');
            kutils.mixin({"extra": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ServiceSpec":: function(path=function(patch){}) {
        _ref: {name: "ServiceSpec"},

        LoadBalancerIP(value, partial=false):: (
        // Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field.
        // This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created.
        // This field will be ignored if the cloud-provider does not support the feature..
            assert utils.asserts.type(value, 'string', 'loadBalancerIP');
            kutils.mixin({"loadBalancerIP": value}, path, partial)
        ),

        DeprecatedPublicIPs(value, partial=false):: (
        // deprecatedPublicIPs is deprecated and replaced by the externalIPs field with almost the exact same semantics.
        // This field is retained in the v1 API for compatibility until at least 8/20/2016.
        // It will be removed from any new API revisions.
        // If both deprecatedPublicIPs *and* externalIPs are set, deprecatedPublicIPs is used..
            assert utils.asserts.type(value, 'array', 'deprecatedPublicIPs');
            kutils.mixin({"deprecatedPublicIPs": value}, path, partial)
        ),

        ExternalIPs(value, partial=false):: (
        // externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.
        // These IPs are not managed by Kubernetes.
        // The user is responsible for ensuring that traffic arrives at a node with this IP.
        // A common example is external load-balancers that are not part of the Kubernetes system.
        // A previous form of this functionality exists as the deprecatedPublicIPs field.
        // When using this field, callers should also clear the deprecatedPublicIPs field..
            assert utils.asserts.type(value, 'array', 'externalIPs');
            kutils.mixin({"externalIPs": value}, path, partial)
        ),

        Selector(value, partial=false):: (
        // Route service traffic to pods with label keys and values matching this selector.
        // If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify.
        // Only applies to types ClusterIP, NodePort, and LoadBalancer.
        // Ignored if type is ExternalName.
        // More info: http://kubernetes.io/docs/user-guide/services#overview.
            assert utils.asserts.type(value, 'object', 'selector');
            kutils.mixin({"selector": value}, path, partial)
        ),

        ExternalName(value, partial=false):: (
        // externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service.
        // No proxying will be involved.
        // Must be a valid DNS name and requires Type to be ExternalName..
            assert utils.asserts.type(value, 'string', 'externalName');
            kutils.mixin({"externalName": value}, path, partial)
        ),

        SessionAffinity(value, partial=false):: (
        // Supports "ClientIP" and "None".
        // Used to maintain session affinity.
        // Enable client IP based session affinity.
        // Must be ClientIP or None.
        // Defaults to None.
        // More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies.
            assert utils.asserts.type(value, 'string', 'sessionAffinity');
            kutils.mixin({"sessionAffinity": value}, path, partial)
        ),

        ClusterIP(value, partial=false):: (
        // clusterIP is the IP address of the service and is usually assigned randomly by the master.
        // If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail.
        // This field can not be changed through updates.
        // Valid values are "None", empty string (""), or a valid IP address.
        // "None" can be specified for headless services when proxying is not required.
        // Only applies to types ClusterIP, NodePort, and LoadBalancer.
        // Ignored if type is ExternalName.
        // More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies.
            assert utils.asserts.type(value, 'string', 'clusterIP');
            kutils.mixin({"clusterIP": value}, path, partial)
        ),

        LoadBalancerSourceRanges(value, partial=false):: (
        // If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs.
        // This field will be ignored if the cloud-provider does not support the feature." More info: http://kubernetes.io/docs/user-guide/services-firewalls.
            assert utils.asserts.type(value, 'array', 'loadBalancerSourceRanges');
            kutils.mixin({"loadBalancerSourceRanges": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // type determines how the Service is exposed.
        // Defaults to ClusterIP.
        // Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer.
        // "ExternalName" maps to the specified externalName.
        // "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints.
        // Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object.
        // If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP.
        // "NodePort" builds on ClusterIP and allocates a port on every node which routes to the clusterIP.
        // "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP.
        // More info: http://kubernetes.io/docs/user-guide/services#overview.
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Ports::
        setPorts(value, partial=false):: (
        // The list of ports that are exposed by this service.
        // More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies.
            assert utils.asserts.type(value, 'array', 'ports');
            kutils.mixin({"ports": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.Deployment":: function(path=function(patch){}) {
        _ref: {name: "Deployment"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions":: function(path=function(patch){}) {
        _ref: {name: "DeleteOptions"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        OrphanDependents(value, partial=false):: (
        // Deprecated: please use the PropagationPolicy, this field will be deprecated in 1.7.
        // Should the dependent objects be orphaned.
        // If true/false, the "orphan" finalizer will be added to/removed from the object's finalizers list.
        // Either this field or PropagationPolicy may be set, but not both..
            assert utils.asserts.type(value, 'boolean', 'orphanDependents');
            kutils.mixin({"orphanDependents": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        GracePeriodSeconds(value, partial=false):: (
        // The duration in seconds before the object should be deleted.
        // Value must be non-negative integer.
        // The value zero indicates delete immediately.
        // If this value is nil, the default grace period for the specified type will be used.
        // Defaults to a per object value if not specified.
        // zero means delete immediately..
            assert utils.asserts.type(value, 'integer', 'gracePeriodSeconds');
            kutils.mixin({"gracePeriodSeconds": value}, path, partial)
        ),

        PropagationPolicy(value, partial=false):: (
        // Whether and how garbage collection will be performed.
        // Either this field or OrphanDependents may be set, but not both.
        // The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy..
            assert utils.asserts.type(value, 'string', 'propagationPolicy');
            kutils.mixin({"propagationPolicy": value}, path, partial)
        ),

        Preconditions::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Preconditions'](function(patch) path({preconditions+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMapList":: function(path=function(patch){}) {
        _ref: {name: "ConfigMapList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of ConfigMaps..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v1.JobSpec":: function(path=function(patch){}) {
        _ref: {name: "JobSpec"},

        template: null,

        Completions(value, partial=false):: (
        // Completions specifies the desired number of successfully finished pods the job should be run with.
        // Setting to nil means that the success of any pod signals the success of all pods, and allows parallelism to have any positive value.
        // Setting to 1 means that parallelism is limited to 1 and the success of that pod signals the success of the job.
        // More info: http://kubernetes.io/docs/user-guide/jobs.
            assert utils.asserts.type(value, 'integer', 'completions');
            kutils.mixin({"completions": value}, path, partial)
        ),

        ManualSelector(value, partial=false):: (
        // ManualSelector controls generation of pod labels and pod selectors.
        // Leave `manualSelector` unset unless you are certain what you are doing.
        // When false or unset, the system pick labels unique to this job and appends those labels to the pod template.
        // When true, the user is responsible for picking unique labels and specifying the selector.
        // Failure to pick a unique label may cause this and other jobs to not function correctly.
        // However, You may see `manualSelector=true` in jobs that were created with the old `extensions/v1beta1` API.
        // More info: http://releases.k8s.io/HEAD/docs/design/selector-generation.md.
            assert utils.asserts.type(value, 'boolean', 'manualSelector');
            kutils.mixin({"manualSelector": value}, path, partial)
        ),

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        ActiveDeadlineSeconds(value, partial=false):: (
        // Optional duration in seconds relative to the startTime that the job may be active before the system tries to terminate it; value must be positive integer.
            assert utils.asserts.type(value, 'integer', 'activeDeadlineSeconds');
            kutils.mixin({"activeDeadlineSeconds": value}, path, partial)
        ),

        Parallelism(value, partial=false):: (
        // Parallelism specifies the maximum desired number of pods the job should run at any given time.
        // The actual number of pods running in steady state will be less than this number when ((.spec.completions - .status.successful) < .spec.parallelism), i.e.
        // when the work left to do is less than max parallelism.
        // More info: http://kubernetes.io/docs/user-guide/jobs.
            assert utils.asserts.type(value, 'integer', 'parallelism');
            kutils.mixin({"parallelism": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentCondition":: function(path=function(patch){}) {
        _ref: {name: "DeploymentCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        LastUpdateTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastUpdateTime+: patch})),
        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // The reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human readable message indicating details about the transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of deployment condition..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerStateWaiting":: function(path=function(patch){}) {
        _ref: {name: "ContainerStateWaiting"},

        Message(value, partial=false):: (
        // Message regarding why the container is not yet running..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // (brief) reason the container is not yet running..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.ClusterRole":: function(path=function(patch){}) {
        _ref: {name: "ClusterRole"},

        rules: [],

        Rules(value, partial=false):: (
        // Rules holds all the PolicyRules for this ClusterRole.
            assert utils.asserts.type(value, 'array', 'rules');
            kutils.mixin({"rules": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.LocalObjectReference":: function(path=function(patch){}) {
        _ref: {name: "LocalObjectReference"},

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMapProjection":: function(path=function(patch){}) {
        _ref: {name: "ConfigMapProjection"},

        Items(value, partial=false):: (
        // If unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value.
        // If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present.
        // If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional.
        // Paths must be relative and may not contain the '..' path or start with '..'..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Optional(value, partial=false):: (
        // Specify whether the ConfigMap or it's keys must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EndpointsList":: function(path=function(patch){}) {
        _ref: {name: "EndpointsList"},

        items: [],

        Items(value, partial=false):: (
        // List of endpoints..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJobStatus":: function(path=function(patch){}) {
        _ref: {name: "CronJobStatus"},

        Active(value, partial=false):: (
        // Active holds pointers to currently running jobs..
            assert utils.asserts.type(value, 'array', 'active');
            kutils.mixin({"active": value}, path, partial)
        ),

        LastScheduleTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastScheduleTime+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.DownwardAPIProjection":: function(path=function(patch){}) {
        _ref: {name: "DownwardAPIProjection"},

        Items(value, partial=false):: (
        // Items is a list of DownwardAPIVolume file.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.PolicyRule":: function(path=function(patch){}) {
        _ref: {name: "PolicyRule"},

        verbs: [],

        ApiGroups(value, partial=false):: (
        // APIGroups is the name of the APIGroup that contains the resources.
        // If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed..
            assert utils.asserts.type(value, 'array', 'apiGroups');
            kutils.mixin({"apiGroups": value}, path, partial)
        ),

        Verbs(value, partial=false):: (
        // Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.
        // VerbAll represents all kinds..
            assert utils.asserts.type(value, 'array', 'verbs');
            kutils.mixin({"verbs": value}, path, partial)
        ),

        NonResourceURLs(value, partial=false):: (
        // NonResourceURLs is a set of partial urls that a user should have access to.
        // *s are allowed, but only as the full, final step in the path This name is intentionally different than the internal type so that the DefaultConvert works nicely and because the ordering may be different.
        // Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding.
        // Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both..
            assert utils.asserts.type(value, 'array', 'nonResourceURLs');
            kutils.mixin({"nonResourceURLs": value}, path, partial)
        ),

        Resources(value, partial=false):: (
        // Resources is a list of resources this rule applies to.
        // ResourceAll represents all resources..
            assert utils.asserts.type(value, 'array', 'resources');
            kutils.mixin({"resources": value}, path, partial)
        ),

        ResourceNames(value, partial=false):: (
        // ResourceNames is an optional white list of names that the rule applies to.
        // An empty set means that everything is allowed..
            assert utils.asserts.type(value, 'array', 'resourceNames');
            kutils.mixin({"resourceNames": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ResourceMetricStatus":: function(path=function(patch){}) {
        _ref: {name: "ResourceMetricStatus"},

        name: null,

        currentAverageValue: null,

        CurrentAverageValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({currentAverageValue+: patch})),
        CurrentAverageUtilization(value, partial=false):: (
        // currentAverageUtilization is the current value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods.
        // It will only be present if `targetAverageValue` was set in the corresponding metric specification..
            assert utils.asserts.type(value, 'integer', 'currentAverageUtilization');
            kutils.mixin({"currentAverageUtilization": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // name is the name of the resource in question..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.QuobyteVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "QuobyteVolumeSource"},

        registry: null,

        volume: null,

        Volume(value, partial=false):: (
        // Volume is a string that references an already created Quobyte volume by name..
            assert utils.asserts.type(value, 'string', 'volume');
            kutils.mixin({"volume": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the Quobyte volume to be mounted with read-only permissions.
        // Defaults to false..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Group(value, partial=false):: (
        // Group to map volume access to Default is no group.
            assert utils.asserts.type(value, 'string', 'group');
            kutils.mixin({"group": value}, path, partial)
        ),

        Registry(value, partial=false):: (
        // Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes.
            assert utils.asserts.type(value, 'string', 'registry');
            kutils.mixin({"registry": value}, path, partial)
        ),

        User(value, partial=false):: (
        // User to map volume access to Defaults to serivceaccount user.
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.SELinuxOptions":: function(path=function(patch){}) {
        _ref: {name: "SELinuxOptions"},

        Type(value, partial=false):: (
        // Type is a SELinux type label that applies to the container..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Role(value, partial=false):: (
        // Role is a SELinux role label that applies to the container..
            assert utils.asserts.type(value, 'string', 'role');
            kutils.mixin({"role": value}, path, partial)
        ),

        User(value, partial=false):: (
        // User is a SELinux user label that applies to the container..
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

        Level(value, partial=false):: (
        // Level is SELinux level label that applies to the container..
            assert utils.asserts.type(value, 'string', 'level');
            kutils.mixin({"level": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscaler":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscaler"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscalerStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscalerSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ThirdPartyResource":: function(path=function(patch){}) {
        _ref: {name: "ThirdPartyResource"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Versions(value, partial=false):: (
        // Versions are versions for this third party object.
            assert utils.asserts.type(value, 'array', 'versions');
            kutils.mixin({"versions": value}, path, partial)
        ),

        Description(value, partial=false):: (
        // Description is the description of this object..
            assert utils.asserts.type(value, 'string', 'description');
            kutils.mixin({"description": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RunAsUserStrategyOptions":: function(path=function(patch){}) {
        _ref: {name: "RunAsUserStrategyOptions"},

        rule: null,

        Ranges(value, partial=false):: (
        // Ranges are the allowed ranges of uids that may be used..
            assert utils.asserts.type(value, 'array', 'ranges');
            kutils.mixin({"ranges": value}, path, partial)
        ),

        Rule(value, partial=false):: (
        // Rule is the strategy that will dictate the allowable RunAsUser values that may be set..
            assert utils.asserts.type(value, 'string', 'rule');
            kutils.mixin({"rule": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceRequirements":: function(path=function(patch){}) {
        _ref: {name: "ResourceRequirements"},

        Requests(value, partial=false):: (
        // Requests describes the minimum amount of compute resources required.
        // If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value.
        // More info: http://kubernetes.io/docs/user-guide/compute-resources/.
            assert utils.asserts.type(value, 'object', 'requests');
            kutils.mixin({"requests": value}, path, partial)
        ),

        Limits(value, partial=false):: (
        // Limits describes the maximum amount of compute resources allowed.
        // More info: http://kubernetes.io/docs/user-guide/compute-resources/.
            assert utils.asserts.type(value, 'object', 'limits');
            kutils.mixin({"limits": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolume":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolume"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PersistentVolumeStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PersistentVolumeSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.APIResourceList":: function(path=function(patch){}) {
        _ref: {name: "APIResourceList"},

        groupVersion: null,

        resources: [],

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        GroupVersion(value, partial=false):: (
        // groupVersion is the group and version this APIResourceList is for..
            assert utils.asserts.type(value, 'string', 'groupVersion');
            kutils.mixin({"groupVersion": value}, path, partial)
        ),

        Resources(value, partial=false):: (
        // resources contains the name of the resources and if they are namespaced..
            assert utils.asserts.type(value, 'array', 'resources');
            kutils.mixin({"resources": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ScaleIOVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "ScaleIOVolumeSource"},

        gateway: null,

        system: null,

        secretRef: null,

        StorageMode(value, partial=false):: (
        // Indicates whether the storage for a volume should be thick or thin (defaults to "thin")..
            assert utils.asserts.type(value, 'string', 'storageMode');
            kutils.mixin({"storageMode": value}, path, partial)
        ),

        SecretRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LocalObjectReference'](function(patch) path({secretRef+: patch})),
        ProtectionDomain(value, partial=false):: (
        // The name of the Protection Domain for the configured storage (defaults to "default")..
            assert utils.asserts.type(value, 'string', 'protectionDomain');
            kutils.mixin({"protectionDomain": value}, path, partial)
        ),

        VolumeName(value, partial=false):: (
        // The name of a volume already created in the ScaleIO system that is associated with this volume source..
            assert utils.asserts.type(value, 'string', 'volumeName');
            kutils.mixin({"volumeName": value}, path, partial)
        ),

        SslEnabled(value, partial=false):: (
        // Flag to enable/disable SSL communication with Gateway, default false.
            assert utils.asserts.type(value, 'boolean', 'sslEnabled');
            kutils.mixin({"sslEnabled": value}, path, partial)
        ),

        System(value, partial=false):: (
        // The name of the storage system as configured in ScaleIO..
            assert utils.asserts.type(value, 'string', 'system');
            kutils.mixin({"system": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        StoragePool(value, partial=false):: (
        // The Storage Pool associated with the protection domain (defaults to "default")..
            assert utils.asserts.type(value, 'string', 'storagePool');
            kutils.mixin({"storagePool": value}, path, partial)
        ),

        Gateway(value, partial=false):: (
        // The host address of the ScaleIO API Gateway..
            assert utils.asserts.type(value, 'string', 'gateway');
            kutils.mixin({"gateway": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.DaemonEndpoint":: function(path=function(patch){}) {
        _ref: {name: "DaemonEndpoint"},

        Port: null,

        setPort(value, partial=false):: (
        // Port number of the given endpoint..
            assert utils.asserts.type(value, 'integer', 'Port');
            kutils.mixin({"Port": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.MetricSpec":: function(path=function(patch){}) {
        _ref: {name: "MetricSpec"},

        type: null,

        Resource::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ResourceMetricSource'](function(patch) path({resource+: patch})),
        Object::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ObjectMetricSource'](function(patch) path({object+: patch})),
        Pods::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.PodsMetricSource'](function(patch) path({pods+: patch})),
        Type(value, partial=false):: (
        // type is the type of metric source.
        // It should match one of the fields below..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ReplicationControllerList":: function(path=function(patch){}) {
        _ref: {name: "ReplicationControllerList"},

        items: [],

        Items(value, partial=false):: (
        // List of replication controllers.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressTLS":: function(path=function(patch){}) {
        _ref: {name: "IngressTLS"},

        Hosts(value, partial=false):: (
        // Hosts are a list of hosts included in the TLS certificate.
        // The values in this list must match the name/s used in the tlsSecret.
        // Defaults to the wildcard host setting for the loadbalancer controller fulfilling this Ingress, if left unspecified..
            assert utils.asserts.type(value, 'array', 'hosts');
            kutils.mixin({"hosts": value}, path, partial)
        ),

        SecretName(value, partial=false):: (
        // SecretName is the name of the secret used to terminate SSL traffic on 443.
        // Field is left optional to allow SSL routing based on SNI hostname alone.
        // If the SNI host in a listener conflicts with the "Host" header field used by an IngressRule, the SNI host is used for termination and value of the Host header is used for routing..
            assert utils.asserts.type(value, 'string', 'secretName');
            kutils.mixin({"secretName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ScaleSpec":: function(path=function(patch){}) {
        _ref: {name: "ScaleSpec"},

        Replicas(value, partial=false):: (
        // desired number of instances for the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ObjectMetricSource":: function(path=function(patch){}) {
        _ref: {name: "ObjectMetricSource"},

        target: null,

        metricName: null,

        targetValue: null,

        TargetValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({targetValue+: patch})),
        Target::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.CrossVersionObjectReference'](function(patch) path({target+: patch})),
        MetricName(value, partial=false):: (
        // metricName is the name of the metric in question..
            assert utils.asserts.type(value, 'string', 'metricName');
            kutils.mixin({"metricName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.FlockerVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "FlockerVolumeSource"},

        DatasetName(value, partial=false):: (
        // Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated.
            assert utils.asserts.type(value, 'string', 'datasetName');
            kutils.mixin({"datasetName": value}, path, partial)
        ),

        DatasetUUID(value, partial=false):: (
        // UUID of the dataset.
        // This is unique identifier of a Flocker dataset.
            assert utils.asserts.type(value, 'string', 'datasetUUID');
            kutils.mixin({"datasetUUID": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscalerStatus":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerStatus"},

        currentReplicas: null,

        desiredReplicas: null,

        ObservedGeneration(value, partial=false):: (
        // most recent generation observed by this autoscaler..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        CurrentReplicas(value, partial=false):: (
        // current number of replicas of pods managed by this autoscaler..
            assert utils.asserts.type(value, 'integer', 'currentReplicas');
            kutils.mixin({"currentReplicas": value}, path, partial)
        ),

        LastScaleTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastScaleTime+: patch})),
        DesiredReplicas(value, partial=false):: (
        // desired number of replicas of pods managed by this autoscaler..
            assert utils.asserts.type(value, 'integer', 'desiredReplicas');
            kutils.mixin({"desiredReplicas": value}, path, partial)
        ),

        CurrentCPUUtilizationPercentage(value, partial=false):: (
        // current average CPU utilization over all pods, represented as a percentage of requested CPU, e.g.
        // 70 means that an average pod is using now 70% of its requested CPU..
            assert utils.asserts.type(value, 'integer', 'currentCPUUtilizationPercentage');
            kutils.mixin({"currentCPUUtilizationPercentage": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.CrossVersionObjectReference":: function(path=function(patch){}) {
        _ref: {name: "CrossVersionObjectReference"},

        kind: null,

        name: null,

        Kind(value, partial=false):: (
        // Kind of the referent; More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds".
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // API version of the referent.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentStatus":: function(path=function(patch){}) {
        _ref: {name: "DeploymentStatus"},

        Replicas(value, partial=false):: (
        // Total number of non-terminated pods targeted by this deployment (their labels match the selector)..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // The generation observed by the deployment controller..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        UpdatedReplicas(value, partial=false):: (
        // Total number of non-terminated pods targeted by this deployment that have the desired template spec..
            assert utils.asserts.type(value, 'integer', 'updatedReplicas');
            kutils.mixin({"updatedReplicas": value}, path, partial)
        ),

        AvailableReplicas(value, partial=false):: (
        // Total number of available pods (ready for at least minReadySeconds) targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'availableReplicas');
            kutils.mixin({"availableReplicas": value}, path, partial)
        ),

        UnavailableReplicas(value, partial=false):: (
        // Total number of unavailable pods targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'unavailableReplicas');
            kutils.mixin({"unavailableReplicas": value}, path, partial)
        ),

        ReadyReplicas(value, partial=false):: (
        // Total number of ready pods targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'readyReplicas');
            kutils.mixin({"readyReplicas": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Represents the latest available observations of a deployment's current state..
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudgetList":: function(path=function(patch){}) {
        _ref: {name: "PodDisruptionBudgetList"},

        items: [],

        Items(value, partial=false):: (
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentStrategy":: function(path=function(patch){}) {
        _ref: {name: "DeploymentStrategy"},

        RollingUpdate::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollingUpdateDeployment'](function(patch) path({rollingUpdate+: patch})),
        Type(value, partial=false):: (
        // Type of deployment.
        // Can be "Recreate" or "RollingUpdate".
        // Default is RollingUpdate..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerStatus":: function(path=function(patch){}) {
        _ref: {name: "ContainerStatus"},

        name: null,

        ready: null,

        restartCount: null,

        image: null,

        imageID: null,

        RestartCount(value, partial=false):: (
        // The number of times the container has been restarted, currently based on the number of dead containers that have not yet been removed.
        // Note that this is calculated from dead containers.
        // But those containers are subject to garbage collection.
        // This value will get capped at 5 by GC..
            assert utils.asserts.type(value, 'integer', 'restartCount');
            kutils.mixin({"restartCount": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // This must be a DNS_LABEL.
        // Each container in a pod must have a unique name.
        // Cannot be updated..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Image(value, partial=false):: (
        // The image the container is running.
        // More info: http://kubernetes.io/docs/user-guide/images.
            assert utils.asserts.type(value, 'string', 'image');
            kutils.mixin({"image": value}, path, partial)
        ),

        ImageID(value, partial=false):: (
        // ImageID of the container's image..
            assert utils.asserts.type(value, 'string', 'imageID');
            kutils.mixin({"imageID": value}, path, partial)
        ),

        State::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ContainerState'](function(patch) path({state+: patch})),
        Ready(value, partial=false):: (
        // Specifies whether the container has passed its readiness probe..
            assert utils.asserts.type(value, 'boolean', 'ready');
            kutils.mixin({"ready": value}, path, partial)
        ),

        LastState::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ContainerState'](function(patch) path({lastState+: patch})),
        ContainerID(value, partial=false):: (
        // Container's ID in the format 'docker://<container_id>'.
        // More info: http://kubernetes.io/docs/user-guide/container-environment#container-information.
            assert utils.asserts.type(value, 'string', 'containerID');
            kutils.mixin({"containerID": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ResourceMetricSource":: function(path=function(patch){}) {
        _ref: {name: "ResourceMetricSource"},

        name: null,

        TargetAverageUtilization(value, partial=false):: (
        // targetAverageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods..
            assert utils.asserts.type(value, 'integer', 'targetAverageUtilization');
            kutils.mixin({"targetAverageUtilization": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // name is the name of the resource in question..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        TargetAverageValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({targetAverageValue+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ComponentStatus":: function(path=function(patch){}) {
        _ref: {name: "ComponentStatus"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // List of component conditions observed.
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.WeightedPodAffinityTerm":: function(path=function(patch){}) {
        _ref: {name: "WeightedPodAffinityTerm"},

        weight: null,

        podAffinityTerm: null,

        PodAffinityTerm::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodAffinityTerm'](function(patch) path({podAffinityTerm+: patch})),
        Weight(value, partial=false):: (
        // weight associated with matching the corresponding podAffinityTerm, in the range 1-100..
            assert utils.asserts.type(value, 'integer', 'weight');
            kutils.mixin({"weight": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1beta1.UserInfo":: function(path=function(patch){}) {
        _ref: {name: "UserInfo"},

        Username(value, partial=false):: (
        // The name that uniquely identifies this user among all active users..
            assert utils.asserts.type(value, 'string', 'username');
            kutils.mixin({"username": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // A unique value that identifies this user across time.
        // If this user is deleted and another user by the same name is added, they will have different UIDs..
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

        Groups(value, partial=false):: (
        // The names of groups this user is a part of..
            assert utils.asserts.type(value, 'array', 'groups');
            kutils.mixin({"groups": value}, path, partial)
        ),

        Extra(value, partial=false):: (
        // Any additional information provided by the authenticator..
            assert utils.asserts.type(value, 'object', 'extra');
            kutils.mixin({"extra": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeList":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeList"},

        items: [],

        Items(value, partial=false):: (
        // List of persistent volumes.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.ServerAddressByClientCIDR":: function(path=function(patch){}) {
        _ref: {name: "ServerAddressByClientCIDR"},

        clientCIDR: null,

        serverAddress: null,

        ClientCIDR(value, partial=false):: (
        // The CIDR with which clients can match their IP to figure out the server address that they should use..
            assert utils.asserts.type(value, 'string', 'clientCIDR');
            kutils.mixin({"clientCIDR": value}, path, partial)
        ),

        ServerAddress(value, partial=false):: (
        // Address of this server, suitable for a client that matches the above CIDR.
        // This can be a hostname, hostname:port, IP or IP:port..
            assert utils.asserts.type(value, 'string', 'serverAddress');
            kutils.mixin({"serverAddress": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.Role":: function(path=function(patch){}) {
        _ref: {name: "Role"},

        rules: [],

        Rules(value, partial=false):: (
        // Rules holds all the PolicyRules for this Role.
            assert utils.asserts.type(value, 'array', 'rules');
            kutils.mixin({"rules": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.ScaleSpec":: function(path=function(patch){}) {
        _ref: {name: "ScaleSpec"},

        Replicas(value, partial=false):: (
        // desired number of instances for the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.StatusCause":: function(path=function(patch){}) {
        _ref: {name: "StatusCause"},

        Field(value, partial=false):: (
        // The field of the resource that has caused this error, as named by its JSON serialization.
        // May include dot and postfix notation for nested attributes.
        // Arrays are zero-indexed.
        // Fields may appear more than once in an array of causes due to fields having multiple errors.
        // Optional.Examples:  "name" - the field "name" on the current resource  "items[0].name" - the field "name" on the first array entry in "items".
            assert utils.asserts.type(value, 'string', 'field');
            kutils.mixin({"field": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human-readable description of the cause of the error.
        // This field may be presented as-is to a reader..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // A machine-readable description of the cause of the error.
        // If this value is empty there is no information available..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSet":: function(path=function(patch){}) {
        _ref: {name: "DaemonSet"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentSpec":: function(path=function(patch){}) {
        _ref: {name: "DeploymentSpec"},

        template: null,

        Replicas(value, partial=false):: (
        // Number of desired pods.
        // This is a pointer to distinguish between explicit zero and not specified.
        // Defaults to 1..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        Paused(value, partial=false):: (
        // Indicates that the deployment is paused and will not be processed by the deployment controller..
            assert utils.asserts.type(value, 'boolean', 'paused');
            kutils.mixin({"paused": value}, path, partial)
        ),

        Strategy::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentStrategy'](function(patch) path({strategy+: patch})),
        RollbackTo::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollbackConfig'](function(patch) path({rollbackTo+: patch})),
        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        RevisionHistoryLimit(value, partial=false):: (
        // The number of old ReplicaSets to retain to allow rollback.
        // This is a pointer to distinguish between explicit zero and not specified..
            assert utils.asserts.type(value, 'integer', 'revisionHistoryLimit');
            kutils.mixin({"revisionHistoryLimit": value}, path, partial)
        ),

        ProgressDeadlineSeconds(value, partial=false):: (
        // The maximum time in seconds for a deployment to make progress before it is considered to be failed.
        // The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status.
        // Once autoRollback is implemented, the deployment controller will automatically rollback failed deployments.
        // Note that progress will not be estimated during the time a deployment is paused.
        // This is not set by default..
            assert utils.asserts.type(value, 'integer', 'progressDeadlineSeconds');
            kutils.mixin({"progressDeadlineSeconds": value}, path, partial)
        ),

        MinReadySeconds(value, partial=false):: (
        // Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available.
        // Defaults to 0 (pod will be considered available as soon as it is ready).
            assert utils.asserts.type(value, 'integer', 'minReadySeconds');
            kutils.mixin({"minReadySeconds": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.NonResourceAttributes":: function(path=function(patch){}) {
        _ref: {name: "NonResourceAttributes"},

        Path(value, partial=false):: (
        // Path is the URL path of the request.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Verb(value, partial=false):: (
        // Verb is the standard HTTP verb.
            assert utils.asserts.type(value, 'string', 'verb');
            kutils.mixin({"verb": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PodSecurityContext":: function(path=function(patch){}) {
        _ref: {name: "PodSecurityContext"},

        RunAsNonRoot(value, partial=false):: (
        // Indicates that the container must run as a non-root user.
        // If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does.
        // If unset or false, no such validation will be performed.
        // May also be set in SecurityContext.
        // If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence..
            assert utils.asserts.type(value, 'boolean', 'runAsNonRoot');
            kutils.mixin({"runAsNonRoot": value}, path, partial)
        ),

        FsGroup(value, partial=false):: (
        // A special supplemental group that applies to all containers in a pod.
        // Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod:1.
        // The owning GID will be the FSGroup 2.
        // The setgid bit is set (new files created in the volume will be owned by FSGroup) 3.
        // The permission bits are OR'd with rw-rw----If unset, the Kubelet will not modify the ownership and permissions of any volume..
            assert utils.asserts.type(value, 'integer', 'fsGroup');
            kutils.mixin({"fsGroup": value}, path, partial)
        ),

        SeLinuxOptions::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SELinuxOptions'](function(patch) path({seLinuxOptions+: patch})),
        SupplementalGroups(value, partial=false):: (
        // A list of groups applied to the first process run in each container, in addition to the container's primary GID.
        // If unspecified, no groups will be added to any container..
            assert utils.asserts.type(value, 'array', 'supplementalGroups');
            kutils.mixin({"supplementalGroups": value}, path, partial)
        ),

        RunAsUser(value, partial=false):: (
        // The UID to run the entrypoint of the container process.
        // Defaults to user specified in image metadata if unspecified.
        // May also be set in SecurityContext.
        // If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container..
            assert utils.asserts.type(value, 'integer', 'runAsUser');
            kutils.mixin({"runAsUser": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ComponentStatusList":: function(path=function(patch){}) {
        _ref: {name: "ComponentStatusList"},

        items: [],

        Items(value, partial=false):: (
        // List of ComponentStatus objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.Subject":: function(path=function(patch){}) {
        _ref: {name: "Subject"},

        kind: null,

        name: null,

        Kind(value, partial=false):: (
        // Kind of object being referenced.
        // Values defined by this API group are "User", "Group", and "ServiceAccount".
        // If the Authorizer does not recognized the kind value, the Authorizer should report an error..
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace of the referenced object.
        // If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error..
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the object being referenced..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion holds the API group and version of the referenced subject.
        // Defaults to "v1" for ServiceAccount subjects.
        // Defaults to "rbac.authorization.k8s.io/v1alpha1" for User and Group subjects..
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector":: function(path=function(patch){}) {
        _ref: {name: "LabelSelector"},

        MatchLabels(value, partial=false):: (
        // matchLabels is a map of {key,value} pairs.
        // A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value".
        // The requirements are ANDed..
            assert utils.asserts.type(value, 'object', 'matchLabels');
            kutils.mixin({"matchLabels": value}, path, partial)
        ),

        MatchExpressions(value, partial=false):: (
        // matchExpressions is a list of label selector requirements.
        // The requirements are ANDed..
            assert utils.asserts.type(value, 'array', 'matchExpressions');
            kutils.mixin({"matchExpressions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.Ingress":: function(path=function(patch){}) {
        _ref: {name: "Ingress"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeAddress":: function(path=function(patch){}) {
        _ref: {name: "NodeAddress"},

        type: null,

        address: null,

        Type(value, partial=false):: (
        // Node address type, one of Hostname, ExternalIP or InternalIP..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Address(value, partial=false):: (
        // The node address..
            assert utils.asserts.type(value, 'string', 'address');
            kutils.mixin({"address": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentStatus":: function(path=function(patch){}) {
        _ref: {name: "DeploymentStatus"},

        Replicas(value, partial=false):: (
        // Total number of non-terminated pods targeted by this deployment (their labels match the selector)..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // The generation observed by the deployment controller..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        UpdatedReplicas(value, partial=false):: (
        // Total number of non-terminated pods targeted by this deployment that have the desired template spec..
            assert utils.asserts.type(value, 'integer', 'updatedReplicas');
            kutils.mixin({"updatedReplicas": value}, path, partial)
        ),

        AvailableReplicas(value, partial=false):: (
        // Total number of available pods (ready for at least minReadySeconds) targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'availableReplicas');
            kutils.mixin({"availableReplicas": value}, path, partial)
        ),

        UnavailableReplicas(value, partial=false):: (
        // Total number of unavailable pods targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'unavailableReplicas');
            kutils.mixin({"unavailableReplicas": value}, path, partial)
        ),

        ReadyReplicas(value, partial=false):: (
        // Total number of ready pods targeted by this deployment..
            assert utils.asserts.type(value, 'integer', 'readyReplicas');
            kutils.mixin({"readyReplicas": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Represents the latest available observations of a deployment's current state..
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EnvVar":: function(path=function(patch){}) {
        _ref: {name: "EnvVar"},

        name: null,

        ValueFrom::
           topSelf['io.k8s.kubernetes.pkg.api.v1.EnvVarSource'](function(patch) path({valueFrom+: patch})),
        Name(value, partial=false):: (
        // Name of the environment variable.
        // Must be a C_IDENTIFIER..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Value(value, partial=false):: (
        // Variable references $(VAR_NAME) are expanded using the previous defined environment variables in the container and any service environment variables.
        // If a variable cannot be resolved, the reference in the input string will be unchanged.
        // The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME).
        // Escaped references will never be expanded, regardless of whether the variable exists or not.
        // Defaults to ""..
            assert utils.asserts.type(value, 'string', 'value');
            kutils.mixin({"value": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.AWSElasticBlockStoreVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "AWSElasticBlockStoreVolumeSource"},

        volumeID: null,

        ReadOnly(value, partial=false):: (
        // Specify "true" to force and set the ReadOnly property in VolumeMounts to "true".
        // If omitted, the default is "false".
        // More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Partition(value, partial=false):: (
        // The partition in the volume that you want to mount.
        // If omitted, the default is to mount by volume name.
        // Examples: For volume /dev/sda1, you specify the partition as "1".
        // Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty)..
            assert utils.asserts.type(value, 'integer', 'partition');
            kutils.mixin({"partition": value}, path, partial)
        ),

        VolumeID(value, partial=false):: (
        // Unique ID of the persistent disk resource in AWS (Amazon EBS volume).
        // More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore.
            assert utils.asserts.type(value, 'string', 'volumeID');
            kutils.mixin({"volumeID": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type of the volume that you want to mount.
        // Tip: Ensure that the filesystem type is supported by the host operating system.
        // Examples: "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified.
        // More info: http://kubernetes.io/docs/user-guide/volumes#awselasticblockstore.
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NFSVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "NFSVolumeSource"},

        server: null,

        path: null,

        Path(value, partial=false):: (
        // Path that is exported by the NFS server.
        // More info: http://kubernetes.io/docs/user-guide/volumes#nfs.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the NFS export to be mounted with read-only permissions.
        // Defaults to false.
        // More info: http://kubernetes.io/docs/user-guide/volumes#nfs.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Server(value, partial=false):: (
        // Server is the hostname or IP address of the NFS server.
        // More info: http://kubernetes.io/docs/user-guide/volumes#nfs.
            assert utils.asserts.type(value, 'string', 'server');
            kutils.mixin({"server": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.PodSecurityPolicySpec":: function(path=function(patch){}) {
        _ref: {name: "PodSecurityPolicySpec"},

        seLinux: null,

        runAsUser: null,

        supplementalGroups: null,

        fsGroup: null,

        AllowedCapabilities(value, partial=false):: (
        // AllowedCapabilities is a list of capabilities that can be requested to add to the container.
        // Capabilities in this field may be added at the pod author's discretion.
        // You must not list a capability in both AllowedCapabilities and RequiredDropCapabilities..
            assert utils.asserts.type(value, 'array', 'allowedCapabilities');
            kutils.mixin({"allowedCapabilities": value}, path, partial)
        ),

        HostPorts(value, partial=false):: (
        // hostPorts determines which host port ranges are allowed to be exposed..
            assert utils.asserts.type(value, 'array', 'hostPorts');
            kutils.mixin({"hostPorts": value}, path, partial)
        ),

        SupplementalGroups::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.SupplementalGroupsStrategyOptions'](function(patch) path({supplementalGroups+: patch})),
        FsGroup::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.FSGroupStrategyOptions'](function(patch) path({fsGroup+: patch})),
        HostNetwork(value, partial=false):: (
        // hostNetwork determines if the policy allows the use of HostNetwork in the pod spec..
            assert utils.asserts.type(value, 'boolean', 'hostNetwork');
            kutils.mixin({"hostNetwork": value}, path, partial)
        ),

        RunAsUser::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RunAsUserStrategyOptions'](function(patch) path({runAsUser+: patch})),
        SeLinux::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.SELinuxStrategyOptions'](function(patch) path({seLinux+: patch})),
        Volumes(value, partial=false):: (
        // volumes is a white list of allowed volume plugins.
        // Empty indicates that all plugins may be used..
            assert utils.asserts.type(value, 'array', 'volumes');
            kutils.mixin({"volumes": value}, path, partial)
        ),

        HostIPC(value, partial=false):: (
        // hostIPC determines if the policy allows the use of HostIPC in the pod spec..
            assert utils.asserts.type(value, 'boolean', 'hostIPC');
            kutils.mixin({"hostIPC": value}, path, partial)
        ),

        DefaultAddCapabilities(value, partial=false):: (
        // DefaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.
        // You may not list a capabiility in both DefaultAddCapabilities and RequiredDropCapabilities..
            assert utils.asserts.type(value, 'array', 'defaultAddCapabilities');
            kutils.mixin({"defaultAddCapabilities": value}, path, partial)
        ),

        RequiredDropCapabilities(value, partial=false):: (
        // RequiredDropCapabilities are the capabilities that will be dropped from the container.
        // These are required to be dropped and cannot be added..
            assert utils.asserts.type(value, 'array', 'requiredDropCapabilities');
            kutils.mixin({"requiredDropCapabilities": value}, path, partial)
        ),

        ReadOnlyRootFilesystem(value, partial=false):: (
        // ReadOnlyRootFilesystem when set to true will force containers to run with a read only root file system.
        // If the container specifically requests to run with a non-read only root file system the PSP should deny the pod.
        // If set to false the container may run with a read only root file system if it wishes but it will not be forced to..
            assert utils.asserts.type(value, 'boolean', 'readOnlyRootFilesystem');
            kutils.mixin({"readOnlyRootFilesystem": value}, path, partial)
        ),

        Privileged(value, partial=false):: (
        // privileged determines if a pod can request to be run as privileged..
            assert utils.asserts.type(value, 'boolean', 'privileged');
            kutils.mixin({"privileged": value}, path, partial)
        ),

        HostPID(value, partial=false):: (
        // hostPID determines if the policy allows the use of HostPID in the pod spec..
            assert utils.asserts.type(value, 'boolean', 'hostPID');
            kutils.mixin({"hostPID": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta":: function(path=function(patch){}) {
        _ref: {name: "ListMeta"},

        SelfLink(value, partial=false):: (
        // SelfLink is a URL representing this object.
        // Populated by the system.
        // Read-only..
            assert utils.asserts.type(value, 'string', 'selfLink');
            kutils.mixin({"selfLink": value}, path, partial)
        ),

        ResourceVersion(value, partial=false):: (
        // String that identifies the server's internal version of this object that can be used by clients to determine when objects have changed.
        // Value must be treated as opaque by clients and passed unmodified back to the server.
        // Populated by the system.
        // Read-only.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#concurrency-control-and-consistency.
            assert utils.asserts.type(value, 'string', 'resourceVersion');
            kutils.mixin({"resourceVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetList":: function(path=function(patch){}) {
        _ref: {name: "ReplicaSetList"},

        items: [],

        Items(value, partial=false):: (
        // List of ReplicaSets.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ServiceAccountList":: function(path=function(patch){}) {
        _ref: {name: "ServiceAccountList"},

        items: [],

        Items(value, partial=false):: (
        // List of ServiceAccounts.
        // More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md#service-accounts.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscalerList":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerList"},

        items: [],

        Items(value, partial=false):: (
        // list of horizontal pod autoscaler objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Probe":: function(path=function(patch){}) {
        _ref: {name: "Probe"},

        HttpGet::
           topSelf['io.k8s.kubernetes.pkg.api.v1.HTTPGetAction'](function(patch) path({httpGet+: patch})),
        TimeoutSeconds(value, partial=false):: (
        // Number of seconds after which the probe times out.
        // Defaults to 1 second.
        // Minimum value is 1.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes.
            assert utils.asserts.type(value, 'integer', 'timeoutSeconds');
            kutils.mixin({"timeoutSeconds": value}, path, partial)
        ),

        Exec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ExecAction'](function(patch) path({exec+: patch})),
        InitialDelaySeconds(value, partial=false):: (
        // Number of seconds after the container has started before liveness probes are initiated.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#container-probes.
            assert utils.asserts.type(value, 'integer', 'initialDelaySeconds');
            kutils.mixin({"initialDelaySeconds": value}, path, partial)
        ),

        TcpSocket::
           topSelf['io.k8s.kubernetes.pkg.api.v1.TCPSocketAction'](function(patch) path({tcpSocket+: patch})),
        PeriodSeconds(value, partial=false):: (
        // How often (in seconds) to perform the probe.
        // Default to 10 seconds.
        // Minimum value is 1..
            assert utils.asserts.type(value, 'integer', 'periodSeconds');
            kutils.mixin({"periodSeconds": value}, path, partial)
        ),

        SuccessThreshold(value, partial=false):: (
        // Minimum consecutive successes for the probe to be considered successful after having failed.
        // Defaults to 1.
        // Must be 1 for liveness.
        // Minimum value is 1..
            assert utils.asserts.type(value, 'integer', 'successThreshold');
            kutils.mixin({"successThreshold": value}, path, partial)
        ),

        FailureThreshold(value, partial=false):: (
        // Minimum consecutive failures for the probe to be considered failed after having succeeded.
        // Defaults to 3.
        // Minimum value is 1..
            assert utils.asserts.type(value, 'integer', 'failureThreshold');
            kutils.mixin({"failureThreshold": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.SecretKeySelector":: function(path=function(patch){}) {
        _ref: {name: "SecretKeySelector"},

        key: null,

        Optional(value, partial=false):: (
        // Specify whether the Secret or it's key must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // The key of the secret to select from.
        // Must be a valid secret key..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NamespaceSpec":: function(path=function(patch){}) {
        _ref: {name: "NamespaceSpec"},

        Finalizers(value, partial=false):: (
        // Finalizers is an opaque list of values that must be empty to permanently remove object from storage.
        // More info: http://releases.k8s.io/HEAD/docs/design/namespaces.md#finalizers.
            assert utils.asserts.type(value, 'array', 'finalizers');
            kutils.mixin({"finalizers": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.ClusterRoleBindingList":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleBindingList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of ClusterRoleBindings.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Volume":: function(path=function(patch){}) {
        _ref: {name: "Volume"},

        name: null,

        PortworxVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PortworxVolumeSource'](function(patch) path({portworxVolume+: patch})),
        Glusterfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.GlusterfsVolumeSource'](function(patch) path({glusterfs+: patch})),
        GitRepo::
           topSelf['io.k8s.kubernetes.pkg.api.v1.GitRepoVolumeSource'](function(patch) path({gitRepo+: patch})),
        Flocker::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FlockerVolumeSource'](function(patch) path({flocker+: patch})),
        Iscsi::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ISCSIVolumeSource'](function(patch) path({iscsi+: patch})),
        Projected::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ProjectedVolumeSource'](function(patch) path({projected+: patch})),
        Secret::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SecretVolumeSource'](function(patch) path({secret+: patch})),
        FlexVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FlexVolumeSource'](function(patch) path({flexVolume+: patch})),
        PhotonPersistentDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PhotonPersistentDiskVolumeSource'](function(patch) path({photonPersistentDisk+: patch})),
        AzureDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AzureDiskVolumeSource'](function(patch) path({azureDisk+: patch})),
        Fc::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FCVolumeSource'](function(patch) path({fc+: patch})),
        ScaleIO::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ScaleIOVolumeSource'](function(patch) path({scaleIO+: patch})),
        EmptyDir::
           topSelf['io.k8s.kubernetes.pkg.api.v1.EmptyDirVolumeSource'](function(patch) path({emptyDir+: patch})),
        PersistentVolumeClaim::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimVolumeSource'](function(patch) path({persistentVolumeClaim+: patch})),
        ConfigMap::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ConfigMapVolumeSource'](function(patch) path({configMap+: patch})),
        Rbd::
           topSelf['io.k8s.kubernetes.pkg.api.v1.RBDVolumeSource'](function(patch) path({rbd+: patch})),
        Name(value, partial=false):: (
        // Volume's name.
        // Must be a DNS_LABEL and unique within the pod.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        AzureFile::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AzureFileVolumeSource'](function(patch) path({azureFile+: patch})),
        Quobyte::
           topSelf['io.k8s.kubernetes.pkg.api.v1.QuobyteVolumeSource'](function(patch) path({quobyte+: patch})),
        HostPath::
           topSelf['io.k8s.kubernetes.pkg.api.v1.HostPathVolumeSource'](function(patch) path({hostPath+: patch})),
        Nfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NFSVolumeSource'](function(patch) path({nfs+: patch})),
        VsphereVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.VsphereVirtualDiskVolumeSource'](function(patch) path({vsphereVolume+: patch})),
        Cinder::
           topSelf['io.k8s.kubernetes.pkg.api.v1.CinderVolumeSource'](function(patch) path({cinder+: patch})),
        AwsElasticBlockStore::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AWSElasticBlockStoreVolumeSource'](function(patch) path({awsElasticBlockStore+: patch})),
        Cephfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.CephFSVolumeSource'](function(patch) path({cephfs+: patch})),
        DownwardAPI::
           topSelf['io.k8s.kubernetes.pkg.api.v1.DownwardAPIVolumeSource'](function(patch) path({downwardAPI+: patch})),
        GcePersistentDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.GCEPersistentDiskVolumeSource'](function(patch) path({gcePersistentDisk+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMapKeySelector":: function(path=function(patch){}) {
        _ref: {name: "ConfigMapKeySelector"},

        key: null,

        Optional(value, partial=false):: (
        // Specify whether the ConfigMap or it's key must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // The key to select..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.Patch":: function(path=function(patch){}) {
        _ref: {name: "Patch"},

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressList":: function(path=function(patch){}) {
        _ref: {name: "IngressList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of Ingress..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSet":: function(path=function(patch){}) {
        _ref: {name: "ReplicaSet"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJob":: function(path=function(patch){}) {
        _ref: {name: "CronJob"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJobStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJobSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.VsphereVirtualDiskVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "VsphereVirtualDiskVolumeSource"},

        volumePath: null,

        VolumePath(value, partial=false):: (
        // Path that identifies vSphere volume vmdk.
            assert utils.asserts.type(value, 'string', 'volumePath');
            kutils.mixin({"volumePath": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.Status":: function(path=function(patch){}) {
        _ref: {name: "Status"},

        Status(value, partial=false):: (
        // Status of the operation.
        // One of: "Success" or "Failure".
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#spec-and-status.
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Code(value, partial=false):: (
        // Suggested HTTP return code for this status, 0 if not set..
            assert utils.asserts.type(value, 'integer', 'code');
            kutils.mixin({"code": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // A machine-readable description of why this operation is in the "Failure" status.
        // If this value is empty there is no information available.
        // A Reason clarifies an HTTP status code but does not override it..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        Details::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.StatusDetails'](function(patch) path({details+: patch})),
        Message(value, partial=false):: (
        // A human-readable description of the status of this operation..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ReplicationControllerStatus":: function(path=function(patch){}) {
        _ref: {name: "ReplicationControllerStatus"},

        replicas: null,

        Replicas(value, partial=false):: (
        // Replicas is the most recently oberved number of replicas.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller#what-is-a-replication-controller.
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // ObservedGeneration reflects the generation of the most recently observed replication controller..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        AvailableReplicas(value, partial=false):: (
        // The number of available replicas (ready for at least minReadySeconds) for this replication controller..
            assert utils.asserts.type(value, 'integer', 'availableReplicas');
            kutils.mixin({"availableReplicas": value}, path, partial)
        ),

        ReadyReplicas(value, partial=false):: (
        // The number of ready replicas for this replication controller..
            assert utils.asserts.type(value, 'integer', 'readyReplicas');
            kutils.mixin({"readyReplicas": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Represents the latest available observations of a replication controller's current state..
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

        FullyLabeledReplicas(value, partial=false):: (
        // The number of pods that have labels matching the labels of the pod template of the replication controller..
            assert utils.asserts.type(value, 'integer', 'fullyLabeledReplicas');
            kutils.mixin({"fullyLabeledReplicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.LoadBalancerStatus":: function(path=function(patch){}) {
        _ref: {name: "LoadBalancerStatus"},

        Ingress(value, partial=false):: (
        // Ingress is a list containing ingress points for the load-balancer.
        // Traffic intended for the service should be sent to these ingress points..
            assert utils.asserts.type(value, 'array', 'ingress');
            kutils.mixin({"ingress": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.Binding":: function(path=function(patch){}) {
        _ref: {name: "Binding"},

        target: null,

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Target::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectReference'](function(patch) path({target+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.VolumeProjection":: function(path=function(patch){}) {
        _ref: {name: "VolumeProjection"},

        ConfigMap::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ConfigMapProjection'](function(patch) path({configMap+: patch})),
        Secret::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SecretProjection'](function(patch) path({secret+: patch})),
        DownwardAPI::
           topSelf['io.k8s.kubernetes.pkg.api.v1.DownwardAPIProjection'](function(patch) path({downwardAPI+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.Time":: function(path=function(patch){}) {
        _ref: {name: "Time"},

    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1.TokenReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "TokenReviewSpec"},

        Token(value, partial=false):: (
        // Token is the opaque bearer token..
            assert utils.asserts.type(value, 'string', 'token');
            kutils.mixin({"token": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.Subject":: function(path=function(patch){}) {
        _ref: {name: "Subject"},

        kind: null,

        name: null,

        ApiGroup(value, partial=false):: (
        // APIGroup holds the API group of the referenced subject.
        // Defaults to "" for ServiceAccount subjects.
        // Defaults to "rbac.authorization.k8s.io" for User and Group subjects..
            assert utils.asserts.type(value, 'string', 'apiGroup');
            kutils.mixin({"apiGroup": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind of object being referenced.
        // Values defined by this API group are "User", "Group", and "ServiceAccount".
        // If the Authorizer does not recognized the kind value, the Authorizer should report an error..
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace of the referenced object.
        // If the object kind is non-namespace, such as "User" or "Group", and this value is not empty the Authorizer should report an error..
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the object being referenced..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NodeList":: function(path=function(patch){}) {
        _ref: {name: "NodeList"},

        items: [],

        Items(value, partial=false):: (
        // List of nodes.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerPort":: function(path=function(patch){}) {
        _ref: {name: "ContainerPort"},

        containerPort: null,

        HostPort(value, partial=false):: (
        // Number of port to expose on the host.
        // If specified, this must be a valid port number, 0 < x < 65536.
        // If HostNetwork is specified, this must match ContainerPort.
        // Most containers do not need this..
            assert utils.asserts.type(value, 'integer', 'hostPort');
            kutils.mixin({"hostPort": value}, path, partial)
        ),

        Protocol(value, partial=false):: (
        // Protocol for port.
        // Must be UDP or TCP.
        // Defaults to "TCP"..
            assert utils.asserts.type(value, 'string', 'protocol');
            kutils.mixin({"protocol": value}, path, partial)
        ),

        ContainerPort(value, partial=false):: (
        // Number of port to expose on the pod's IP address.
        // This must be a valid port number, 0 < x < 65536..
            assert utils.asserts.type(value, 'integer', 'containerPort');
            kutils.mixin({"containerPort": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // If specified, this must be an IANA_SVC_NAME and unique within the pod.
        // Each named port in a pod must have a unique name.
        // Name for the port that can be referred to by services..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        HostIP(value, partial=false):: (
        // What host IP to bind the external port to..
            assert utils.asserts.type(value, 'string', 'hostIP');
            kutils.mixin({"hostIP": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.FCVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "FCVolumeSource"},

        targetWWNs: [],

        lun: null,

        ReadOnly(value, partial=false):: (
        // Optional: Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        TargetWWNs(value, partial=false):: (
        // Required: FC target worldwide names (WWNs).
            assert utils.asserts.type(value, 'array', 'targetWWNs');
            kutils.mixin({"targetWWNs": value}, path, partial)
        ),

        Lun(value, partial=false):: (
        // Required: FC target lun number.
            assert utils.asserts.type(value, 'integer', 'lun');
            kutils.mixin({"lun": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.runtime.RawExtension":: function(path=function(patch){}) {
        _ref: {name: "RawExtension"},

        Raw: null,

        setRaw(value, partial=false):: (
        // Raw is the underlying serialization of this object..
            assert utils.asserts.type(value, 'string', 'Raw');
            kutils.mixin({"Raw": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.ClusterRoleBinding":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleBinding"},

        subjects: [],

        roleRef: null,

        RoleRef::
           topSelf['io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleRef'](function(patch) path({roleRef+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Subjects(value, partial=false):: (
        // Subjects holds references to the objects the role applies to..
            assert utils.asserts.type(value, 'array', 'subjects');
            kutils.mixin({"subjects": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.version.Info":: function(path=function(patch){}) {
        _ref: {name: "Info"},

        major: null,

        minor: null,

        gitVersion: null,

        gitCommit: null,

        gitTreeState: null,

        buildDate: null,

        goVersion: null,

        compiler: null,

        platform: null,

        Major(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'major');
            kutils.mixin({"major": value}, path, partial)
        ),

        GitTreeState(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'gitTreeState');
            kutils.mixin({"gitTreeState": value}, path, partial)
        ),

        BuildDate(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'buildDate');
            kutils.mixin({"buildDate": value}, path, partial)
        ),

        Platform(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'platform');
            kutils.mixin({"platform": value}, path, partial)
        ),

        Minor(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'minor');
            kutils.mixin({"minor": value}, path, partial)
        ),

        GitCommit(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'gitCommit');
            kutils.mixin({"gitCommit": value}, path, partial)
        ),

        Compiler(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'compiler');
            kutils.mixin({"compiler": value}, path, partial)
        ),

        GitVersion(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'gitVersion');
            kutils.mixin({"gitVersion": value}, path, partial)
        ),

        GoVersion(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'goVersion');
            kutils.mixin({"goVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscaler":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscaler"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscalerStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscalerSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ReplicationControllerSpec":: function(path=function(patch){}) {
        _ref: {name: "ReplicationControllerSpec"},

        Selector(value, partial=false):: (
        // Selector is a label query over pods that should match the Replicas count.
        // If Selector is empty, it is defaulted to the labels present on the Pod template.
        // Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template.
        // More info: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'object', 'selector');
            kutils.mixin({"selector": value}, path, partial)
        ),

        Replicas(value, partial=false):: (
        // Replicas is the number of desired replicas.
        // This is a pointer to distinguish between explicit zero and unspecified.
        // Defaults to 1.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller#what-is-a-replication-controller.
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        MinReadySeconds(value, partial=false):: (
        // Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available.
        // Defaults to 0 (pod will be considered available as soon as it is ready).
            assert utils.asserts.type(value, 'integer', 'minReadySeconds');
            kutils.mixin({"minReadySeconds": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.TCPSocketAction":: function(path=function(patch){}) {
        _ref: {name: "TCPSocketAction"},

        port: null,

        Port::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({port+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleList":: function(path=function(patch){}) {
        _ref: {name: "RoleList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of Roles.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSetList":: function(path=function(patch){}) {
        _ref: {name: "StatefulSetList"},

        items: [],

        Items(value, partial=false):: (
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ISCSIVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "ISCSIVolumeSource"},

        targetPortal: null,

        iqn: null,

        lun: null,

        TargetPortal(value, partial=false):: (
        // iSCSI target portal.
        // The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)..
            assert utils.asserts.type(value, 'string', 'targetPortal');
            kutils.mixin({"targetPortal": value}, path, partial)
        ),

        Portals(value, partial=false):: (
        // iSCSI target portal List.
        // The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)..
            assert utils.asserts.type(value, 'array', 'portals');
            kutils.mixin({"portals": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type of the volume that you want to mount.
        // Tip: Ensure that the filesystem type is supported by the host operating system.
        // Examples: "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified.
        // More info: http://kubernetes.io/docs/user-guide/volumes#iscsi.
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the ReadOnly setting in VolumeMounts.
        // Defaults to false..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Iqn(value, partial=false):: (
        // Target iSCSI Qualified Name..
            assert utils.asserts.type(value, 'string', 'iqn');
            kutils.mixin({"iqn": value}, path, partial)
        ),

        IscsiInterface(value, partial=false):: (
        // Optional: Defaults to 'default' (tcp).
        // iSCSI interface name that uses an iSCSI transport..
            assert utils.asserts.type(value, 'string', 'iscsiInterface');
            kutils.mixin({"iscsiInterface": value}, path, partial)
        ),

        Lun(value, partial=false):: (
        // iSCSI target lun number..
            assert utils.asserts.type(value, 'integer', 'lun');
            kutils.mixin({"lun": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PodTemplate":: function(path=function(patch){}) {
        _ref: {name: "PodTemplate"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Toleration":: function(path=function(patch){}) {
        _ref: {name: "Toleration"},

        Operator(value, partial=false):: (
        // Operator represents a key's relationship to the value.
        // Valid operators are Exists and Equal.
        // Defaults to Equal.
        // Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category..
            assert utils.asserts.type(value, 'string', 'operator');
            kutils.mixin({"operator": value}, path, partial)
        ),

        Value(value, partial=false):: (
        // Value is the taint value the toleration matches to.
        // If the operator is Exists, the value should be empty, otherwise just a regular string..
            assert utils.asserts.type(value, 'string', 'value');
            kutils.mixin({"value": value}, path, partial)
        ),

        TolerationSeconds(value, partial=false):: (
        // TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint.
        // By default, it is not set, which means tolerate the taint forever (do not evict).
        // Zero and negative values will be treated as 0 (evict immediately) by the system..
            assert utils.asserts.type(value, 'integer', 'tolerationSeconds');
            kutils.mixin({"tolerationSeconds": value}, path, partial)
        ),

        Effect(value, partial=false):: (
        // Effect indicates the taint effect to match.
        // Empty means match all taint effects.
        // When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute..
            assert utils.asserts.type(value, 'string', 'effect');
            kutils.mixin({"effect": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // Key is the taint key that the toleration applies to.
        // Empty means match all taint keys.
        // If the key is empty, operator must be Exists; this combination means to match all values and all keys..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.ClusterRoleList":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of ClusterRoles.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentList":: function(path=function(patch){}) {
        _ref: {name: "DeploymentList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of Deployments..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.ScaleStatus":: function(path=function(patch){}) {
        _ref: {name: "ScaleStatus"},

        replicas: null,

        Selector(value, partial=false):: (
        // label query over pods that should match the replicas count.
        // This is same as the label selector but in the string format to avoid introspection by clients.
        // The string will be in the same format as the query-param syntax.
        // More info about label selectors: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'string', 'selector');
            kutils.mixin({"selector": value}, path, partial)
        ),

        Replicas(value, partial=false):: (
        // actual number of observed instances of the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ServiceStatus":: function(path=function(patch){}) {
        _ref: {name: "ServiceStatus"},

        LoadBalancer::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LoadBalancerStatus'](function(patch) path({loadBalancer+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodSpec":: function(path=function(patch){}) {
        _ref: {name: "PodSpec"},

        containers: [],

        DnsPolicy(value, partial=false):: (
        // Set DNS policy for containers within the pod.
        // One of 'ClusterFirstWithHostNet', 'ClusterFirst' or 'Default'.
        // Defaults to "ClusterFirst".
        // To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'..
            assert utils.asserts.type(value, 'string', 'dnsPolicy');
            kutils.mixin({"dnsPolicy": value}, path, partial)
        ),

        HostNetwork(value, partial=false):: (
        // Host networking requested for this pod.
        // Use the host's network namespace.
        // If this option is set, the ports that will be used must be specified.
        // Default to false..
            assert utils.asserts.type(value, 'boolean', 'hostNetwork');
            kutils.mixin({"hostNetwork": value}, path, partial)
        ),

        RestartPolicy(value, partial=false):: (
        // Restart policy for all containers within the pod.
        // One of Always, OnFailure, Never.
        // Default to Always.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#restartpolicy.
            assert utils.asserts.type(value, 'string', 'restartPolicy');
            kutils.mixin({"restartPolicy": value}, path, partial)
        ),

        AutomountServiceAccountToken(value, partial=false):: (
        // AutomountServiceAccountToken indicates whether a service account token should be automatically mounted..
            assert utils.asserts.type(value, 'boolean', 'automountServiceAccountToken');
            kutils.mixin({"automountServiceAccountToken": value}, path, partial)
        ),

        SecurityContext::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodSecurityContext'](function(patch) path({securityContext+: patch})),
        NodeName(value, partial=false):: (
        // NodeName is a request to schedule this pod onto a specific node.
        // If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements..
            assert utils.asserts.type(value, 'string', 'nodeName');
            kutils.mixin({"nodeName": value}, path, partial)
        ),

        Hostname(value, partial=false):: (
        // Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value..
            assert utils.asserts.type(value, 'string', 'hostname');
            kutils.mixin({"hostname": value}, path, partial)
        ),

        ServiceAccount(value, partial=false):: (
        // DeprecatedServiceAccount is a depreciated alias for ServiceAccountName.
        // Deprecated: Use serviceAccountName instead..
            assert utils.asserts.type(value, 'string', 'serviceAccount');
            kutils.mixin({"serviceAccount": value}, path, partial)
        ),

        NodeSelector(value, partial=false):: (
        // NodeSelector is a selector which must be true for the pod to fit on a node.
        // Selector which must match a node's labels for the pod to be scheduled on that node.
        // More info: http://kubernetes.io/docs/user-guide/node-selection/README.
            assert utils.asserts.type(value, 'object', 'nodeSelector');
            kutils.mixin({"nodeSelector": value}, path, partial)
        ),

        Affinity::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Affinity'](function(patch) path({affinity+: patch})),
        Tolerations(value, partial=false):: (
        // If specified, the pod's tolerations..
            assert utils.asserts.type(value, 'array', 'tolerations');
            kutils.mixin({"tolerations": value}, path, partial)
        ),

        Subdomain(value, partial=false):: (
        // If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>".
        // If not specified, the pod will not have a domainname at all..
            assert utils.asserts.type(value, 'string', 'subdomain');
            kutils.mixin({"subdomain": value}, path, partial)
        ),

        HostPID(value, partial=false):: (
        // Use the host's pid namespace.
        // Optional: Default to false..
            assert utils.asserts.type(value, 'boolean', 'hostPID');
            kutils.mixin({"hostPID": value}, path, partial)
        ),

        ServiceAccountName(value, partial=false):: (
        // ServiceAccountName is the name of the ServiceAccount to use to run this pod.
        // More info: http://releases.k8s.io/HEAD/docs/design/service_accounts.md.
            assert utils.asserts.type(value, 'string', 'serviceAccountName');
            kutils.mixin({"serviceAccountName": value}, path, partial)
        ),

        SchedulerName(value, partial=false):: (
        // If specified, the pod will be dispatched by specified scheduler.
        // If not specified, the pod will be dispatched by default scheduler..
            assert utils.asserts.type(value, 'string', 'schedulerName');
            kutils.mixin({"schedulerName": value}, path, partial)
        ),

        HostIPC(value, partial=false):: (
        // Use the host's ipc namespace.
        // Optional: Default to false..
            assert utils.asserts.type(value, 'boolean', 'hostIPC');
            kutils.mixin({"hostIPC": value}, path, partial)
        ),

        ActiveDeadlineSeconds(value, partial=false):: (
        // Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers.
        // Value must be a positive integer..
            assert utils.asserts.type(value, 'integer', 'activeDeadlineSeconds');
            kutils.mixin({"activeDeadlineSeconds": value}, path, partial)
        ),

        TerminationGracePeriodSeconds(value, partial=false):: (
        // Optional duration in seconds the pod needs to terminate gracefully.
        // May be decreased in delete request.
        // Value must be non-negative integer.
        // The value zero indicates delete immediately.
        // If this value is nil, the default grace period will be used instead.
        // The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal.
        // Set this value longer than the expected cleanup time for your process.
        // Defaults to 30 seconds..
            assert utils.asserts.type(value, 'integer', 'terminationGracePeriodSeconds');
            kutils.mixin({"terminationGracePeriodSeconds": value}, path, partial)
        ),

        Containers(value, partial=false):: (
        // List of containers belonging to the pod.
        // Containers cannot currently be added or removed.
        // There must be at least one container in a Pod.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/containers.
            assert utils.asserts.type(value, 'array', 'containers');
            kutils.mixin({"containers": value}, path, partial)
        ),

        Volumes(value, partial=false):: (
        // List of volumes that can be mounted by containers belonging to the pod.
        // More info: http://kubernetes.io/docs/user-guide/volumes.
            assert utils.asserts.type(value, 'array', 'volumes');
            kutils.mixin({"volumes": value}, path, partial)
        ),

        InitContainers(value, partial=false):: (
        // List of initialization containers belonging to the pod.
        // Init containers are executed in order prior to containers being started.
        // If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy.
        // The name for an init container or normal container must be unique among all containers.
        // Init containers may not have Lifecycle actions, Readiness probes, or Liveness probes.
        // The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers.
        // Limits are applied to init containers in a similar fashion.
        // Init containers cannot currently be added or removed.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/containers.
            assert utils.asserts.type(value, 'array', 'initContainers');
            kutils.mixin({"initContainers": value}, path, partial)
        ),

        ImagePullSecrets(value, partial=false):: (
        // ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec.
        // If specified, these secrets will be passed to individual puller implementations for them to use.
        // For example, in the case of docker, only DockerConfig type secrets are honored.
        // More info: http://kubernetes.io/docs/user-guide/images#specifying-imagepullsecrets-on-a-pod.
            assert utils.asserts.type(value, 'array', 'imagePullSecrets');
            kutils.mixin({"imagePullSecrets": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NamespaceList":: function(path=function(patch){}) {
        _ref: {name: "NamespaceList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of Namespace objects in the list.
        // More info: http://kubernetes.io/docs/user-guide/namespaces.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeSystemInfo":: function(path=function(patch){}) {
        _ref: {name: "NodeSystemInfo"},

        machineID: null,

        systemUUID: null,

        bootID: null,

        kernelVersion: null,

        osImage: null,

        containerRuntimeVersion: null,

        kubeletVersion: null,

        kubeProxyVersion: null,

        operatingSystem: null,

        architecture: null,

        KernelVersion(value, partial=false):: (
        // Kernel Version reported by the node from 'uname -r' (e.g.
        // 3.16.0-0.bpo.4-amd64)..
            assert utils.asserts.type(value, 'string', 'kernelVersion');
            kutils.mixin({"kernelVersion": value}, path, partial)
        ),

        KubeletVersion(value, partial=false):: (
        // Kubelet Version reported by the node..
            assert utils.asserts.type(value, 'string', 'kubeletVersion');
            kutils.mixin({"kubeletVersion": value}, path, partial)
        ),

        ContainerRuntimeVersion(value, partial=false):: (
        // ContainerRuntime Version reported by the node through runtime remote API (e.g.
        // docker://1.5.0)..
            assert utils.asserts.type(value, 'string', 'containerRuntimeVersion');
            kutils.mixin({"containerRuntimeVersion": value}, path, partial)
        ),

        MachineID(value, partial=false):: (
        // MachineID reported by the node.
        // For unique machine identification in the cluster this field is prefered.
        // Learn more from man(5) machine-id: http://man7.org/linux/man-pages/man5/machine-id.5.html.
            assert utils.asserts.type(value, 'string', 'machineID');
            kutils.mixin({"machineID": value}, path, partial)
        ),

        KubeProxyVersion(value, partial=false):: (
        // KubeProxy Version reported by the node..
            assert utils.asserts.type(value, 'string', 'kubeProxyVersion');
            kutils.mixin({"kubeProxyVersion": value}, path, partial)
        ),

        BootID(value, partial=false):: (
        // Boot ID reported by the node..
            assert utils.asserts.type(value, 'string', 'bootID');
            kutils.mixin({"bootID": value}, path, partial)
        ),

        OsImage(value, partial=false):: (
        // OS Image reported by the node from /etc/os-release (e.g.
        // Debian GNU/Linux 7 (wheezy))..
            assert utils.asserts.type(value, 'string', 'osImage');
            kutils.mixin({"osImage": value}, path, partial)
        ),

        Architecture(value, partial=false):: (
        // The Architecture reported by the node.
            assert utils.asserts.type(value, 'string', 'architecture');
            kutils.mixin({"architecture": value}, path, partial)
        ),

        SystemUUID(value, partial=false):: (
        // SystemUUID reported by the node.
        // For unique machine identification MachineID is prefered.
        // This field is specific to Red Hat hosts https://access.redhat.com/documentation/en-US/Red_Hat_Subscription_Management/1/html/RHSM/getting-system-uuid.html.
            assert utils.asserts.type(value, 'string', 'systemUUID');
            kutils.mixin({"systemUUID": value}, path, partial)
        ),

        OperatingSystem(value, partial=false):: (
        // The Operating System reported by the node.
            assert utils.asserts.type(value, 'string', 'operatingSystem');
            kutils.mixin({"operatingSystem": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.KeyToPath":: function(path=function(patch){}) {
        _ref: {name: "KeyToPath"},

        key: null,

        path: null,

        Path(value, partial=false):: (
        // The relative path of the file to map the key to.
        // May not be an absolute path.
        // May not contain the path element '..'.
        // May not start with the string '..'..
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Mode(value, partial=false):: (
        // Optional: mode bits to use on this file, must be a value between 0 and 0777.
        // If not specified, the volume defaultMode will be used.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'mode');
            kutils.mixin({"mode": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // The key to project..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.ResourceAttributes":: function(path=function(patch){}) {
        _ref: {name: "ResourceAttributes"},

        Resource(value, partial=false):: (
        // Resource is one of the existing resource types.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'resource');
            kutils.mixin({"resource": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name is the name of the resource being requested for a "get" or deleted for a "delete".
        // "" (empty) means all..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace is the namespace of the action being requested.
        // Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview.
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        Verb(value, partial=false):: (
        // Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'verb');
            kutils.mixin({"verb": value}, path, partial)
        ),

        Version(value, partial=false):: (
        // Version is the API Version of the Resource.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'version');
            kutils.mixin({"version": value}, path, partial)
        ),

        Group(value, partial=false):: (
        // Group is the API Group of the Resource.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'group');
            kutils.mixin({"group": value}, path, partial)
        ),

        Subresource(value, partial=false):: (
        // Subresource is one of the existing resource types.
        // "" means none..
            assert utils.asserts.type(value, 'string', 'subresource');
            kutils.mixin({"subresource": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EnvFromSource":: function(path=function(patch){}) {
        _ref: {name: "EnvFromSource"},

        Prefix(value, partial=false):: (
        // An optional identifer to prepend to each key in the ConfigMap.
        // Must be a C_IDENTIFIER..
            assert utils.asserts.type(value, 'string', 'prefix');
            kutils.mixin({"prefix": value}, path, partial)
        ),

        ConfigMapRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ConfigMapEnvSource'](function(patch) path({configMapRef+: patch})),
        SecretRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SecretEnvSource'](function(patch) path({secretRef+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestList":: function(path=function(patch){}) {
        _ref: {name: "CertificateSigningRequestList"},

        items: [],

        Items(value, partial=false):: (
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v1.JobStatus":: function(path=function(patch){}) {
        _ref: {name: "JobStatus"},

        Succeeded(value, partial=false):: (
        // Succeeded is the number of pods which reached Phase Succeeded..
            assert utils.asserts.type(value, 'integer', 'succeeded');
            kutils.mixin({"succeeded": value}, path, partial)
        ),

        Failed(value, partial=false):: (
        // Failed is the number of pods which reached Phase Failed..
            assert utils.asserts.type(value, 'integer', 'failed');
            kutils.mixin({"failed": value}, path, partial)
        ),

        CompletionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({completionTime+: patch})),
        StartTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({startTime+: patch})),
        Active(value, partial=false):: (
        // Active is the number of actively running pods..
            assert utils.asserts.type(value, 'integer', 'active');
            kutils.mixin({"active": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Conditions represent the latest available observations of an object's current state.
        // More info: http://kubernetes.io/docs/user-guide/jobs.
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EventSource":: function(path=function(patch){}) {
        _ref: {name: "EventSource"},

        Host(value, partial=false):: (
        // Node name on which the event is generated..
            assert utils.asserts.type(value, 'string', 'host');
            kutils.mixin({"host": value}, path, partial)
        ),

        Component(value, partial=false):: (
        // Component from which the event is generated..
            assert utils.asserts.type(value, 'string', 'component');
            kutils.mixin({"component": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetCondition":: function(path=function(patch){}) {
        _ref: {name: "ReplicaSetCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of replica set condition..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human readable message indicating details about the transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // The reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.GCEPersistentDiskVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "GCEPersistentDiskVolumeSource"},

        pdName: null,

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the ReadOnly setting in VolumeMounts.
        // Defaults to false.
        // More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Partition(value, partial=false):: (
        // The partition in the volume that you want to mount.
        // If omitted, the default is to mount by volume name.
        // Examples: For volume /dev/sda1, you specify the partition as "1".
        // Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
        // More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk.
            assert utils.asserts.type(value, 'integer', 'partition');
            kutils.mixin({"partition": value}, path, partial)
        ),

        PdName(value, partial=false):: (
        // Unique name of the PD resource in GCE.
        // Used to identify the disk in GCE.
        // More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk.
            assert utils.asserts.type(value, 'string', 'pdName');
            kutils.mixin({"pdName": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type of the volume that you want to mount.
        // Tip: Ensure that the filesystem type is supported by the host operating system.
        // Examples: "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified.
        // More info: http://kubernetes.io/docs/user-guide/volumes#gcepersistentdisk.
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ServiceAccount":: function(path=function(patch){}) {
        _ref: {name: "ServiceAccount"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Secrets(value, partial=false):: (
        // Secrets is the list of secrets allowed to be used by pods running using this ServiceAccount.
        // More info: http://kubernetes.io/docs/user-guide/secrets.
            assert utils.asserts.type(value, 'array', 'secrets');
            kutils.mixin({"secrets": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        ImagePullSecrets(value, partial=false):: (
        // ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount.
        // ImagePullSecrets are distinct from Secrets because Secrets can be mounted in the pod, but ImagePullSecrets are only accessed by the kubelet.
        // More info: http://kubernetes.io/docs/user-guide/secrets#manually-specifying-an-imagepullsecret.
            assert utils.asserts.type(value, 'array', 'imagePullSecrets');
            kutils.mixin({"imagePullSecrets": value}, path, partial)
        ),

        AutomountServiceAccountToken(value, partial=false):: (
        // AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted.
        // Can be overridden at the pod level..
            assert utils.asserts.type(value, 'boolean', 'automountServiceAccountToken');
            kutils.mixin({"automountServiceAccountToken": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeSpec":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeSpec"},

        PortworxVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PortworxVolumeSource'](function(patch) path({portworxVolume+: patch})),
        Glusterfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.GlusterfsVolumeSource'](function(patch) path({glusterfs+: patch})),
        Flocker::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FlockerVolumeSource'](function(patch) path({flocker+: patch})),
        Capacity(value, partial=false):: (
        // A description of the persistent volume's resources and capacity.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#capacity.
            assert utils.asserts.type(value, 'object', 'capacity');
            kutils.mixin({"capacity": value}, path, partial)
        ),

        Iscsi::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ISCSIVolumeSource'](function(patch) path({iscsi+: patch})),
        ClaimRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectReference'](function(patch) path({claimRef+: patch})),
        ScaleIO::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ScaleIOVolumeSource'](function(patch) path({scaleIO+: patch})),
        PhotonPersistentDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PhotonPersistentDiskVolumeSource'](function(patch) path({photonPersistentDisk+: patch})),
        PersistentVolumeReclaimPolicy(value, partial=false):: (
        // What happens to a persistent volume when released from its claim.
        // Valid options are Retain (default) and Recycle.
        // Recycling must be supported by the volume plugin underlying this persistent volume.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#recycling-policy.
            assert utils.asserts.type(value, 'string', 'persistentVolumeReclaimPolicy');
            kutils.mixin({"persistentVolumeReclaimPolicy": value}, path, partial)
        ),

        AzureDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AzureDiskVolumeSource'](function(patch) path({azureDisk+: patch})),
        AccessModes(value, partial=false):: (
        // AccessModes contains all ways the volume can be mounted.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#access-modes.
            assert utils.asserts.type(value, 'array', 'accessModes');
            kutils.mixin({"accessModes": value}, path, partial)
        ),

        Fc::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FCVolumeSource'](function(patch) path({fc+: patch})),
        FlexVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.FlexVolumeSource'](function(patch) path({flexVolume+: patch})),
        StorageClassName(value, partial=false):: (
        // Name of StorageClass to which this persistent volume belongs.
        // Empty value means that this volume does not belong to any StorageClass..
            assert utils.asserts.type(value, 'string', 'storageClassName');
            kutils.mixin({"storageClassName": value}, path, partial)
        ),

        Cephfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.CephFSVolumeSource'](function(patch) path({cephfs+: patch})),
        AzureFile::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AzureFileVolumeSource'](function(patch) path({azureFile+: patch})),
        Quobyte::
           topSelf['io.k8s.kubernetes.pkg.api.v1.QuobyteVolumeSource'](function(patch) path({quobyte+: patch})),
        HostPath::
           topSelf['io.k8s.kubernetes.pkg.api.v1.HostPathVolumeSource'](function(patch) path({hostPath+: patch})),
        Nfs::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NFSVolumeSource'](function(patch) path({nfs+: patch})),
        VsphereVolume::
           topSelf['io.k8s.kubernetes.pkg.api.v1.VsphereVirtualDiskVolumeSource'](function(patch) path({vsphereVolume+: patch})),
        Cinder::
           topSelf['io.k8s.kubernetes.pkg.api.v1.CinderVolumeSource'](function(patch) path({cinder+: patch})),
        AwsElasticBlockStore::
           topSelf['io.k8s.kubernetes.pkg.api.v1.AWSElasticBlockStoreVolumeSource'](function(patch) path({awsElasticBlockStore+: patch})),
        Rbd::
           topSelf['io.k8s.kubernetes.pkg.api.v1.RBDVolumeSource'](function(patch) path({rbd+: patch})),
        GcePersistentDisk::
           topSelf['io.k8s.kubernetes.pkg.api.v1.GCEPersistentDiskVolumeSource'](function(patch) path({gcePersistentDisk+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestStatus":: function(path=function(patch){}) {
        _ref: {name: "CertificateSigningRequestStatus"},

        Conditions(value, partial=false):: (
        // Conditions applied to the request, such as approval or denial..
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

        Certificate(value, partial=false):: (
        // If request was approved, the controller will place the issued certificate here..
            assert utils.asserts.type(value, 'string', 'certificate');
            kutils.mixin({"certificate": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.Service":: function(path=function(patch){}) {
        _ref: {name: "Service"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ServiceStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ServiceSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressRule":: function(path=function(patch){}) {
        _ref: {name: "IngressRule"},

        Host(value, partial=false):: (
        // Host is the fully qualified domain name of a network host, as defined by RFC 3986.
        // Note the following deviations from the "host" part of the URI as defined in the RFC: 1.
        // IPs are not allowed.
        // Currently an IngressRuleValue can only apply to the	  IP in the Spec of the parent Ingress.2.
        // The `:` delimiter is not respected because ports are not allowed.	  Currently the port of an Ingress is implicitly :80 for http and	  :443 for https.Both these may change in the future.
        // Incoming requests are matched against the host before the IngressRuleValue.
        // If the host is unspecified, the Ingress routes all traffic based on the specified IngressRuleValue..
            assert utils.asserts.type(value, 'string', 'host');
            kutils.mixin({"host": value}, path, partial)
        ),

        Http::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.HTTPIngressRuleValue'](function(patch) path({http+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentSpec":: function(path=function(patch){}) {
        _ref: {name: "DeploymentSpec"},

        template: null,

        Replicas(value, partial=false):: (
        // Number of desired pods.
        // This is a pointer to distinguish between explicit zero and not specified.
        // Defaults to 1..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        Paused(value, partial=false):: (
        // Indicates that the deployment is paused..
            assert utils.asserts.type(value, 'boolean', 'paused');
            kutils.mixin({"paused": value}, path, partial)
        ),

        Strategy::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentStrategy'](function(patch) path({strategy+: patch})),
        RollbackTo::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.RollbackConfig'](function(patch) path({rollbackTo+: patch})),
        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        RevisionHistoryLimit(value, partial=false):: (
        // The number of old ReplicaSets to retain to allow rollback.
        // This is a pointer to distinguish between explicit zero and not specified.
        // Defaults to 2..
            assert utils.asserts.type(value, 'integer', 'revisionHistoryLimit');
            kutils.mixin({"revisionHistoryLimit": value}, path, partial)
        ),

        ProgressDeadlineSeconds(value, partial=false):: (
        // The maximum time in seconds for a deployment to make progress before it is considered to be failed.
        // The deployment controller will continue to process failed deployments and a condition with a ProgressDeadlineExceeded reason will be surfaced in the deployment status.
        // Once autoRollback is implemented, the deployment controller will automatically rollback failed deployments.
        // Note that progress will not be estimated during the time a deployment is paused.
        // Defaults to 600s..
            assert utils.asserts.type(value, 'integer', 'progressDeadlineSeconds');
            kutils.mixin({"progressDeadlineSeconds": value}, path, partial)
        ),

        MinReadySeconds(value, partial=false):: (
        // Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available.
        // Defaults to 0 (pod will be considered available as soon as it is ready).
            assert utils.asserts.type(value, 'integer', 'minReadySeconds');
            kutils.mixin({"minReadySeconds": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewStatus":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReviewStatus"},

        allowed: null,

        Reason(value, partial=false):: (
        // Reason is optional.
        // It indicates why a request was allowed or denied..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        EvaluationError(value, partial=false):: (
        // EvaluationError is an indication that some error occurred during the authorization check.
        // It is entirely possible to get an error and be able to continue determine authorization status in spite of it.
        // For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request..
            assert utils.asserts.type(value, 'string', 'evaluationError');
            kutils.mixin({"evaluationError": value}, path, partial)
        ),

        Allowed(value, partial=false):: (
        // Allowed is required.
        // True if the action would be allowed, false otherwise..
            assert utils.asserts.type(value, 'boolean', 'allowed');
            kutils.mixin({"allowed": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.CrossVersionObjectReference":: function(path=function(patch){}) {
        _ref: {name: "CrossVersionObjectReference"},

        kind: null,

        name: null,

        Kind(value, partial=false):: (
        // Kind of the referent; More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds".
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent; More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // API version of the referent.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PortworxVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "PortworxVolumeSource"},

        volumeID: null,

        ReadOnly(value, partial=false):: (
        // Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        VolumeID(value, partial=false):: (
        // VolumeID uniquely identifies a Portworx volume.
            assert utils.asserts.type(value, 'string', 'volumeID');
            kutils.mixin({"volumeID": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NodeCondition":: function(path=function(patch){}) {
        _ref: {name: "NodeCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        LastHeartbeatTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastHeartbeatTime+: patch})),
        Reason(value, partial=false):: (
        // (brief) reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // Human readable message indicating details about last transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of node condition..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EndpointSubset":: function(path=function(patch){}) {
        _ref: {name: "EndpointSubset"},

        Ports(value, partial=false):: (
        // Port numbers available on the related IP addresses..
            assert utils.asserts.type(value, 'array', 'ports');
            kutils.mixin({"ports": value}, path, partial)
        ),

        Addresses(value, partial=false):: (
        // IP addresses which offer the related ports that are marked as ready.
        // These endpoints should be considered safe for load balancers and clients to utilize..
            assert utils.asserts.type(value, 'array', 'addresses');
            kutils.mixin({"addresses": value}, path, partial)
        ),

        NotReadyAddresses(value, partial=false):: (
        // IP addresses which offer the related ports but are not currently marked as ready because they have not yet finished starting, have recently failed a readiness check, or have recently failed a liveness check..
            assert utils.asserts.type(value, 'array', 'notReadyAddresses');
            kutils.mixin({"notReadyAddresses": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReviewSpec"},

        User(value, partial=false):: (
        // User is the user you're testing for.
        // If you specify "User" but not "Groups", then is it interpreted as "What if User were not a member of any groups.
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

        NonResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.NonResourceAttributes'](function(patch) path({nonResourceAttributes+: patch})),
        ResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.ResourceAttributes'](function(patch) path({resourceAttributes+: patch})),
        Groups(value, partial=false):: (
        // Groups is the groups you're testing for..
            assert utils.asserts.type(value, 'array', 'groups');
            kutils.mixin({"groups": value}, path, partial)
        ),

        Extra(value, partial=false):: (
        // Extra corresponds to the user.Info.GetExtra() method from the authenticator.
        // Since that is input to the authorizer it needs a reflection here..
            assert utils.asserts.type(value, 'object', 'extra');
            kutils.mixin({"extra": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.ScaleSpec":: function(path=function(patch){}) {
        _ref: {name: "ScaleSpec"},

        Replicas(value, partial=false):: (
        // desired number of instances for the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleRef":: function(path=function(patch){}) {
        _ref: {name: "RoleRef"},

        apiGroup: null,

        kind: null,

        name: null,

        ApiGroup(value, partial=false):: (
        // APIGroup is the group for the resource being referenced.
            assert utils.asserts.type(value, 'string', 'apiGroup');
            kutils.mixin({"apiGroup": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is the type of resource being referenced.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name is the name of resource being referenced.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressSpec":: function(path=function(patch){}) {
        _ref: {name: "IngressSpec"},

        Rules(value, partial=false):: (
        // A list of host rules used to configure the Ingress.
        // If unspecified, or no rule matches, all traffic is sent to the default backend..
            assert utils.asserts.type(value, 'array', 'rules');
            kutils.mixin({"rules": value}, path, partial)
        ),

        Tls(value, partial=false):: (
        // TLS configuration.
        // Currently the Ingress only supports a single TLS port, 443.
        // If multiple members of this list specify different hosts, they will be multiplexed on the same port according to the hostname specified through the SNI TLS extension, if the ingress controller fulfilling the ingress supports SNI..
            assert utils.asserts.type(value, 'array', 'tls');
            kutils.mixin({"tls": value}, path, partial)
        ),

        Backend::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressBackend'](function(patch) path({backend+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReviewSpec"},

        User(value, partial=false):: (
        // User is the user you're testing for.
        // If you specify "User" but not "Group", then is it interpreted as "What if User were not a member of any groups.
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

        NonResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.NonResourceAttributes'](function(patch) path({nonResourceAttributes+: patch})),
        Group(value, partial=false):: (
        // Groups is the groups you're testing for..
            assert utils.asserts.type(value, 'array', 'group');
            kutils.mixin({"group": value}, path, partial)
        ),

        ResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.ResourceAttributes'](function(patch) path({resourceAttributes+: patch})),
        Extra(value, partial=false):: (
        // Extra corresponds to the user.Info.GetExtra() method from the authenticator.
        // Since that is input to the authorizer it needs a reflection here..
            assert utils.asserts.type(value, 'object', 'extra');
            kutils.mixin({"extra": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicyIngressRule":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicyIngressRule"},

        From(value, partial=false):: (
        // List of sources which should be able to access the pods selected for this rule.
        // Items in this list are combined using a logical OR operation.
        // If this field is not provided, this rule matches all sources (traffic not restricted by source).
        // If this field is empty, this rule matches no sources (no traffic matches).
        // If this field is present and contains at least on item, this rule allows traffic only if the traffic matches at least one item in the from list..
            assert utils.asserts.type(value, 'array', 'from');
            kutils.mixin({"from": value}, path, partial)
        ),

        Ports(value, partial=false):: (
        // List of ports which should be made accessible on the pods selected for this rule.
        // Each item in this list is combined using a logical OR.
        // If this field is not provided, this rule matches all ports (traffic not restricted by port).
        // If this field is empty, this rule matches no ports (no traffic matches).
        // If this field is present and contains at least one item, then this rule allows traffic only if the traffic matches at least one port in the list..
            assert utils.asserts.type(value, 'array', 'ports');
            kutils.mixin({"ports": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaim":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeClaim"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.SecretList":: function(path=function(patch){}) {
        _ref: {name: "SecretList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of secret objects.
        // More info: http://kubernetes.io/docs/user-guide/secrets.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.SecretEnvSource":: function(path=function(patch){}) {
        _ref: {name: "SecretEnvSource"},

        Optional(value, partial=false):: (
        // Specify whether the Secret must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.Capabilities":: function(path=function(patch){}) {
        _ref: {name: "Capabilities"},

        Add(value, partial=false):: (
        // Added capabilities.
            assert utils.asserts.type(value, 'array', 'add');
            kutils.mixin({"add": value}, path, partial)
        ),

        Drop(value, partial=false):: (
        // Removed capabilities.
            assert utils.asserts.type(value, 'array', 'drop');
            kutils.mixin({"drop": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceQuotaStatus":: function(path=function(patch){}) {
        _ref: {name: "ResourceQuotaStatus"},

        Hard(value, partial=false):: (
        // Hard is the set of enforced hard limits for each named resource.
        // More info: http://releases.k8s.io/HEAD/docs/design/admission_control_resource_quota.md#admissioncontrol-plugin-resourcequota.
            assert utils.asserts.type(value, 'object', 'hard');
            kutils.mixin({"hard": value}, path, partial)
        ),

        Used(value, partial=false):: (
        // Used is the current observed total usage of the resource in the namespace..
            assert utils.asserts.type(value, 'object', 'used');
            kutils.mixin({"used": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.OwnerReference":: function(path=function(patch){}) {
        _ref: {name: "OwnerReference"},

        apiVersion: null,

        kind: null,

        name: null,

        uid: null,

        Kind(value, partial=false):: (
        // Kind of the referent.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // UID of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#uids.
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // API version of the referent..
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Controller(value, partial=false):: (
        // If true, this reference points to the managing controller..
            assert utils.asserts.type(value, 'boolean', 'controller');
            kutils.mixin({"controller": value}, path, partial)
        ),

        BlockOwnerDeletion(value, partial=false):: (
        // If true, AND if the owner has the "foregroundDeletion" finalizer, then the owner cannot be deleted from the key-value store until this reference is removed.
        // Defaults to false.
        // To set this field, a user needs "delete" permission of the owner, otherwise 422 (Unprocessable Entity) will be returned..
            assert utils.asserts.type(value, 'boolean', 'blockOwnerDeletion');
            kutils.mixin({"blockOwnerDeletion": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.settings.v1alpha1.PodPreset":: function(path=function(patch){}) {
        _ref: {name: "PodPreset"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.settings.v1alpha1.PodPresetSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetSpec":: function(path=function(patch){}) {
        _ref: {name: "ReplicaSetSpec"},

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        Replicas(value, partial=false):: (
        // Replicas is the number of desired replicas.
        // This is a pointer to distinguish between explicit zero and unspecified.
        // Defaults to 1.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller#what-is-a-replication-controller.
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        MinReadySeconds(value, partial=false):: (
        // Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available.
        // Defaults to 0 (pod will be considered available as soon as it is ready).
            assert utils.asserts.type(value, 'integer', 'minReadySeconds');
            kutils.mixin({"minReadySeconds": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PhotonPersistentDiskVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "PhotonPersistentDiskVolumeSource"},

        pdID: null,

        PdID(value, partial=false):: (
        // ID that identifies Photon Controller persistent disk.
            assert utils.asserts.type(value, 'string', 'pdID');
            kutils.mixin({"pdID": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.SecretVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "SecretVolumeSource"},

        Items(value, partial=false):: (
        // If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value.
        // If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present.
        // If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional.
        // Paths must be relative and may not contain the '..' path or start with '..'..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Optional(value, partial=false):: (
        // Specify whether the Secret or it's keys must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        DefaultMode(value, partial=false):: (
        // Optional: mode bits to use on created files by default.
        // Must be a value between 0 and 0777.
        // Defaults to 0644.
        // Directories within the path are not affected by this setting.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'defaultMode');
            kutils.mixin({"defaultMode": value}, path, partial)
        ),

        SecretName(value, partial=false):: (
        // Name of the secret in the pod's namespace to use.
        // More info: http://kubernetes.io/docs/user-guide/volumes#secrets.
            assert utils.asserts.type(value, 'string', 'secretName');
            kutils.mixin({"secretName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimSpec":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeClaimSpec"},

        StorageClassName(value, partial=false):: (
        // Name of the StorageClass required by the claim.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#class-1.
            assert utils.asserts.type(value, 'string', 'storageClassName');
            kutils.mixin({"storageClassName": value}, path, partial)
        ),

        AccessModes(value, partial=false):: (
        // AccessModes contains the desired access modes the volume should have.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#access-modes-1.
            assert utils.asserts.type(value, 'array', 'accessModes');
            kutils.mixin({"accessModes": value}, path, partial)
        ),

        VolumeName(value, partial=false):: (
        // VolumeName is the binding reference to the PersistentVolume backing this claim..
            assert utils.asserts.type(value, 'string', 'volumeName');
            kutils.mixin({"volumeName": value}, path, partial)
        ),

        Resources::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceRequirements'](function(patch) path({resources+: patch})),
        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimList":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeClaimList"},

        items: [],

        Items(value, partial=false):: (
        // A list of persistent volume claims.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#persistentvolumeclaims.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ObjectReference":: function(path=function(patch){}) {
        _ref: {name: "ObjectReference"},

        Kind(value, partial=false):: (
        // Kind of the referent.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace of the referent.
        // More info: http://kubernetes.io/docs/user-guide/namespaces.
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // API version of the referent..
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        FieldPath(value, partial=false):: (
        // If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2].
        // For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod).
        // This syntax is chosen only to have some well-defined way of referencing a part of an object..
            assert utils.asserts.type(value, 'string', 'fieldPath');
            kutils.mixin({"fieldPath": value}, path, partial)
        ),

        ResourceVersion(value, partial=false):: (
        // Specific resourceVersion to which this reference is made, if any.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#concurrency-control-and-consistency.
            assert utils.asserts.type(value, 'string', 'resourceVersion');
            kutils.mixin({"resourceVersion": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // UID of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#uids.
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PodCondition":: function(path=function(patch){}) {
        _ref: {name: "PodCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status is the status of the condition.
        // Can be True, False, Unknown.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#pod-conditions.
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // Unique, one-word, CamelCase reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        LastProbeTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastProbeTime+: patch})),
        Message(value, partial=false):: (
        // Human-readable message indicating details about last transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type is the type of the condition.
        // Currently only Ready.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#pod-conditions.
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleRef":: function(path=function(patch){}) {
        _ref: {name: "RoleRef"},

        apiGroup: null,

        kind: null,

        name: null,

        ApiGroup(value, partial=false):: (
        // APIGroup is the group for the resource being referenced.
            assert utils.asserts.type(value, 'string', 'apiGroup');
            kutils.mixin({"apiGroup": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is the type of resource being referenced.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name is the name of resource being referenced.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.MetricStatus":: function(path=function(patch){}) {
        _ref: {name: "MetricStatus"},

        type: null,

        Resource::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ResourceMetricStatus'](function(patch) path({resource+: patch})),
        Object::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ObjectMetricStatus'](function(patch) path({object+: patch})),
        Pods::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.PodsMetricStatus'](function(patch) path({pods+: patch})),
        Type(value, partial=false):: (
        // type is the type of metric source.
        // It will match one of the fields below..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressStatus":: function(path=function(patch){}) {
        _ref: {name: "IngressStatus"},

        LoadBalancer::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LoadBalancerStatus'](function(patch) path({loadBalancer+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMapEnvSource":: function(path=function(patch){}) {
        _ref: {name: "ConfigMapEnvSource"},

        Optional(value, partial=false):: (
        // Specify whether the ConfigMap must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestCondition":: function(path=function(patch){}) {
        _ref: {name: "CertificateSigningRequestCondition"},

        type: null,

        Message(value, partial=false):: (
        // human readable message with details about the request state.
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // request approval state, currently Approved or Denied..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // brief reason for the request state.
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        LastUpdateTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastUpdateTime+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerState":: function(path=function(patch){}) {
        _ref: {name: "ContainerState"},

        Terminated::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ContainerStateTerminated'](function(patch) path({terminated+: patch})),
        Running::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ContainerStateRunning'](function(patch) path({running+: patch})),
        Waiting::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ContainerStateWaiting'](function(patch) path({waiting+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1beta1.TokenReview":: function(path=function(patch){}) {
        _ref: {name: "TokenReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1beta1.TokenReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1beta1.TokenReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.GroupVersionForDiscovery":: function(path=function(patch){}) {
        _ref: {name: "GroupVersionForDiscovery"},

        groupVersion: null,

        version: null,

        GroupVersion(value, partial=false):: (
        // groupVersion specifies the API group and version in the form "group/version".
            assert utils.asserts.type(value, 'string', 'groupVersion');
            kutils.mixin({"groupVersion": value}, path, partial)
        ),

        Version(value, partial=false):: (
        // version specifies the version in the form of "version".
        // This is to save the clients the trouble of splitting the GroupVersion..
            assert utils.asserts.type(value, 'string', 'version');
            kutils.mixin({"version": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceQuotaSpec":: function(path=function(patch){}) {
        _ref: {name: "ResourceQuotaSpec"},

        Scopes(value, partial=false):: (
        // A collection of filters that must match each object tracked by a quota.
        // If not specified, the quota matches all objects..
            assert utils.asserts.type(value, 'array', 'scopes');
            kutils.mixin({"scopes": value}, path, partial)
        ),

        Hard(value, partial=false):: (
        // Hard is the set of desired hard limits for each named resource.
        // More info: http://releases.k8s.io/HEAD/docs/design/admission_control_resource_quota.md#admissioncontrol-plugin-resourcequota.
            assert utils.asserts.type(value, 'object', 'hard');
            kutils.mixin({"hard": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.PodSecurityPolicyList":: function(path=function(patch){}) {
        _ref: {name: "PodSecurityPolicyList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of schema objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.ClusterRoleBinding":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleBinding"},

        subjects: [],

        roleRef: null,

        RoleRef::
           topSelf['io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleRef'](function(patch) path({roleRef+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Subjects(value, partial=false):: (
        // Subjects holds references to the objects the role applies to..
            assert utils.asserts.type(value, 'array', 'subjects');
            kutils.mixin({"subjects": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleBindingList":: function(path=function(patch){}) {
        _ref: {name: "RoleBindingList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of RoleBindings.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.EmptyDirVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "EmptyDirVolumeSource"},

        Medium(value, partial=false):: (
        // What type of storage medium should back this directory.
        // The default is "" which means to use the node's default medium.
        // Must be an empty string (default) or Memory.
        // More info: http://kubernetes.io/docs/user-guide/volumes#emptydir.
            assert utils.asserts.type(value, 'string', 'medium');
            kutils.mixin({"medium": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.LocalSubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "LocalSubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.settings.v1alpha1.PodPresetList":: function(path=function(patch){}) {
        _ref: {name: "PodPresetList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of schema objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.ClusterRoleList":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of ClusterRoles.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSetStatus":: function(path=function(patch){}) {
        _ref: {name: "StatefulSetStatus"},

        replicas: null,

        ObservedGeneration(value, partial=false):: (
        // most recent generation observed by this StatefulSet..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        Replicas(value, partial=false):: (
        // Replicas is the number of actual replicas..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleBindingList":: function(path=function(patch){}) {
        _ref: {name: "RoleBindingList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of RoleBindings.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.LimitRangeList":: function(path=function(patch){}) {
        _ref: {name: "LimitRangeList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of LimitRange objects.
        // More info: http://releases.k8s.io/HEAD/docs/design/admission_control_limit_range.md.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.AzureFileVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "AzureFileVolumeSource"},

        secretName: null,

        shareName: null,

        ShareName(value, partial=false):: (
        // Share Name.
            assert utils.asserts.type(value, 'string', 'shareName');
            kutils.mixin({"shareName": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        SecretName(value, partial=false):: (
        // the name of secret that contains Azure Storage Account Name and Key.
            assert utils.asserts.type(value, 'string', 'secretName');
            kutils.mixin({"secretName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.DownwardAPIVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "DownwardAPIVolumeSource"},

        Items(value, partial=false):: (
        // Items is a list of downward API volume file.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        DefaultMode(value, partial=false):: (
        // Optional: mode bits to use on created files by default.
        // Must be a value between 0 and 0777.
        // Defaults to 0644.
        // Directories within the path are not affected by this setting.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'defaultMode');
            kutils.mixin({"defaultMode": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ScaleStatus":: function(path=function(patch){}) {
        _ref: {name: "ScaleStatus"},

        replicas: null,

        Selector(value, partial=false):: (
        // label query over pods that should match the replicas count.
        // More info: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'object', 'selector');
            kutils.mixin({"selector": value}, path, partial)
        ),

        TargetSelector(value, partial=false):: (
        // label selector for pods that should match the replicas count.
        // This is a serializated version of both map-based and more expressive set-based selectors.
        // This is done to avoid introspection in the clients.
        // The string will be in the same format as the query-param syntax.
        // If the target type only supports map-based selectors, both this field and map-based selector field are populated.
        // More info: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'string', 'targetSelector');
            kutils.mixin({"targetSelector": value}, path, partial)
        ),

        Replicas(value, partial=false):: (
        // actual number of observed instances of the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta":: function(path=function(patch){}) {
        _ref: {name: "ObjectMeta"},

        OwnerReferences(value, partial=false):: (
        // List of objects depended by this object.
        // If ALL objects in the list have been deleted, this object will be garbage collected.
        // If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true.
        // There cannot be more than one managing controller..
            assert utils.asserts.type(value, 'array', 'ownerReferences');
            kutils.mixin({"ownerReferences": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name must be unique within a namespace.
        // Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically.
        // Name is primarily intended for creation idempotence and configuration definition.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        DeletionTimestamp::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({deletionTimestamp+: patch})),
        ClusterName(value, partial=false):: (
        // The name of the cluster which the object belongs to.
        // This is used to distinguish resources with same name and namespace in different clusters.
        // This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request..
            assert utils.asserts.type(value, 'string', 'clusterName');
            kutils.mixin({"clusterName": value}, path, partial)
        ),

        DeletionGracePeriodSeconds(value, partial=false):: (
        // Number of seconds allowed for this object to gracefully terminate before it will be removed from the system.
        // Only set when deletionTimestamp is also set.
        // May only be shortened.
        // Read-only..
            assert utils.asserts.type(value, 'integer', 'deletionGracePeriodSeconds');
            kutils.mixin({"deletionGracePeriodSeconds": value}, path, partial)
        ),

        Labels(value, partial=false):: (
        // Map of string keys and values that can be used to organize and categorize (scope and select) objects.
        // May match selectors of replication controllers and services.
        // More info: http://kubernetes.io/docs/user-guide/labels.
            assert utils.asserts.type(value, 'object', 'labels');
            kutils.mixin({"labels": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace defines the space within each name must be unique.
        // An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation.
        // Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.Must be a DNS_LABEL.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/namespaces.
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        Generation(value, partial=false):: (
        // A sequence number representing a specific generation of the desired state.
        // Populated by the system.
        // Read-only..
            assert utils.asserts.type(value, 'integer', 'generation');
            kutils.mixin({"generation": value}, path, partial)
        ),

        Finalizers(value, partial=false):: (
        // Must be empty before the object is deleted from the registry.
        // Each entry is an identifier for the responsible component that will remove the entry from the list.
        // If the deletionTimestamp of the object is non-nil, entries in this list can only be removed..
            assert utils.asserts.type(value, 'array', 'finalizers');
            kutils.mixin({"finalizers": value}, path, partial)
        ),

        ResourceVersion(value, partial=false):: (
        // An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed.
        // May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources.
        // Clients must treat these values as opaque and passed unmodified back to the server.
        // They may only be valid for a particular resource or set of resources.Populated by the system.
        // Read-only.
        // Value must be treated as opaque by clients and.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#concurrency-control-and-consistency.
            assert utils.asserts.type(value, 'string', 'resourceVersion');
            kutils.mixin({"resourceVersion": value}, path, partial)
        ),

        GenerateName(value, partial=false):: (
        // GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided.
        // If this field is used, the name returned to the client will be different than the name passed.
        // This value will also be combined with a unique suffix.
        // The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).Applied only if Name is not specified.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#idempotency.
            assert utils.asserts.type(value, 'string', 'generateName');
            kutils.mixin({"generateName": value}, path, partial)
        ),

        CreationTimestamp::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({creationTimestamp+: patch})),
        Annotations(value, partial=false):: (
        // Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata.
        // They are not queryable and should be preserved when modifying objects.
        // More info: http://kubernetes.io/docs/user-guide/annotations.
            assert utils.asserts.type(value, 'object', 'annotations');
            kutils.mixin({"annotations": value}, path, partial)
        ),

        SelfLink(value, partial=false):: (
        // SelfLink is a URL representing this object.
        // Populated by the system.
        // Read-only..
            assert utils.asserts.type(value, 'string', 'selfLink');
            kutils.mixin({"selfLink": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // UID is the unique in time and space value for this object.
        // It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.Populated by the system.
        // Read-only.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#uids.
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.storage.v1.StorageClassList":: function(path=function(patch){}) {
        _ref: {name: "StorageClassList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of StorageClasses.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Handler":: function(path=function(patch){}) {
        _ref: {name: "Handler"},

        HttpGet::
           topSelf['io.k8s.kubernetes.pkg.api.v1.HTTPGetAction'](function(patch) path({httpGet+: patch})),
        TcpSocket::
           topSelf['io.k8s.kubernetes.pkg.api.v1.TCPSocketAction'](function(patch) path({tcpSocket+: patch})),
        Exec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ExecAction'](function(patch) path({exec+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Namespace":: function(path=function(patch){}) {
        _ref: {name: "Namespace"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NamespaceStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NamespaceSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Event":: function(path=function(patch){}) {
        _ref: {name: "Event"},

        metadata: null,

        involvedObject: null,

        Count(value, partial=false):: (
        // The number of times this event has occurred..
            assert utils.asserts.type(value, 'integer', 'count');
            kutils.mixin({"count": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        FirstTimestamp::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({firstTimestamp+: patch})),
        LastTimestamp::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTimestamp+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Source::
           topSelf['io.k8s.kubernetes.pkg.api.v1.EventSource'](function(patch) path({source+: patch})),
        Reason(value, partial=false):: (
        // This should be a short, machine understandable string that gives the reason for the transition into the object's current status..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        InvolvedObject::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectReference'](function(patch) path({involvedObject+: patch})),
        Message(value, partial=false):: (
        // A human-readable description of the status of this operation..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of this event (Normal, Warning), new types could be added in the future.
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.ScaleStatus":: function(path=function(patch){}) {
        _ref: {name: "ScaleStatus"},

        replicas: null,

        Selector(value, partial=false):: (
        // label query over pods that should match the replicas count.
        // More info: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'object', 'selector');
            kutils.mixin({"selector": value}, path, partial)
        ),

        TargetSelector(value, partial=false):: (
        // label selector for pods that should match the replicas count.
        // This is a serializated version of both map-based and more expressive set-based selectors.
        // This is done to avoid introspection in the clients.
        // The string will be in the same format as the query-param syntax.
        // If the target type only supports map-based selectors, both this field and map-based selector field are populated.
        // More info: http://kubernetes.io/docs/user-guide/labels#label-selectors.
            assert utils.asserts.type(value, 'string', 'targetSelector');
            kutils.mixin({"targetSelector": value}, path, partial)
        ),

        Replicas(value, partial=false):: (
        // actual number of observed instances of the scaled object..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceFieldSelector":: function(path=function(patch){}) {
        _ref: {name: "ResourceFieldSelector"},

        resource: null,

        ContainerName(value, partial=false):: (
        // Container name: required for volumes, optional for env vars.
            assert utils.asserts.type(value, 'string', 'containerName');
            kutils.mixin({"containerName": value}, path, partial)
        ),

        Resource(value, partial=false):: (
        // Required: resource to select.
            assert utils.asserts.type(value, 'string', 'resource');
            kutils.mixin({"resource": value}, path, partial)
        ),

        Divisor::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({divisor+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.storage.v1.StorageClass":: function(path=function(patch){}) {
        _ref: {name: "StorageClass"},

        provisioner: null,

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Provisioner(value, partial=false):: (
        // Provisioner indicates the type of the provisioner..
            assert utils.asserts.type(value, 'string', 'provisioner');
            kutils.mixin({"provisioner": value}, path, partial)
        ),

        Parameters(value, partial=false):: (
        // Parameters holds the parameters for the provisioner that should create volumes of this storage class..
            assert utils.asserts.type(value, 'object', 'parameters');
            kutils.mixin({"parameters": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.SelfSubjectAccessReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "SelfSubjectAccessReviewSpec"},

        NonResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.NonResourceAttributes'](function(patch) path({nonResourceAttributes+: patch})),
        ResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.ResourceAttributes'](function(patch) path({resourceAttributes+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.AttachedVolume":: function(path=function(patch){}) {
        _ref: {name: "AttachedVolume"},

        name: null,

        devicePath: null,

        DevicePath(value, partial=false):: (
        // DevicePath represents the device path where the volume should be available.
            assert utils.asserts.type(value, 'string', 'devicePath');
            kutils.mixin({"devicePath": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the attached volume.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.StatefulSetSpec":: function(path=function(patch){}) {
        _ref: {name: "StatefulSetSpec"},

        template: null,

        serviceName: null,

        ServiceName(value, partial=false):: (
        // ServiceName is the name of the service that governs this StatefulSet.
        // This service must exist before the StatefulSet, and is responsible for the network identity of the set.
        // Pods get DNS/hostnames that follow the pattern: pod-specific-string.serviceName.default.svc.cluster.local where "pod-specific-string" is managed by the StatefulSet controller..
            assert utils.asserts.type(value, 'string', 'serviceName');
            kutils.mixin({"serviceName": value}, path, partial)
        ),

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        VolumeClaimTemplates(value, partial=false):: (
        // VolumeClaimTemplates is a list of claims that pods are allowed to reference.
        // The StatefulSet controller is responsible for mapping network identities to claims in a way that maintains the identity of a pod.
        // Every claim in this list must have at least one matching (by name) volumeMount in one container in the template.
        // A claim in this list takes precedence over any volumes in the template, with the same name..
            assert utils.asserts.type(value, 'array', 'volumeClaimTemplates');
            kutils.mixin({"volumeClaimTemplates": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        Replicas(value, partial=false):: (
        // Replicas is the desired number of replicas of the given Template.
        // These are replicas in the sense that they are instantiations of the same Template, but individual replicas also have a consistent identity.
        // If unspecified, defaults to 1..
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.Deployment":: function(path=function(patch){}) {
        _ref: {name: "Deployment"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.StatusDetails":: function(path=function(patch){}) {
        _ref: {name: "StatusDetails"},

        RetryAfterSeconds(value, partial=false):: (
        // If specified, the time in seconds before the operation should be retried..
            assert utils.asserts.type(value, 'integer', 'retryAfterSeconds');
            kutils.mixin({"retryAfterSeconds": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // The kind attribute of the resource associated with the status StatusReason.
        // On some operations may differ from the requested resource Kind.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Group(value, partial=false):: (
        // The group attribute of the resource associated with the status StatusReason..
            assert utils.asserts.type(value, 'string', 'group');
            kutils.mixin({"group": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // The name attribute of the resource associated with the status StatusReason (when there is a single name which can be described)..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Causes(value, partial=false):: (
        // The Causes array includes more details associated with the StatusReason failure.
        // Not all StatusReasons may provide detailed causes..
            assert utils.asserts.type(value, 'array', 'causes');
            kutils.mixin({"causes": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceQuotaList":: function(path=function(patch){}) {
        _ref: {name: "ResourceQuotaList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of ResourceQuota objects.
        // More info: http://releases.k8s.io/HEAD/docs/design/admission_control_resource_quota.md#admissioncontrol-plugin-resourcequota.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.LimitRangeSpec":: function(path=function(patch){}) {
        _ref: {name: "LimitRangeSpec"},

        limits: [],

        Limits(value, partial=false):: (
        // Limits is the list of LimitRangeItem objects that are enforced..
            assert utils.asserts.type(value, 'array', 'limits');
            kutils.mixin({"limits": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.FlexVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "FlexVolumeSource"},

        driver: null,

        SecretRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LocalObjectReference'](function(patch) path({secretRef+: patch})),
        ReadOnly(value, partial=false):: (
        // Optional: Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Driver(value, partial=false):: (
        // Driver is the name of the driver to use for this volume..
            assert utils.asserts.type(value, 'string', 'driver');
            kutils.mixin({"driver": value}, path, partial)
        ),

        Options(value, partial=false):: (
        // Optional: Extra command options if any..
            assert utils.asserts.type(value, 'object', 'options');
            kutils.mixin({"options": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Ex.
        // "ext4", "xfs", "ntfs".
        // The default filesystem depends on FlexVolume script..
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PodAffinity":: function(path=function(patch){}) {
        _ref: {name: "PodAffinity"},

        RequiredDuringSchedulingIgnoredDuringExecution(value, partial=false):: (
        // NOT YET IMPLEMENTED.
        // TODO: Uncomment field once it is implemented.
        // If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node.
        // If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g.
        // due to a pod label update), the system will try to eventually evict the pod from its node.
        // When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e.
        // all terms must be satisfied.
        // RequiredDuringSchedulingRequiredDuringExecution []PodAffinityTerm  `json:"requiredDuringSchedulingRequiredDuringExecution,omitempty"` If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node.
        // If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g.
        // due to a pod label update), the system may or may not try to eventually evict the pod from its node.
        // When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e.
        // all terms must be satisfied..
            assert utils.asserts.type(value, 'array', 'requiredDuringSchedulingIgnoredDuringExecution');
            kutils.mixin({"requiredDuringSchedulingIgnoredDuringExecution": value}, path, partial)
        ),

        PreferredDuringSchedulingIgnoredDuringExecution(value, partial=false):: (
        // The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions.
        // The node that is most preferred is the one with the greatest sum of weights, i.e.
        // for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred..
            assert utils.asserts.type(value, 'array', 'preferredDuringSchedulingIgnoredDuringExecution');
            kutils.mixin({"preferredDuringSchedulingIgnoredDuringExecution": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.SELinuxStrategyOptions":: function(path=function(patch){}) {
        _ref: {name: "SELinuxStrategyOptions"},

        rule: null,

        SeLinuxOptions::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SELinuxOptions'](function(patch) path({seLinuxOptions+: patch})),
        Rule(value, partial=false):: (
        // type is the strategy that will dictate the allowable labels that may be set..
            assert utils.asserts.type(value, 'string', 'rule');
            kutils.mixin({"rule": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1.TokenReviewStatus":: function(path=function(patch){}) {
        _ref: {name: "TokenReviewStatus"},

        Authenticated(value, partial=false):: (
        // Authenticated indicates that the token was associated with a known user..
            assert utils.asserts.type(value, 'boolean', 'authenticated');
            kutils.mixin({"authenticated": value}, path, partial)
        ),

        User::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1.UserInfo'](function(patch) path({user+: patch})),
        Error(value, partial=false):: (
        // Error indicates that the token couldn't be checked.
            assert utils.asserts.type(value, 'string', 'error');
            kutils.mixin({"error": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleBinding":: function(path=function(patch){}) {
        _ref: {name: "RoleBinding"},

        subjects: [],

        roleRef: null,

        RoleRef::
           topSelf['io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleRef'](function(patch) path({roleRef+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Subjects(value, partial=false):: (
        // Subjects holds references to the objects the role applies to..
            assert utils.asserts.type(value, 'array', 'subjects');
            kutils.mixin({"subjects": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ServicePort":: function(path=function(patch){}) {
        _ref: {name: "ServicePort"},

        port: null,

        Port(value, partial=false):: (
        // The port that will be exposed by this service..
            assert utils.asserts.type(value, 'integer', 'port');
            kutils.mixin({"port": value}, path, partial)
        ),

        TargetPort::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({targetPort+: patch})),
        Protocol(value, partial=false):: (
        // The IP protocol for this port.
        // Supports "TCP" and "UDP".
        // Default is TCP..
            assert utils.asserts.type(value, 'string', 'protocol');
            kutils.mixin({"protocol": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // The name of this port within the service.
        // This must be a DNS_LABEL.
        // All ports within a ServiceSpec must have unique names.
        // This maps to the 'Name' field in EndpointPort objects.
        // Optional if only one ServicePort is defined on this service..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        NodePort(value, partial=false):: (
        // The port on each node on which this service is exposed when type=NodePort or LoadBalancer.
        // Usually assigned by the system.
        // If specified, it will be allocated to the service if unused or else creation of the service will fail.
        // Default is to auto-allocate a port if the ServiceType of this Service requires one.
        // More info: http://kubernetes.io/docs/user-guide/services#type--nodeport.
            assert utils.asserts.type(value, 'integer', 'nodePort');
            kutils.mixin({"nodePort": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ProjectedVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "ProjectedVolumeSource"},

        sources: [],

        Sources(value, partial=false):: (
        // list of volume projections.
            assert utils.asserts.type(value, 'array', 'sources');
            kutils.mixin({"sources": value}, path, partial)
        ),

        DefaultMode(value, partial=false):: (
        // Mode bits to use on created files by default.
        // Must be a value between 0 and 0777.
        // Directories within the path are not affected by this setting.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'defaultMode');
            kutils.mixin({"defaultMode": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.Role":: function(path=function(patch){}) {
        _ref: {name: "Role"},

        rules: [],

        Rules(value, partial=false):: (
        // Rules holds all the PolicyRules for this Role.
            assert utils.asserts.type(value, 'array', 'rules');
            kutils.mixin({"rules": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.Preconditions":: function(path=function(patch){}) {
        _ref: {name: "Preconditions"},

        Uid(value, partial=false):: (
        // Specifies the target UID..
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.Scale":: function(path=function(patch){}) {
        _ref: {name: "Scale"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v1.ScaleStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v1.ScaleSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscalerSpec":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerSpec"},

        scaleTargetRef: null,

        maxReplicas: null,

        Metrics(value, partial=false):: (
        // metrics contains the specifications for which to use to calculate the desired replica count (the maximum replica count across all metrics will be used).
        // The desired replica count is calculated multiplying the ratio between the target value and the current value by the current number of pods.
        // Ergo, metrics used must decrease as the pod count is increased, and vice-versa.
        // See the individual metric source types for more information about how each type of metric must respond..
            assert utils.asserts.type(value, 'array', 'metrics');
            kutils.mixin({"metrics": value}, path, partial)
        ),

        MinReplicas(value, partial=false):: (
        // minReplicas is the lower limit for the number of replicas to which the autoscaler can scale down.
        // It defaults to 1 pod..
            assert utils.asserts.type(value, 'integer', 'minReplicas');
            kutils.mixin({"minReplicas": value}, path, partial)
        ),

        ScaleTargetRef::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.CrossVersionObjectReference'](function(patch) path({scaleTargetRef+: patch})),
        MaxReplicas(value, partial=false):: (
        // maxReplicas is the upper limit for the number of replicas to which the autoscaler can scale up.
        // It cannot be less that minReplicas..
            assert utils.asserts.type(value, 'integer', 'maxReplicas');
            kutils.mixin({"maxReplicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentRollback":: function(path=function(patch){}) {
        _ref: {name: "DeploymentRollback"},

        name: null,

        rollbackTo: null,

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        UpdatedAnnotations(value, partial=false):: (
        // The annotations to be updated to a deployment.
            assert utils.asserts.type(value, 'object', 'updatedAnnotations');
            kutils.mixin({"updatedAnnotations": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Required: This must match the Name of a deployment..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        RollbackTo::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.RollbackConfig'](function(patch) path({rollbackTo+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v2alpha1.JobTemplateSpec":: function(path=function(patch){}) {
        _ref: {name: "JobTemplateSpec"},

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v1.JobSpec'](function(patch) path({spec+: patch})),
        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Secret":: function(path=function(patch){}) {
        _ref: {name: "Secret"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Used to facilitate programmatic handling of secret data..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        StringData(value, partial=false):: (
        // stringData allows specifying non-binary secret data in string form.
        // It is provided as a write-only convenience method.
        // All keys and values are merged into the data field on write, overwriting any existing values.
        // It is never output when reading from the API..
            assert utils.asserts.type(value, 'object', 'stringData');
            kutils.mixin({"stringData": value}, path, partial)
        ),

        Data(value, partial=false):: (
        // Data contains the secret data.
        // Each key must be a valid DNS_SUBDOMAIN or leading dot followed by valid DNS_SUBDOMAIN.
        // The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here.
        // Described in https://tools.ietf.org/html/rfc4648#section-4.
            assert utils.asserts.type(value, 'object', 'data');
            kutils.mixin({"data": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentRollback":: function(path=function(patch){}) {
        _ref: {name: "DeploymentRollback"},

        name: null,

        rollbackTo: null,

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        UpdatedAnnotations(value, partial=false):: (
        // The annotations to be updated to a deployment.
            assert utils.asserts.type(value, 'object', 'updatedAnnotations');
            kutils.mixin({"updatedAnnotations": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Required: This must match the Name of a deployment..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        RollbackTo::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollbackConfig'](function(patch) path({rollbackTo+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SelfSubjectAccessReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "SelfSubjectAccessReviewSpec"},

        NonResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.NonResourceAttributes'](function(patch) path({nonResourceAttributes+: patch})),
        ResourceAttributes::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.ResourceAttributes'](function(patch) path({resourceAttributes+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetStatus":: function(path=function(patch){}) {
        _ref: {name: "DaemonSetStatus"},

        currentNumberScheduled: null,

        numberMisscheduled: null,

        desiredNumberScheduled: null,

        numberReady: null,

        NumberReady(value, partial=false):: (
        // The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and ready..
            assert utils.asserts.type(value, 'integer', 'numberReady');
            kutils.mixin({"numberReady": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // The most recent generation observed by the daemon set controller..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        NumberAvailable(value, partial=false):: (
        // The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds).
            assert utils.asserts.type(value, 'integer', 'numberAvailable');
            kutils.mixin({"numberAvailable": value}, path, partial)
        ),

        DesiredNumberScheduled(value, partial=false):: (
        // The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod).
        // More info: http://releases.k8s.io/HEAD/docs/admin/daemons.md.
            assert utils.asserts.type(value, 'integer', 'desiredNumberScheduled');
            kutils.mixin({"desiredNumberScheduled": value}, path, partial)
        ),

        NumberUnavailable(value, partial=false):: (
        // The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds).
            assert utils.asserts.type(value, 'integer', 'numberUnavailable');
            kutils.mixin({"numberUnavailable": value}, path, partial)
        ),

        CurrentNumberScheduled(value, partial=false):: (
        // The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod.
        // More info: http://releases.k8s.io/HEAD/docs/admin/daemons.md.
            assert utils.asserts.type(value, 'integer', 'currentNumberScheduled');
            kutils.mixin({"currentNumberScheduled": value}, path, partial)
        ),

        NumberMisscheduled(value, partial=false):: (
        // The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod.
        // More info: http://releases.k8s.io/HEAD/docs/admin/daemons.md.
            assert utils.asserts.type(value, 'integer', 'numberMisscheduled');
            kutils.mixin({"numberMisscheduled": value}, path, partial)
        ),

        UpdatedNumberScheduled(value, partial=false):: (
        // The total number of nodes that are running updated daemon pod.
            assert utils.asserts.type(value, 'integer', 'updatedNumberScheduled');
            kutils.mixin({"updatedNumberScheduled": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJobList":: function(path=function(patch){}) {
        _ref: {name: "CronJobList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of CronJob..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v1.JobList":: function(path=function(patch){}) {
        _ref: {name: "JobList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of Job..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.Scale":: function(path=function(patch){}) {
        _ref: {name: "Scale"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ScaleStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ScaleSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Taint":: function(path=function(patch){}) {
        _ref: {name: "Taint"},

        key: null,

        effect: null,

        Value(value, partial=false):: (
        // Required.
        // The taint value corresponding to the taint key..
            assert utils.asserts.type(value, 'string', 'value');
            kutils.mixin({"value": value}, path, partial)
        ),

        TimeAdded::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({timeAdded+: patch})),
        Effect(value, partial=false):: (
        // Required.
        // The effect of the taint on pods that do not tolerate the taint.
        // Valid effects are NoSchedule, PreferNoSchedule and NoExecute..
            assert utils.asserts.type(value, 'string', 'effect');
            kutils.mixin({"effect": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // Required.
        // The taint key to be applied to a node..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.policy.v1beta1.Eviction":: function(path=function(patch){}) {
        _ref: {name: "Eviction"},

        DeleteOptions::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.DeleteOptions'](function(patch) path({deleteOptions+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeDaemonEndpoints":: function(path=function(patch){}) {
        _ref: {name: "NodeDaemonEndpoints"},

        KubeletEndpoint::
           topSelf['io.k8s.kubernetes.pkg.api.v1.DaemonEndpoint'](function(patch) path({kubeletEndpoint+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ObjectFieldSelector":: function(path=function(patch){}) {
        _ref: {name: "ObjectFieldSelector"},

        fieldPath: null,

        FieldPath(value, partial=false):: (
        // Path of the field to select in the specified API version..
            assert utils.asserts.type(value, 'string', 'fieldPath');
            kutils.mixin({"fieldPath": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // Version of the schema the FieldPath is written in terms of, defaults to "v1"..
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.SecurityContext":: function(path=function(patch){}) {
        _ref: {name: "SecurityContext"},

        ReadOnlyRootFilesystem(value, partial=false):: (
        // Whether this container has a read-only root filesystem.
        // Default is false..
            assert utils.asserts.type(value, 'boolean', 'readOnlyRootFilesystem');
            kutils.mixin({"readOnlyRootFilesystem": value}, path, partial)
        ),

        RunAsUser(value, partial=false):: (
        // The UID to run the entrypoint of the container process.
        // Defaults to user specified in image metadata if unspecified.
        // May also be set in PodSecurityContext.
        // If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence..
            assert utils.asserts.type(value, 'integer', 'runAsUser');
            kutils.mixin({"runAsUser": value}, path, partial)
        ),

        Capabilities::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Capabilities'](function(patch) path({capabilities+: patch})),
        RunAsNonRoot(value, partial=false):: (
        // Indicates that the container must run as a non-root user.
        // If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does.
        // If unset or false, no such validation will be performed.
        // May also be set in PodSecurityContext.
        // If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence..
            assert utils.asserts.type(value, 'boolean', 'runAsNonRoot');
            kutils.mixin({"runAsNonRoot": value}, path, partial)
        ),

        SeLinuxOptions::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SELinuxOptions'](function(patch) path({seLinuxOptions+: patch})),
        Privileged(value, partial=false):: (
        // Run container in privileged mode.
        // Processes in privileged containers are essentially equivalent to root on the host.
        // Defaults to false..
            assert utils.asserts.type(value, 'boolean', 'privileged');
            kutils.mixin({"privileged": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMap":: function(path=function(patch){}) {
        _ref: {name: "ConfigMap"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Data(value, partial=false):: (
        // Data contains the configuration data.
        // Each key must be a valid DNS_SUBDOMAIN with an optional leading dot..
            assert utils.asserts.type(value, 'object', 'data');
            kutils.mixin({"data": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IDRange":: function(path=function(patch){}) {
        _ref: {name: "IDRange"},

        min: null,

        max: null,

        Max(value, partial=false):: (
        // Max is the end of the range, inclusive..
            assert utils.asserts.type(value, 'integer', 'max');
            kutils.mixin({"max": value}, path, partial)
        ),

        Min(value, partial=false):: (
        // Min is the start of the range, inclusive..
            assert utils.asserts.type(value, 'integer', 'min');
            kutils.mixin({"min": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestSpec":: function(path=function(patch){}) {
        _ref: {name: "CertificateSigningRequestSpec"},

        request: null,

        Username(value, partial=false):: (
        // Information about the requesting user.
        // See user.Info interface for details..
            assert utils.asserts.type(value, 'string', 'username');
            kutils.mixin({"username": value}, path, partial)
        ),

        Usages(value, partial=false):: (
        // allowedUsages specifies a set of usage contexts the key will be valid for.
        // See: https://tools.ietf.org/html/rfc5280#section-4.2.1.3     https://tools.ietf.org/html/rfc5280#section-4.2.1.12.
            assert utils.asserts.type(value, 'array', 'usages');
            kutils.mixin({"usages": value}, path, partial)
        ),

        Uid(value, partial=false):: (
        // UID information about the requesting user.
        // See user.Info interface for details..
            assert utils.asserts.type(value, 'string', 'uid');
            kutils.mixin({"uid": value}, path, partial)
        ),

        Extra(value, partial=false):: (
        // Extra information about the requesting user.
        // See user.Info interface for details..
            assert utils.asserts.type(value, 'object', 'extra');
            kutils.mixin({"extra": value}, path, partial)
        ),

        Request(value, partial=false):: (
        // Base64-encoded PKCS#10 CSR data.
            assert utils.asserts.type(value, 'string', 'request');
            kutils.mixin({"request": value}, path, partial)
        ),

        Groups(value, partial=false):: (
        // Group information about the requesting user.
        // See user.Info interface for details..
            assert utils.asserts.type(value, 'array', 'groups');
            kutils.mixin({"groups": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1.TokenReview":: function(path=function(patch){}) {
        _ref: {name: "TokenReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1.TokenReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1.TokenReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1beta1.TokenReviewSpec":: function(path=function(patch){}) {
        _ref: {name: "TokenReviewSpec"},

        Token(value, partial=false):: (
        // Token is the opaque bearer token..
            assert utils.asserts.type(value, 'string', 'token');
            kutils.mixin({"token": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.SecretProjection":: function(path=function(patch){}) {
        _ref: {name: "SecretProjection"},

        Items(value, partial=false):: (
        // If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value.
        // If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present.
        // If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional.
        // Paths must be relative and may not contain the '..' path or start with '..'..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Optional(value, partial=false):: (
        // Specify whether the Secret or its key must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SelfSubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "SelfSubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SelfSubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetSpec":: function(path=function(patch){}) {
        _ref: {name: "DaemonSetSpec"},

        template: null,

        UpdateStrategy::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetUpdateStrategy'](function(patch) path({updateStrategy+: patch})),
        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
        TemplateGeneration(value, partial=false):: (
        // A sequence number representing a specific generation of the template.
        // Populated by the system.
        // It can be set only during the creation..
            assert utils.asserts.type(value, 'integer', 'templateGeneration');
            kutils.mixin({"templateGeneration": value}, path, partial)
        ),

        Template::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec'](function(patch) path({template+: patch})),
        MinReadySeconds(value, partial=false):: (
        // The minimum number of seconds for which a newly created DaemonSet pod should be ready without any of its container crashing, for it to be considered available.
        // Defaults to 0 (pod will be considered available as soon as it is ready)..
            assert utils.asserts.type(value, 'integer', 'minReadySeconds');
            kutils.mixin({"minReadySeconds": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.batch.v2alpha1.CronJobSpec":: function(path=function(patch){}) {
        _ref: {name: "CronJobSpec"},

        schedule: null,

        jobTemplate: null,

        FailedJobsHistoryLimit(value, partial=false):: (
        // The number of failed finished jobs to retain.
        // This is a pointer to distinguish between explicit zero and not specified..
            assert utils.asserts.type(value, 'integer', 'failedJobsHistoryLimit');
            kutils.mixin({"failedJobsHistoryLimit": value}, path, partial)
        ),

        ConcurrencyPolicy(value, partial=false):: (
        // ConcurrencyPolicy specifies how to treat concurrent executions of a Job.
        // Defaults to Allow..
            assert utils.asserts.type(value, 'string', 'concurrencyPolicy');
            kutils.mixin({"concurrencyPolicy": value}, path, partial)
        ),

        Suspend(value, partial=false):: (
        // Suspend flag tells the controller to suspend subsequent executions, it does not apply to already started executions.
        // Defaults to false..
            assert utils.asserts.type(value, 'boolean', 'suspend');
            kutils.mixin({"suspend": value}, path, partial)
        ),

        Schedule(value, partial=false):: (
        // Schedule contains the schedule in Cron format, see https://en.wikipedia.org/wiki/Cron..
            assert utils.asserts.type(value, 'string', 'schedule');
            kutils.mixin({"schedule": value}, path, partial)
        ),

        StartingDeadlineSeconds(value, partial=false):: (
        // Optional deadline in seconds for starting the job if it misses scheduled time for any reason.
        // Missed jobs executions will be counted as failed ones..
            assert utils.asserts.type(value, 'integer', 'startingDeadlineSeconds');
            kutils.mixin({"startingDeadlineSeconds": value}, path, partial)
        ),

        SuccessfulJobsHistoryLimit(value, partial=false):: (
        // The number of successful finished jobs to retain.
        // This is a pointer to distinguish between explicit zero and not specified..
            assert utils.asserts.type(value, 'integer', 'successfulJobsHistoryLimit');
            kutils.mixin({"successfulJobsHistoryLimit": value}, path, partial)
        ),

        JobTemplate::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v2alpha1.JobTemplateSpec'](function(patch) path({jobTemplate+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimStatus":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeClaimStatus"},

        Phase(value, partial=false):: (
        // Phase represents the current phase of PersistentVolumeClaim..
            assert utils.asserts.type(value, 'string', 'phase');
            kutils.mixin({"phase": value}, path, partial)
        ),

        AccessModes(value, partial=false):: (
        // AccessModes contains the actual access modes the volume backing the PVC has.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#access-modes-1.
            assert utils.asserts.type(value, 'array', 'accessModes');
            kutils.mixin({"accessModes": value}, path, partial)
        ),

        Capacity(value, partial=false):: (
        // Represents the actual resources of the underlying volume..
            assert utils.asserts.type(value, 'object', 'capacity');
            kutils.mixin({"capacity": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authentication.v1beta1.TokenReviewStatus":: function(path=function(patch){}) {
        _ref: {name: "TokenReviewStatus"},

        Authenticated(value, partial=false):: (
        // Authenticated indicates that the token was associated with a known user..
            assert utils.asserts.type(value, 'boolean', 'authenticated');
            kutils.mixin({"authenticated": value}, path, partial)
        ),

        User::
           topSelf['io.k8s.kubernetes.pkg.apis.authentication.v1beta1.UserInfo'](function(patch) path({user+: patch})),
        Error(value, partial=false):: (
        // Error indicates that the token couldn't be checked.
            assert utils.asserts.type(value, 'string', 'error');
            kutils.mixin({"error": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.HostPortRange":: function(path=function(patch){}) {
        _ref: {name: "HostPortRange"},

        min: null,

        max: null,

        Max(value, partial=false):: (
        // max is the end of the range, inclusive..
            assert utils.asserts.type(value, 'integer', 'max');
            kutils.mixin({"max": value}, path, partial)
        ),

        Min(value, partial=false):: (
        // min is the start of the range, inclusive..
            assert utils.asserts.type(value, 'integer', 'min');
            kutils.mixin({"min": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.Endpoints":: function(path=function(patch){}) {
        _ref: {name: "Endpoints"},

        subsets: [],

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Subsets(value, partial=false):: (
        // The set of all endpoints is the union of all subsets.
        // Addresses are placed into subsets according to the IPs they share.
        // A single address with multiple ports, some of which are ready and some of which are not (because they come from different containers) will result in the address being displayed in different subsets for the different ports.
        // No address will appear in both Addresses and NotReadyAddresses in the same subset.
        // Sets of addresses and ports that comprise a service..
            assert utils.asserts.type(value, 'array', 'subsets');
            kutils.mixin({"subsets": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.batch.v1.Job":: function(path=function(patch){}) {
        _ref: {name: "Job"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v1.JobStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.batch.v1.JobSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscalerList":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerList"},

        items: [],

        Items(value, partial=false):: (
        // items is the list of horizontal pod autoscaler objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.LimitRangeItem":: function(path=function(patch){}) {
        _ref: {name: "LimitRangeItem"},

        Min(value, partial=false):: (
        // Min usage constraints on this kind by resource name..
            assert utils.asserts.type(value, 'object', 'min');
            kutils.mixin({"min": value}, path, partial)
        ),

        Default(value, partial=false):: (
        // Default resource requirement limit value by resource name if resource limit is omitted..
            assert utils.asserts.type(value, 'object', 'default');
            kutils.mixin({"default": value}, path, partial)
        ),

        Max(value, partial=false):: (
        // Max usage constraints on this kind by resource name..
            assert utils.asserts.type(value, 'object', 'max');
            kutils.mixin({"max": value}, path, partial)
        ),

        DefaultRequest(value, partial=false):: (
        // DefaultRequest is the default resource requirement request value by resource name if resource request is omitted..
            assert utils.asserts.type(value, 'object', 'defaultRequest');
            kutils.mixin({"defaultRequest": value}, path, partial)
        ),

        MaxLimitRequestRatio(value, partial=false):: (
        // MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource..
            assert utils.asserts.type(value, 'object', 'maxLimitRequestRatio');
            kutils.mixin({"maxLimitRequestRatio": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of resource that this limit applies to..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudgetStatus":: function(path=function(patch){}) {
        _ref: {name: "PodDisruptionBudgetStatus"},

        disruptedPods: {},

        disruptionsAllowed: null,

        currentHealthy: null,

        desiredHealthy: null,

        expectedPods: null,

        ExpectedPods(value, partial=false):: (
        // total number of pods counted by this disruption budget.
            assert utils.asserts.type(value, 'integer', 'expectedPods');
            kutils.mixin({"expectedPods": value}, path, partial)
        ),

        CurrentHealthy(value, partial=false):: (
        // current number of healthy pods.
            assert utils.asserts.type(value, 'integer', 'currentHealthy');
            kutils.mixin({"currentHealthy": value}, path, partial)
        ),

        DisruptedPods(value, partial=false):: (
        // DisruptedPods contains information about pods whose eviction was processed by the API server eviction subresource handler but has not yet been observed by the PodDisruptionBudget controller.
        // A pod will be in this map from the time when the API server processed the eviction request to the time when the pod is seen by PDB controller as having been marked for deletion (or after a timeout).
        // The key in the map is the name of the pod and the value is the time when the API server processed the eviction request.
        // If the deletion didn't occur and a pod is still there it will be removed from the list automatically by PodDisruptionBudget controller after some time.
        // If everything goes smooth this map should be empty for the most of the time.
        // Large number of entries in the map may indicate problems with pod deletions..
            assert utils.asserts.type(value, 'object', 'disruptedPods');
            kutils.mixin({"disruptedPods": value}, path, partial)
        ),

        DesiredHealthy(value, partial=false):: (
        // minimum desired number of healthy pods.
            assert utils.asserts.type(value, 'integer', 'desiredHealthy');
            kutils.mixin({"desiredHealthy": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // Most recent generation observed when updating this PDB status.
        // PodDisruptionsAllowed and other status informatio is valid only if observedGeneration equals to PDB's object generation..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        DisruptionsAllowed(value, partial=false):: (
        // Number of pod disruptions that are currently allowed..
            assert utils.asserts.type(value, 'integer', 'disruptionsAllowed');
            kutils.mixin({"disruptionsAllowed": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.ResourceAttributes":: function(path=function(patch){}) {
        _ref: {name: "ResourceAttributes"},

        Resource(value, partial=false):: (
        // Resource is one of the existing resource types.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'resource');
            kutils.mixin({"resource": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name is the name of the resource being requested for a "get" or deleted for a "delete".
        // "" (empty) means all..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Namespace(value, partial=false):: (
        // Namespace is the namespace of the action being requested.
        // Currently, there is no distinction between no namespace and all namespaces "" (empty) is defaulted for LocalSubjectAccessReviews "" (empty) is empty for cluster-scoped resources "" (empty) means "all" for namespace scoped resources from a SubjectAccessReview or SelfSubjectAccessReview.
            assert utils.asserts.type(value, 'string', 'namespace');
            kutils.mixin({"namespace": value}, path, partial)
        ),

        Verb(value, partial=false):: (
        // Verb is a kubernetes resource API verb, like: get, list, watch, create, update, delete, proxy.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'verb');
            kutils.mixin({"verb": value}, path, partial)
        ),

        Version(value, partial=false):: (
        // Version is the API Version of the Resource.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'version');
            kutils.mixin({"version": value}, path, partial)
        ),

        Group(value, partial=false):: (
        // Group is the API Group of the Resource.
        // "*" means all..
            assert utils.asserts.type(value, 'string', 'group');
            kutils.mixin({"group": value}, path, partial)
        ),

        Subresource(value, partial=false):: (
        // Subresource is one of the existing resource types.
        // "" means none..
            assert utils.asserts.type(value, 'string', 'subresource');
            kutils.mixin({"subresource": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ConfigMapVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "ConfigMapVolumeSource"},

        Items(value, partial=false):: (
        // If unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value.
        // If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present.
        // If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional.
        // Paths must be relative and may not contain the '..' path or start with '..'..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Optional(value, partial=false):: (
        // Specify whether the ConfigMap or it's keys must be defined.
            assert utils.asserts.type(value, 'boolean', 'optional');
            kutils.mixin({"optional": value}, path, partial)
        ),

        DefaultMode(value, partial=false):: (
        // Optional: mode bits to use on created files by default.
        // Must be a value between 0 and 0777.
        // Defaults to 0644.
        // Directories within the path are not affected by this setting.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'defaultMode');
            kutils.mixin({"defaultMode": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // Name of the referent.
        // More info: http://kubernetes.io/docs/user-guide/identifiers#names.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.HTTPHeader":: function(path=function(patch){}) {
        _ref: {name: "HTTPHeader"},

        name: null,

        value: null,

        Name(value, partial=false):: (
        // The header field name.
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Value(value, partial=false):: (
        // The header field value.
            assert utils.asserts.type(value, 'string', 'value');
            kutils.mixin({"value": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.api.resource.Quantity":: function(path=function(patch){}) {
        _ref: {name: "Quantity"},

    },

    "io.k8s.kubernetes.pkg.api.v1.ReplicationController":: function(path=function(patch){}) {
        _ref: {name: "ReplicationController"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ReplicationControllerStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ReplicationControllerSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.APIGroupList":: function(path=function(patch){}) {
        _ref: {name: "APIGroupList"},

        groups: [],

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Groups(value, partial=false):: (
        // groups is a list of APIGroup..
            assert utils.asserts.type(value, 'array', 'groups');
            kutils.mixin({"groups": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicy":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicy"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicySpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.RollingUpdateDeployment":: function(path=function(patch){}) {
        _ref: {name: "RollingUpdateDeployment"},

        MaxSurge::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({maxSurge+: patch})),
        MaxUnavailable::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({maxUnavailable+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ReplicaSetStatus":: function(path=function(patch){}) {
        _ref: {name: "ReplicaSetStatus"},

        replicas: null,

        Replicas(value, partial=false):: (
        // Replicas is the most recently oberved number of replicas.
        // More info: http://kubernetes.io/docs/user-guide/replication-controller#what-is-a-replication-controller.
            assert utils.asserts.type(value, 'integer', 'replicas');
            kutils.mixin({"replicas": value}, path, partial)
        ),

        ObservedGeneration(value, partial=false):: (
        // ObservedGeneration reflects the generation of the most recently observed ReplicaSet..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        AvailableReplicas(value, partial=false):: (
        // The number of available replicas (ready for at least minReadySeconds) for this replica set..
            assert utils.asserts.type(value, 'integer', 'availableReplicas');
            kutils.mixin({"availableReplicas": value}, path, partial)
        ),

        ReadyReplicas(value, partial=false):: (
        // The number of ready replicas for this replica set..
            assert utils.asserts.type(value, 'integer', 'readyReplicas');
            kutils.mixin({"readyReplicas": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Represents the latest available observations of a replica set's current state..
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

        FullyLabeledReplicas(value, partial=false):: (
        // The number of pods that have labels matching the labels of the pod template of the replicaset..
            assert utils.asserts.type(value, 'integer', 'fullyLabeledReplicas');
            kutils.mixin({"fullyLabeledReplicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.HTTPGetAction":: function(path=function(patch){}) {
        _ref: {name: "HTTPGetAction"},

        port: null,

        Path(value, partial=false):: (
        // Path to access on the HTTP server..
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Host(value, partial=false):: (
        // Host name to connect to, defaults to the pod IP.
        // You probably want to set "Host" in httpHeaders instead..
            assert utils.asserts.type(value, 'string', 'host');
            kutils.mixin({"host": value}, path, partial)
        ),

        Scheme(value, partial=false):: (
        // Scheme to use for connecting to the host.
        // Defaults to HTTP..
            assert utils.asserts.type(value, 'string', 'scheme');
            kutils.mixin({"scheme": value}, path, partial)
        ),

        HttpHeaders(value, partial=false):: (
        // Custom headers to set in the request.
        // HTTP allows repeated headers..
            assert utils.asserts.type(value, 'array', 'httpHeaders');
            kutils.mixin({"httpHeaders": value}, path, partial)
        ),

        Port::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({port+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Affinity":: function(path=function(patch){}) {
        _ref: {name: "Affinity"},

        PodAffinity::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodAffinity'](function(patch) path({podAffinity+: patch})),
        NodeAffinity::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeAffinity'](function(patch) path({nodeAffinity+: patch})),
        PodAntiAffinity::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodAntiAffinity'](function(patch) path({podAntiAffinity+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.APIGroup":: function(path=function(patch){}) {
        _ref: {name: "APIGroup"},

        name: null,

        versions: [],

        serverAddressByClientCIDRs: [],

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // name is the name of the group..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Versions(value, partial=false):: (
        // versions are the versions supported in this group..
            assert utils.asserts.type(value, 'array', 'versions');
            kutils.mixin({"versions": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        ServerAddressByClientCIDRs(value, partial=false):: (
        // a map of client CIDR to server address that is serving this group.
        // This is to help clients reach servers in the most network-efficient way possible.
        // Clients can use the appropriate server address as per the CIDR that they match.
        // In case of multiple matches, clients should use the longest matching CIDR.
        // The server returns only those CIDRs that it thinks that the client can match.
        // For example: the master will return an internal IP CIDR only, if the client reaches the server using an internal IP.
        // Server looks at X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get the client IP..
            assert utils.asserts.type(value, 'array', 'serverAddressByClientCIDRs');
            kutils.mixin({"serverAddressByClientCIDRs": value}, path, partial)
        ),

        PreferredVersion::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.GroupVersionForDiscovery'](function(patch) path({preferredVersion+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.ComponentCondition":: function(path=function(patch){}) {
        _ref: {name: "ComponentCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition for a component.
        // Valid values for "Healthy": "True", "False", or "Unknown"..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // Message about the condition for a component.
        // For example, information about a health check..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of condition for a component.
        // Valid value: "Healthy".
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Error(value, partial=false):: (
        // Condition error code for a component.
        // For example, a health check error code..
            assert utils.asserts.type(value, 'string', 'error');
            kutils.mixin({"error": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ReplicationControllerCondition":: function(path=function(patch){}) {
        _ref: {name: "ReplicationControllerCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of replication controller condition..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human readable message indicating details about the transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // The reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.APIVersions":: function(path=function(patch){}) {
        _ref: {name: "APIVersions"},

        versions: [],

        serverAddressByClientCIDRs: [],

        ServerAddressByClientCIDRs(value, partial=false):: (
        // a map of client CIDR to server address that is serving this group.
        // This is to help clients reach servers in the most network-efficient way possible.
        // Clients can use the appropriate server address as per the CIDR that they match.
        // In case of multiple matches, clients should use the longest matching CIDR.
        // The server returns only those CIDRs that it thinks that the client can match.
        // For example: the master will return an internal IP CIDR only, if the client reaches the server using an internal IP.
        // Server looks at X-Forwarded-For header or X-Real-Ip header or request.RemoteAddr (in that order) to get the client IP..
            assert utils.asserts.type(value, 'array', 'serverAddressByClientCIDRs');
            kutils.mixin({"serverAddressByClientCIDRs": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Versions(value, partial=false):: (
        // versions are the api versions that are available..
            assert utils.asserts.type(value, 'array', 'versions');
            kutils.mixin({"versions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequest":: function(path=function(patch){}) {
        _ref: {name: "CertificateSigningRequest"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.certificates.v1beta1.CertificateSigningRequestSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.ObjectMetricStatus":: function(path=function(patch){}) {
        _ref: {name: "ObjectMetricStatus"},

        target: null,

        metricName: null,

        currentValue: null,

        CurrentValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({currentValue+: patch})),
        Target::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.CrossVersionObjectReference'](function(patch) path({target+: patch})),
        MetricName(value, partial=false):: (
        // metricName is the name of the metric in question..
            assert utils.asserts.type(value, 'string', 'metricName');
            kutils.mixin({"metricName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.LocalSubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "LocalSubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.WatchEvent":: function(path=function(patch){}) {
        _ref: {name: "WatchEvent"},

        type: null,

        object: null,

        Object::
           topSelf['io.k8s.apimachinery.pkg.runtime.RawExtension'](function(patch) path({object+: patch})),
        Type(value, partial=false):: (
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.CinderVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "CinderVolumeSource"},

        volumeID: null,

        ReadOnly(value, partial=false):: (
        // Optional: Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts.
        // More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        VolumeID(value, partial=false):: (
        // volume id used to identify the volume in cinder More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md.
            assert utils.asserts.type(value, 'string', 'volumeID');
            kutils.mixin({"volumeID": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type to mount.
        // Must be a filesystem type supported by the host operating system.
        // Examples: "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified.
        // More info: http://releases.k8s.io/HEAD/examples/mysql-cinder-pd/README.md.
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ResourceQuota":: function(path=function(patch){}) {
        _ref: {name: "ResourceQuota"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceQuotaStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceQuotaSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.LimitRange":: function(path=function(patch){}) {
        _ref: {name: "LimitRange"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LimitRangeSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetList":: function(path=function(patch){}) {
        _ref: {name: "DaemonSetList"},

        items: [],

        Items(value, partial=false):: (
        // A list of daemon sets..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.Scale":: function(path=function(patch){}) {
        _ref: {name: "Scale"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.ScaleStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.ScaleSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodTemplateList":: function(path=function(patch){}) {
        _ref: {name: "PodTemplateList"},

        items: [],

        Items(value, partial=false):: (
        // List of pod templates.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollingUpdateDaemonSet":: function(path=function(patch){}) {
        _ref: {name: "RollingUpdateDaemonSet"},

        MaxUnavailable::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({maxUnavailable+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodAffinityTerm":: function(path=function(patch){}) {
        _ref: {name: "PodAffinityTerm"},

        LabelSelector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({labelSelector+: patch})),
        Namespaces(value, partial=false):: (
        // namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means "this pod's namespace".
            assert utils.asserts.type(value, 'array', 'namespaces');
            kutils.mixin({"namespaces": value}, path, partial)
        ),

        TopologyKey(value, partial=false):: (
        // This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running.
        // For PreferredDuringScheduling pod anti-affinity, empty topologyKey is interpreted as "all topologies" ("all topologies" here means all the topologyKeys indicated by scheduler command-line argument --failure-domains); for affinity and for RequiredDuringScheduling pod anti-affinity, empty topologyKey is not allowed..
            assert utils.asserts.type(value, 'string', 'topologyKey');
            kutils.mixin({"topologyKey": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudget":: function(path=function(patch){}) {
        _ref: {name: "PodDisruptionBudget"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudgetStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudgetSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.VolumeMount":: function(path=function(patch){}) {
        _ref: {name: "VolumeMount"},

        name: null,

        mountPath: null,

        ReadOnly(value, partial=false):: (
        // Mounted read-only if true, read-write otherwise (false or unspecified).
        // Defaults to false..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        MountPath(value, partial=false):: (
        // Path within the container at which the volume should be mounted.
        // Must not contain ':'..
            assert utils.asserts.type(value, 'string', 'mountPath');
            kutils.mixin({"mountPath": value}, path, partial)
        ),

        SubPath(value, partial=false):: (
        // Path within the volume from which the container's volume should be mounted.
        // Defaults to "" (volume's root)..
            assert utils.asserts.type(value, 'string', 'subPath');
            kutils.mixin({"subPath": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // This must match the Name of a Volume..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.ClusterRole":: function(path=function(patch){}) {
        _ref: {name: "ClusterRole"},

        rules: [],

        Rules(value, partial=false):: (
        // Rules holds all the PolicyRules for this ClusterRole.
            assert utils.asserts.type(value, 'array', 'rules');
            kutils.mixin({"rules": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeStatus":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeStatus"},

        Phase(value, partial=false):: (
        // Phase indicates if a volume is available, bound to a claim, or released by a claim.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#phase.
            assert utils.asserts.type(value, 'string', 'phase');
            kutils.mixin({"phase": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human-readable message indicating details about why the volume is in this state..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // Reason is a brief CamelCase string that describes any failure and is meant for machine parsing and tidy display in the CLI..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1.SelfSubjectAccessReview":: function(path=function(patch){}) {
        _ref: {name: "SelfSubjectAccessReview"},

        spec: null,

        Status::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SubjectAccessReviewStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.authorization.v1.SelfSubjectAccessReviewSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleBinding":: function(path=function(patch){}) {
        _ref: {name: "RoleBinding"},

        subjects: [],

        roleRef: null,

        RoleRef::
           topSelf['io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.RoleRef'](function(patch) path({roleRef+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Subjects(value, partial=false):: (
        // Subjects holds references to the objects the role applies to..
            assert utils.asserts.type(value, 'array', 'subjects');
            kutils.mixin({"subjects": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollbackConfig":: function(path=function(patch){}) {
        _ref: {name: "RollbackConfig"},

        Revision(value, partial=false):: (
        // The revision to rollback to.
        // If set to 0, rollbck to the last revision..
            assert utils.asserts.type(value, 'integer', 'revision');
            kutils.mixin({"revision": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicyPeer":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicyPeer"},

        NamespaceSelector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({namespaceSelector+: patch})),
        PodSelector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({podSelector+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodList":: function(path=function(patch){}) {
        _ref: {name: "PodList"},

        items: [],

        Items(value, partial=false):: (
        // List of pods.
        // More info: http://kubernetes.io/docs/user-guide/pods.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeStatus":: function(path=function(patch){}) {
        _ref: {name: "NodeStatus"},

        Capacity(value, partial=false):: (
        // Capacity represents the total resources of a node.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#capacity for more details..
            assert utils.asserts.type(value, 'object', 'capacity');
            kutils.mixin({"capacity": value}, path, partial)
        ),

        Addresses(value, partial=false):: (
        // List of addresses reachable to the node.
        // Queried from cloud provider, if available.
        // More info: http://releases.k8s.io/HEAD/docs/admin/node.md#node-addresses.
            assert utils.asserts.type(value, 'array', 'addresses');
            kutils.mixin({"addresses": value}, path, partial)
        ),

        NodeInfo::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeSystemInfo'](function(patch) path({nodeInfo+: patch})),
        VolumesAttached(value, partial=false):: (
        // List of volumes that are attached to the node..
            assert utils.asserts.type(value, 'array', 'volumesAttached');
            kutils.mixin({"volumesAttached": value}, path, partial)
        ),

        Allocatable(value, partial=false):: (
        // Allocatable represents the resources of a node that are available for scheduling.
        // Defaults to Capacity..
            assert utils.asserts.type(value, 'object', 'allocatable');
            kutils.mixin({"allocatable": value}, path, partial)
        ),

        VolumesInUse(value, partial=false):: (
        // List of attachable volumes in use (mounted) by the node..
            assert utils.asserts.type(value, 'array', 'volumesInUse');
            kutils.mixin({"volumesInUse": value}, path, partial)
        ),

        DaemonEndpoints::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeDaemonEndpoints'](function(patch) path({daemonEndpoints+: patch})),
        Phase(value, partial=false):: (
        // NodePhase is the recently observed lifecycle phase of the node.
        // More info: http://releases.k8s.io/HEAD/docs/admin/node.md#node-phase The field is never populated, and now is deprecated..
            assert utils.asserts.type(value, 'string', 'phase');
            kutils.mixin({"phase": value}, path, partial)
        ),

        Images(value, partial=false):: (
        // List of container images on this node.
            assert utils.asserts.type(value, 'array', 'images');
            kutils.mixin({"images": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Conditions is an array of current observed node conditions.
        // More info: http://releases.k8s.io/HEAD/docs/admin/node.md#node-condition.
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EventList":: function(path=function(patch){}) {
        _ref: {name: "EventList"},

        items: [],

        Items(value, partial=false):: (
        // List of events.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.HostPathVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "HostPathVolumeSource"},

        path: null,

        Path(value, partial=false):: (
        // Path of the directory on the host.
        // More info: http://kubernetes.io/docs/user-guide/volumes#hostpath.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ExecAction":: function(path=function(patch){}) {
        _ref: {name: "ExecAction"},

        Command(value, partial=false):: (
        // Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem.
        // The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work.
        // To use a shell, you need to explicitly call out to that shell.
        // Exit status of 0 is treated as live/healthy and non-zero is unhealthy..
            assert utils.asserts.type(value, 'array', 'command');
            kutils.mixin({"command": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerStateRunning":: function(path=function(patch){}) {
        _ref: {name: "ContainerStateRunning"},

        StartedAt::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({startedAt+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.settings.v1alpha1.PodPresetSpec":: function(path=function(patch){}) {
        _ref: {name: "PodPresetSpec"},

        Volumes(value, partial=false):: (
        // Volumes defines the collection of Volume to inject into the pod..
            assert utils.asserts.type(value, 'array', 'volumes');
            kutils.mixin({"volumes": value}, path, partial)
        ),

        VolumeMounts(value, partial=false):: (
        // VolumeMounts defines the collection of VolumeMount to inject into containers..
            assert utils.asserts.type(value, 'array', 'volumeMounts');
            kutils.mixin({"volumeMounts": value}, path, partial)
        ),

        EnvFrom(value, partial=false):: (
        // EnvFrom defines the collection of EnvFromSource to inject into containers..
            assert utils.asserts.type(value, 'array', 'envFrom');
            kutils.mixin({"envFrom": value}, path, partial)
        ),

        Env(value, partial=false):: (
        // Env defines the collection of EnvVar to inject into containers..
            assert utils.asserts.type(value, 'array', 'env');
            kutils.mixin({"env": value}, path, partial)
        ),

        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.PodSecurityPolicy":: function(path=function(patch){}) {
        _ref: {name: "PodSecurityPolicy"},

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.PodSecurityPolicySpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodStatus":: function(path=function(patch){}) {
        _ref: {name: "PodStatus"},

        InitContainerStatuses(value, partial=false):: (
        // The list has one entry per init container in the manifest.
        // The most recent successful init container will have ready = true, the most recently started container will have startTime set.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#container-statuses.
            assert utils.asserts.type(value, 'array', 'initContainerStatuses');
            kutils.mixin({"initContainerStatuses": value}, path, partial)
        ),

        QosClass(value, partial=false):: (
        // The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://github.com/kubernetes/kubernetes/blob/master/docs/design/resource-qos.md.
            assert utils.asserts.type(value, 'string', 'qosClass');
            kutils.mixin({"qosClass": value}, path, partial)
        ),

        ContainerStatuses(value, partial=false):: (
        // The list has one entry per container in the manifest.
        // Each entry is currently the output of `docker inspect`.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#container-statuses.
            assert utils.asserts.type(value, 'array', 'containerStatuses');
            kutils.mixin({"containerStatuses": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // A brief CamelCase message indicating details about why the pod is in this state.
        // e.g.
        // 'OutOfDisk'.
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        PodIP(value, partial=false):: (
        // IP address allocated to the pod.
        // Routable at least within the cluster.
        // Empty if not yet allocated..
            assert utils.asserts.type(value, 'string', 'podIP');
            kutils.mixin({"podIP": value}, path, partial)
        ),

        StartTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({startTime+: patch})),
        HostIP(value, partial=false):: (
        // IP address of the host to which the pod is assigned.
        // Empty if not yet scheduled..
            assert utils.asserts.type(value, 'string', 'hostIP');
            kutils.mixin({"hostIP": value}, path, partial)
        ),

        Phase(value, partial=false):: (
        // Current condition of the pod.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#pod-phase.
            assert utils.asserts.type(value, 'string', 'phase');
            kutils.mixin({"phase": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human readable message indicating details about why the pod is in this condition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Conditions(value, partial=false):: (
        // Current service state of pod.
        // More info: http://kubernetes.io/docs/user-guide/pod-states#pod-conditions.
            assert utils.asserts.type(value, 'array', 'conditions');
            kutils.mixin({"conditions": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NodeSelector":: function(path=function(patch){}) {
        _ref: {name: "NodeSelector"},

        nodeSelectorTerms: [],

        NodeSelectorTerms(value, partial=false):: (
        // Required.
        // A list of node selector terms.
        // The terms are ORed..
            assert utils.asserts.type(value, 'array', 'nodeSelectorTerms');
            kutils.mixin({"nodeSelectorTerms": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PodTemplateSpec":: function(path=function(patch){}) {
        _ref: {name: "PodTemplateSpec"},

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodSpec'](function(patch) path({spec+: patch})),
        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentStrategy":: function(path=function(patch){}) {
        _ref: {name: "DeploymentStrategy"},

        RollingUpdate::
           topSelf['io.k8s.kubernetes.pkg.apis.apps.v1beta1.RollingUpdateDeployment'](function(patch) path({rollingUpdate+: patch})),
        Type(value, partial=false):: (
        // Type of deployment.
        // Can be "Recreate" or "RollingUpdate".
        // Default is RollingUpdate..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.policy.v1beta1.PodDisruptionBudgetSpec":: function(path=function(patch){}) {
        _ref: {name: "PodDisruptionBudgetSpec"},

        MinAvailable::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({minAvailable+: patch})),
        Selector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({selector+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeAffinity":: function(path=function(patch){}) {
        _ref: {name: "NodeAffinity"},

        RequiredDuringSchedulingIgnoredDuringExecution::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeSelector'](function(patch) path({requiredDuringSchedulingIgnoredDuringExecution+: patch})),
        PreferredDuringSchedulingIgnoredDuringExecution(value, partial=false):: (
        // The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions.
        // The node that is most preferred is the one with the greatest sum of weights, i.e.
        // for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred..
            assert utils.asserts.type(value, 'array', 'preferredDuringSchedulingIgnoredDuringExecution');
            kutils.mixin({"preferredDuringSchedulingIgnoredDuringExecution": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.ThirdPartyResourceList":: function(path=function(patch){}) {
        _ref: {name: "ThirdPartyResourceList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of ThirdPartyResources..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.storage.v1beta1.StorageClass":: function(path=function(patch){}) {
        _ref: {name: "StorageClass"},

        provisioner: null,

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Provisioner(value, partial=false):: (
        // Provisioner indicates the type of the provisioner..
            assert utils.asserts.type(value, 'string', 'provisioner');
            kutils.mixin({"provisioner": value}, path, partial)
        ),

        Parameters(value, partial=false):: (
        // Parameters holds the parameters for the provisioner that should create volumes of this storage class..
            assert utils.asserts.type(value, 'object', 'parameters');
            kutils.mixin({"parameters": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressBackend":: function(path=function(patch){}) {
        _ref: {name: "IngressBackend"},

        serviceName: null,

        servicePort: null,

        ServiceName(value, partial=false):: (
        // Specifies the name of the referenced service..
            assert utils.asserts.type(value, 'string', 'serviceName');
            kutils.mixin({"serviceName": value}, path, partial)
        ),

        ServicePort::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({servicePort+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.RoleList":: function(path=function(patch){}) {
        _ref: {name: "RoleList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of Roles.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Pod":: function(path=function(patch){}) {
        _ref: {name: "Pod"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.PodSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeSpec":: function(path=function(patch){}) {
        _ref: {name: "NodeSpec"},

        PodCIDR(value, partial=false):: (
        // PodCIDR represents the pod IP range assigned to the node..
            assert utils.asserts.type(value, 'string', 'podCIDR');
            kutils.mixin({"podCIDR": value}, path, partial)
        ),

        Unschedulable(value, partial=false):: (
        // Unschedulable controls node schedulability of new pods.
        // By default, node is schedulable.
        // More info: http://releases.k8s.io/HEAD/docs/admin/node.md#manual-node-administration.
            assert utils.asserts.type(value, 'boolean', 'unschedulable');
            kutils.mixin({"unschedulable": value}, path, partial)
        ),

        ProviderID(value, partial=false):: (
        // ID of the node assigned by the cloud provider in the format: <ProviderName>://<ProviderSpecificNodeID>.
            assert utils.asserts.type(value, 'string', 'providerID');
            kutils.mixin({"providerID": value}, path, partial)
        ),

        ExternalID(value, partial=false):: (
        // External ID of the node assigned by some machine database (e.g.
        // a cloud provider).
        // Deprecated..
            assert utils.asserts.type(value, 'string', 'externalID');
            kutils.mixin({"externalID": value}, path, partial)
        ),

        Taints(value, partial=false):: (
        // If specified, the node's taints..
            assert utils.asserts.type(value, 'array', 'taints');
            kutils.mixin({"taints": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.CephFSVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "CephFSVolumeSource"},

        monitors: [],

        SecretRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LocalObjectReference'](function(patch) path({secretRef+: patch})),
        SecretFile(value, partial=false):: (
        // Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'string', 'secretFile');
            kutils.mixin({"secretFile": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // Optional: Defaults to false (read/write).
        // ReadOnly here will force the ReadOnly setting in VolumeMounts.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        User(value, partial=false):: (
        // Optional: User is the rados user name, default is admin More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

        Path(value, partial=false):: (
        // Optional: Used as the mounted root, rather than the full Ceph tree, default is /.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Monitors(value, partial=false):: (
        // Required: Monitors is a collection of Ceph monitors More info: http://releases.k8s.io/HEAD/examples/volumes/cephfs/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'array', 'monitors');
            kutils.mixin({"monitors": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.PersistentVolumeClaimVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "PersistentVolumeClaimVolumeSource"},

        claimName: null,

        ReadOnly(value, partial=false):: (
        // Will force the ReadOnly setting in VolumeMounts.
        // Default false..
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        ClaimName(value, partial=false):: (
        // ClaimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume.
        // More info: http://kubernetes.io/docs/user-guide/persistent-volumes#persistentvolumeclaims.
            assert utils.asserts.type(value, 'string', 'claimName');
            kutils.mixin({"claimName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.HTTPIngressPath":: function(path=function(patch){}) {
        _ref: {name: "HTTPIngressPath"},

        backend: null,

        Path(value, partial=false):: (
        // Path is an extended POSIX regex as defined by IEEE Std 1003.1, (i.e this follows the egrep/unix syntax, not the perl syntax) matched against the path of an incoming request.
        // Currently it can contain characters disallowed from the conventional "path" part of a URL as defined by RFC 3986.
        // Paths must begin with a '/'.
        // If unspecified, the path defaults to a catch all sending traffic to the backend..
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        Backend::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.IngressBackend'](function(patch) path({backend+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.HorizontalPodAutoscalerStatus":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerStatus"},

        currentReplicas: null,

        desiredReplicas: null,

        currentMetrics: [],

        ObservedGeneration(value, partial=false):: (
        // observedGeneration is the most recent generation observed by this autoscaler..
            assert utils.asserts.type(value, 'integer', 'observedGeneration');
            kutils.mixin({"observedGeneration": value}, path, partial)
        ),

        LastScaleTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastScaleTime+: patch})),
        CurrentReplicas(value, partial=false):: (
        // currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler..
            assert utils.asserts.type(value, 'integer', 'currentReplicas');
            kutils.mixin({"currentReplicas": value}, path, partial)
        ),

        CurrentMetrics(value, partial=false):: (
        // currentMetrics is the last read state of the metrics used by this autoscaler..
            assert utils.asserts.type(value, 'array', 'currentMetrics');
            kutils.mixin({"currentMetrics": value}, path, partial)
        ),

        DesiredReplicas(value, partial=false):: (
        // desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler..
            assert utils.asserts.type(value, 'integer', 'desiredReplicas');
            kutils.mixin({"desiredReplicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ContainerStateTerminated":: function(path=function(patch){}) {
        _ref: {name: "ContainerStateTerminated"},

        exitCode: null,

        ContainerID(value, partial=false):: (
        // Container's ID in the format 'docker://<container_id>'.
            assert utils.asserts.type(value, 'string', 'containerID');
            kutils.mixin({"containerID": value}, path, partial)
        ),

        Signal(value, partial=false):: (
        // Signal from the last termination of the container.
            assert utils.asserts.type(value, 'integer', 'signal');
            kutils.mixin({"signal": value}, path, partial)
        ),

        Reason(value, partial=false):: (
        // (brief) reason from the last termination of the container.
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        FinishedAt::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({finishedAt+: patch})),
        StartedAt::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({startedAt+: patch})),
        Message(value, partial=false):: (
        // Message regarding the last termination of the container.
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        ExitCode(value, partial=false):: (
        // Exit status from the last termination of the container.
            assert utils.asserts.type(value, 'integer', 'exitCode');
            kutils.mixin({"exitCode": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicyList":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicyList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of schema objects..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.NodeSelectorRequirement":: function(path=function(patch){}) {
        _ref: {name: "NodeSelectorRequirement"},

        key: null,

        operator: null,

        Operator(value, partial=false):: (
        // Represents a key's relationship to a set of values.
        // Valid operators are In, NotIn, Exists, DoesNotExist.
        // Gt, and Lt..
            assert utils.asserts.type(value, 'string', 'operator');
            kutils.mixin({"operator": value}, path, partial)
        ),

        Values(value, partial=false):: (
        // An array of string values.
        // If the operator is In or NotIn, the values array must be non-empty.
        // If the operator is Exists or DoesNotExist, the values array must be empty.
        // If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer.
        // This array is replaced during a strategic merge patch..
            assert utils.asserts.type(value, 'array', 'values');
            kutils.mixin({"values": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // The label key that the selector applies to..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.authorization.v1beta1.SubjectAccessReviewStatus":: function(path=function(patch){}) {
        _ref: {name: "SubjectAccessReviewStatus"},

        allowed: null,

        Reason(value, partial=false):: (
        // Reason is optional.
        // It indicates why a request was allowed or denied..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        EvaluationError(value, partial=false):: (
        // EvaluationError is an indication that some error occurred during the authorization check.
        // It is entirely possible to get an error and be able to continue determine authorization status in spite of it.
        // For instance, RBAC can be missing a role, but enough roles are still present and bound to reason about the request..
            assert utils.asserts.type(value, 'string', 'evaluationError');
            kutils.mixin({"evaluationError": value}, path, partial)
        ),

        Allowed(value, partial=false):: (
        // Allowed is required.
        // True if the action would be allowed, false otherwise..
            assert utils.asserts.type(value, 'boolean', 'allowed');
            kutils.mixin({"allowed": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.RBDVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "RBDVolumeSource"},

        monitors: [],

        image: null,

        SecretRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.LocalObjectReference'](function(patch) path({secretRef+: patch})),
        Image(value, partial=false):: (
        // The rados image name.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'string', 'image');
            kutils.mixin({"image": value}, path, partial)
        ),

        Keyring(value, partial=false):: (
        // Keyring is the path to key ring for RBDUser.
        // Default is /etc/ceph/keyring.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'string', 'keyring');
            kutils.mixin({"keyring": value}, path, partial)
        ),

        FsType(value, partial=false):: (
        // Filesystem type of the volume that you want to mount.
        // Tip: Ensure that the filesystem type is supported by the host operating system.
        // Examples: "ext4", "xfs", "ntfs".
        // Implicitly inferred to be "ext4" if unspecified.
        // More info: http://kubernetes.io/docs/user-guide/volumes#rbd.
            assert utils.asserts.type(value, 'string', 'fsType');
            kutils.mixin({"fsType": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the ReadOnly setting in VolumeMounts.
        // Defaults to false.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        User(value, partial=false):: (
        // The rados user name.
        // Default is admin.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'string', 'user');
            kutils.mixin({"user": value}, path, partial)
        ),

        Monitors(value, partial=false):: (
        // A collection of Ceph monitors.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it.
            assert utils.asserts.type(value, 'array', 'monitors');
            kutils.mixin({"monitors": value}, path, partial)
        ),

        Pool(value, partial=false):: (
        // The rados pool name.
        // Default is rbd.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/rbd/README.md#how-to-use-it..
            assert utils.asserts.type(value, 'string', 'pool');
            kutils.mixin({"pool": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v1.HorizontalPodAutoscalerSpec":: function(path=function(patch){}) {
        _ref: {name: "HorizontalPodAutoscalerSpec"},

        scaleTargetRef: null,

        maxReplicas: null,

        MinReplicas(value, partial=false):: (
        // lower limit for the number of pods that can be set by the autoscaler, default 1..
            assert utils.asserts.type(value, 'integer', 'minReplicas');
            kutils.mixin({"minReplicas": value}, path, partial)
        ),

        ScaleTargetRef::
           topSelf['io.k8s.kubernetes.pkg.apis.autoscaling.v1.CrossVersionObjectReference'](function(patch) path({scaleTargetRef+: patch})),
        TargetCPUUtilizationPercentage(value, partial=false):: (
        // target average CPU utilization (represented as a percentage of requested CPU) over all the pods; if not specified the default autoscaling policy will be used..
            assert utils.asserts.type(value, 'integer', 'targetCPUUtilizationPercentage');
            kutils.mixin({"targetCPUUtilizationPercentage": value}, path, partial)
        ),

        MaxReplicas(value, partial=false):: (
        // upper limit for the number of pods that can be set by the autoscaler; cannot be smaller than MinReplicas..
            assert utils.asserts.type(value, 'integer', 'maxReplicas');
            kutils.mixin({"maxReplicas": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.storage.v1beta1.StorageClassList":: function(path=function(patch){}) {
        _ref: {name: "StorageClassList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of StorageClasses.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DeploymentCondition":: function(path=function(patch){}) {
        _ref: {name: "DeploymentCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        LastUpdateTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastUpdateTime+: patch})),
        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // The reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        Message(value, partial=false):: (
        // A human readable message indicating details about the transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of deployment condition..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.DownwardAPIVolumeFile":: function(path=function(patch){}) {
        _ref: {name: "DownwardAPIVolumeFile"},

        path: null,

        Path(value, partial=false):: (
        // Required: Path is  the relative path name of the file to be created.
        // Must not be absolute or contain the '..' path.
        // Must be utf-8 encoded.
        // The first item of the relative path must not start with '..'.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        FieldRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectFieldSelector'](function(patch) path({fieldRef+: patch})),
        Mode(value, partial=false):: (
        // Optional: mode bits to use on this file, must be a value between 0 and 0777.
        // If not specified, the volume defaultMode will be used.
        // This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set..
            assert utils.asserts.type(value, 'integer', 'mode');
            kutils.mixin({"mode": value}, path, partial)
        ),

        ResourceFieldRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceFieldSelector'](function(patch) path({resourceFieldRef+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PreferredSchedulingTerm":: function(path=function(patch){}) {
        _ref: {name: "PreferredSchedulingTerm"},

        weight: null,

        preference: null,

        Preference::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeSelectorTerm'](function(patch) path({preference+: patch})),
        Weight(value, partial=false):: (
        // Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100..
            assert utils.asserts.type(value, 'integer', 'weight');
            kutils.mixin({"weight": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NodeSelectorTerm":: function(path=function(patch){}) {
        _ref: {name: "NodeSelectorTerm"},

        matchExpressions: [],

        MatchExpressions(value, partial=false):: (
        // Required.
        // A list of node selector requirements.
        // The requirements are ANDed..
            assert utils.asserts.type(value, 'array', 'matchExpressions');
            kutils.mixin({"matchExpressions": value}, path, partial)
        ),

    },

    "io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelectorRequirement":: function(path=function(patch){}) {
        _ref: {name: "LabelSelectorRequirement"},

        key: null,

        operator: null,

        Operator(value, partial=false):: (
        // operator represents a key's relationship to a set of values.
        // Valid operators ard In, NotIn, Exists and DoesNotExist..
            assert utils.asserts.type(value, 'string', 'operator');
            kutils.mixin({"operator": value}, path, partial)
        ),

        Values(value, partial=false):: (
        // values is an array of string values.
        // If the operator is In or NotIn, the values array must be non-empty.
        // If the operator is Exists or DoesNotExist, the values array must be empty.
        // This array is replaced during a strategic merge patch..
            assert utils.asserts.type(value, 'array', 'values');
            kutils.mixin({"values": value}, path, partial)
        ),

        Key(value, partial=false):: (
        // key is the label key that the selector applies to..
            assert utils.asserts.type(value, 'string', 'key');
            kutils.mixin({"key": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.GlusterfsVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "GlusterfsVolumeSource"},

        endpoints: null,

        path: null,

        Path(value, partial=false):: (
        // Path is the Glusterfs volume path.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod.
            assert utils.asserts.type(value, 'string', 'path');
            kutils.mixin({"path": value}, path, partial)
        ),

        ReadOnly(value, partial=false):: (
        // ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions.
        // Defaults to false.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod.
            assert utils.asserts.type(value, 'boolean', 'readOnly');
            kutils.mixin({"readOnly": value}, path, partial)
        ),

        Endpoints(value, partial=false):: (
        // EndpointsName is the endpoint name that details Glusterfs topology.
        // More info: http://releases.k8s.io/HEAD/examples/volumes/glusterfs/README.md#create-a-pod.
            assert utils.asserts.type(value, 'string', 'endpoints');
            kutils.mixin({"endpoints": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.apps.v1beta1.DeploymentList":: function(path=function(patch){}) {
        _ref: {name: "DeploymentList"},

        items: [],

        Items(value, partial=false):: (
        // Items is the list of Deployments..
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.SupplementalGroupsStrategyOptions":: function(path=function(patch){}) {
        _ref: {name: "SupplementalGroupsStrategyOptions"},

        Ranges(value, partial=false):: (
        // Ranges are the allowed ranges of supplemental groups.
        // If you would like to force a single supplemental group then supply a single range with the same start and end..
            assert utils.asserts.type(value, 'array', 'ranges');
            kutils.mixin({"ranges": value}, path, partial)
        ),

        Rule(value, partial=false):: (
        // Rule is the strategy that will dictate what supplemental groups is used in the SecurityContext..
            assert utils.asserts.type(value, 'string', 'rule');
            kutils.mixin({"rule": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.ServiceList":: function(path=function(patch){}) {
        _ref: {name: "ServiceList"},

        items: [],

        Items(value, partial=false):: (
        // List of services.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Node":: function(path=function(patch){}) {
        _ref: {name: "Node"},

        Status::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeStatus'](function(patch) path({status+: patch})),
        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        Spec::
           topSelf['io.k8s.kubernetes.pkg.api.v1.NodeSpec'](function(patch) path({spec+: patch})),
        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.Container":: function(path=function(patch){}) {
        _ref: {name: "Container"},

        name: null,

        LivenessProbe::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Probe'](function(patch) path({livenessProbe+: patch})),
        Stdin(value, partial=false):: (
        // Whether this container should allocate a buffer for stdin in the container runtime.
        // If this is not set, reads from stdin in the container will always result in EOF.
        // Default is false..
            assert utils.asserts.type(value, 'boolean', 'stdin');
            kutils.mixin({"stdin": value}, path, partial)
        ),

        SecurityContext::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SecurityContext'](function(patch) path({securityContext+: patch})),
        Name(value, partial=false):: (
        // Name of the container specified as a DNS_LABEL.
        // Each container in a pod must have a unique name (DNS_LABEL).
        // Cannot be updated..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        EnvFrom(value, partial=false):: (
        // List of sources to populate environment variables in the container.
        // The keys defined within a source must be a C_IDENTIFIER.
        // All invalid keys will be reported as an event when the container is starting.
        // When a key exists in multiple sources, the value associated with the last source will take precedence.
        // Values defined by an Env with a duplicate key will take precedence.
        // Cannot be updated..
            assert utils.asserts.type(value, 'array', 'envFrom');
            kutils.mixin({"envFrom": value}, path, partial)
        ),

        VolumeMounts(value, partial=false):: (
        // Pod volumes to mount into the container's filesystem.
        // Cannot be updated..
            assert utils.asserts.type(value, 'array', 'volumeMounts');
            kutils.mixin({"volumeMounts": value}, path, partial)
        ),

        Image(value, partial=false):: (
        // Docker image name.
        // More info: http://kubernetes.io/docs/user-guide/images.
            assert utils.asserts.type(value, 'string', 'image');
            kutils.mixin({"image": value}, path, partial)
        ),

        Args(value, partial=false):: (
        // Arguments to the entrypoint.
        // The docker image's CMD is used if this is not provided.
        // Variable references $(VAR_NAME) are expanded using the container's environment.
        // If a variable cannot be resolved, the reference in the input string will be unchanged.
        // The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME).
        // Escaped references will never be expanded, regardless of whether the variable exists or not.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands.
            assert utils.asserts.type(value, 'array', 'args');
            kutils.mixin({"args": value}, path, partial)
        ),

        StdinOnce(value, partial=false):: (
        // Whether the container runtime should close the stdin channel after it has been opened by a single attach.
        // When stdin is true the stdin stream will remain open across multiple attach sessions.
        // If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted.
        // If this flag is false, a container processes that reads from stdin will never receive an EOF.
        // Default is false.
            assert utils.asserts.type(value, 'boolean', 'stdinOnce');
            kutils.mixin({"stdinOnce": value}, path, partial)
        ),

        TerminationMessagePolicy(value, partial=false):: (
        // Indicate how the termination message should be populated.
        // File will use the contents of terminationMessagePath to populate the container status message on both success and failure.
        // FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error.
        // The log output is limited to 2048 bytes or 80 lines, whichever is smaller.
        // Defaults to File.
        // Cannot be updated..
            assert utils.asserts.type(value, 'string', 'terminationMessagePolicy');
            kutils.mixin({"terminationMessagePolicy": value}, path, partial)
        ),

        Ports(value, partial=false):: (
        // List of ports to expose from the container.
        // Exposing a port here gives the system additional information about the network connections a container uses, but is primarily informational.
        // Not specifying a port here DOES NOT prevent that port from being exposed.
        // Any port which is listening on the default "0.0.0.0" address inside a container will be accessible from the network.
        // Cannot be updated..
            assert utils.asserts.type(value, 'array', 'ports');
            kutils.mixin({"ports": value}, path, partial)
        ),

        Tty(value, partial=false):: (
        // Whether this container should allocate a TTY for itself, also requires 'stdin' to be true.
        // Default is false..
            assert utils.asserts.type(value, 'boolean', 'tty');
            kutils.mixin({"tty": value}, path, partial)
        ),

        Command(value, partial=false):: (
        // Entrypoint array.
        // Not executed within a shell.
        // The docker image's ENTRYPOINT is used if this is not provided.
        // Variable references $(VAR_NAME) are expanded using the container's environment.
        // If a variable cannot be resolved, the reference in the input string will be unchanged.
        // The $(VAR_NAME) syntax can be escaped with a double $$, ie: $$(VAR_NAME).
        // Escaped references will never be expanded, regardless of whether the variable exists or not.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/containers#containers-and-commands.
            assert utils.asserts.type(value, 'array', 'command');
            kutils.mixin({"command": value}, path, partial)
        ),

        Env(value, partial=false):: (
        // List of environment variables to set in the container.
        // Cannot be updated..
            assert utils.asserts.type(value, 'array', 'env');
            kutils.mixin({"env": value}, path, partial)
        ),

        ImagePullPolicy(value, partial=false):: (
        // Image pull policy.
        // One of Always, Never, IfNotPresent.
        // Defaults to Always if :latest tag is specified, or IfNotPresent otherwise.
        // Cannot be updated.
        // More info: http://kubernetes.io/docs/user-guide/images#updating-images.
            assert utils.asserts.type(value, 'string', 'imagePullPolicy');
            kutils.mixin({"imagePullPolicy": value}, path, partial)
        ),

        ReadinessProbe::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Probe'](function(patch) path({readinessProbe+: patch})),
        TerminationMessagePath(value, partial=false):: (
        // Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem.
        // Message written is intended to be brief final status, such as an assertion failure message.
        // Will be truncated by the node if greater than 4096 bytes.
        // The total message length across all containers will be limited to 12kb.
        // Defaults to /dev/termination-log.
        // Cannot be updated..
            assert utils.asserts.type(value, 'string', 'terminationMessagePath');
            kutils.mixin({"terminationMessagePath": value}, path, partial)
        ),

        Lifecycle::
           topSelf['io.k8s.kubernetes.pkg.api.v1.Lifecycle'](function(patch) path({lifecycle+: patch})),
        Resources::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceRequirements'](function(patch) path({resources+: patch})),
        WorkingDir(value, partial=false):: (
        // Container's working directory.
        // If not specified, the container runtime's default will be used, which might be configured in the container image.
        // Cannot be updated..
            assert utils.asserts.type(value, 'string', 'workingDir');
            kutils.mixin({"workingDir": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.GitRepoVolumeSource":: function(path=function(patch){}) {
        _ref: {name: "GitRepoVolumeSource"},

        repository: null,

        Directory(value, partial=false):: (
        // Target directory name.
        // Must not contain or start with '..'.
        // If '.' is supplied, the volume directory will be the git repository.
        // Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name..
            assert utils.asserts.type(value, 'string', 'directory');
            kutils.mixin({"directory": value}, path, partial)
        ),

        Repository(value, partial=false):: (
        // Repository URL.
            assert utils.asserts.type(value, 'string', 'repository');
            kutils.mixin({"repository": value}, path, partial)
        ),

        Revision(value, partial=false):: (
        // Commit hash for the specified revision..
            assert utils.asserts.type(value, 'string', 'revision');
            kutils.mixin({"revision": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.PodsMetricSource":: function(path=function(patch){}) {
        _ref: {name: "PodsMetricSource"},

        metricName: null,

        targetAverageValue: null,

        TargetAverageValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({targetAverageValue+: patch})),
        MetricName(value, partial=false):: (
        // metricName is the name of the metric in question.
            assert utils.asserts.type(value, 'string', 'metricName');
            kutils.mixin({"metricName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.EndpointPort":: function(path=function(patch){}) {
        _ref: {name: "EndpointPort"},

        port: null,

        Protocol(value, partial=false):: (
        // The IP protocol for this port.
        // Must be UDP or TCP.
        // Default is TCP..
            assert utils.asserts.type(value, 'string', 'protocol');
            kutils.mixin({"protocol": value}, path, partial)
        ),

        Name(value, partial=false):: (
        // The name of this port (corresponds to ServicePort.Name).
        // Must be a DNS_LABEL.
        // Optional only if one port is defined..
            assert utils.asserts.type(value, 'string', 'name');
            kutils.mixin({"name": value}, path, partial)
        ),

        Port(value, partial=false):: (
        // The port number of the endpoint..
            assert utils.asserts.type(value, 'integer', 'port');
            kutils.mixin({"port": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.FSGroupStrategyOptions":: function(path=function(patch){}) {
        _ref: {name: "FSGroupStrategyOptions"},

        Ranges(value, partial=false):: (
        // Ranges are the allowed ranges of fs groups.
        // If you would like to force a single fs group then supply a single range with the same start and end..
            assert utils.asserts.type(value, 'array', 'ranges');
            kutils.mixin({"ranges": value}, path, partial)
        ),

        Rule(value, partial=false):: (
        // Rule is the strategy that will dictate what FSGroup is used in the SecurityContext..
            assert utils.asserts.type(value, 'string', 'rule');
            kutils.mixin({"rule": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.batch.v1.JobCondition":: function(path=function(patch){}) {
        _ref: {name: "JobCondition"},

        type: null,

        status: null,

        Status(value, partial=false):: (
        // Status of the condition, one of True, False, Unknown..
            assert utils.asserts.type(value, 'string', 'status');
            kutils.mixin({"status": value}, path, partial)
        ),

        LastTransitionTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastTransitionTime+: patch})),
        Reason(value, partial=false):: (
        // (brief) reason for the condition's last transition..
            assert utils.asserts.type(value, 'string', 'reason');
            kutils.mixin({"reason": value}, path, partial)
        ),

        LastProbeTime::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.Time'](function(patch) path({lastProbeTime+: patch})),
        Message(value, partial=false):: (
        // Human readable message indicating details about last transition..
            assert utils.asserts.type(value, 'string', 'message');
            kutils.mixin({"message": value}, path, partial)
        ),

        Type(value, partial=false):: (
        // Type of job condition, Complete or Failed..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.DaemonSetUpdateStrategy":: function(path=function(patch){}) {
        _ref: {name: "DaemonSetUpdateStrategy"},

        RollingUpdate::
           topSelf['io.k8s.kubernetes.pkg.apis.extensions.v1beta1.RollingUpdateDaemonSet'](function(patch) path({rollingUpdate+: patch})),
        Type(value, partial=false):: (
        // Type of daemon set update.
        // Can be "RollingUpdate" or "OnDelete".
        // Default is OnDelete..
            assert utils.asserts.type(value, 'string', 'type');
            kutils.mixin({"type": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1beta1.PolicyRule":: function(path=function(patch){}) {
        _ref: {name: "PolicyRule"},

        verbs: [],

        ApiGroups(value, partial=false):: (
        // APIGroups is the name of the APIGroup that contains the resources.
        // If multiple API groups are specified, any action requested against one of the enumerated resources in any API group will be allowed..
            assert utils.asserts.type(value, 'array', 'apiGroups');
            kutils.mixin({"apiGroups": value}, path, partial)
        ),

        Verbs(value, partial=false):: (
        // Verbs is a list of Verbs that apply to ALL the ResourceKinds and AttributeRestrictions contained in this rule.
        // VerbAll represents all kinds..
            assert utils.asserts.type(value, 'array', 'verbs');
            kutils.mixin({"verbs": value}, path, partial)
        ),

        NonResourceURLs(value, partial=false):: (
        // NonResourceURLs is a set of partial urls that a user should have access to.
        // *s are allowed, but only as the full, final step in the path Since non-resource URLs are not namespaced, this field is only applicable for ClusterRoles referenced from a ClusterRoleBinding.
        // Rules can either apply to API resources (such as "pods" or "secrets") or non-resource URL paths (such as "/api"),  but not both..
            assert utils.asserts.type(value, 'array', 'nonResourceURLs');
            kutils.mixin({"nonResourceURLs": value}, path, partial)
        ),

        Resources(value, partial=false):: (
        // Resources is a list of resources this rule applies to.
        // ResourceAll represents all resources..
            assert utils.asserts.type(value, 'array', 'resources');
            kutils.mixin({"resources": value}, path, partial)
        ),

        ResourceNames(value, partial=false):: (
        // ResourceNames is an optional white list of names that the rule applies to.
        // An empty set means that everything is allowed..
            assert utils.asserts.type(value, 'array', 'resourceNames');
            kutils.mixin({"resourceNames": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.NamespaceStatus":: function(path=function(patch){}) {
        _ref: {name: "NamespaceStatus"},

        Phase(value, partial=false):: (
        // Phase is the current lifecycle phase of the namespace.
        // More info: http://releases.k8s.io/HEAD/docs/design/namespaces.md#phases.
            assert utils.asserts.type(value, 'string', 'phase');
            kutils.mixin({"phase": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicySpec":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicySpec"},

        podSelector: null,

        Ingress(value, partial=false):: (
        // List of ingress rules to be applied to the selected pods.
        // Traffic is allowed to a pod if namespace.networkPolicy.ingress.isolation is undefined and cluster policy allows it, OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod.
        // If this field is empty then this NetworkPolicy does not affect ingress isolation.
        // If this field is present and contains at least one rule, this policy allows any traffic which matches at least one of the ingress rules in this list..
            assert utils.asserts.type(value, 'array', 'ingress');
            kutils.mixin({"ingress": value}, path, partial)
        ),

        PodSelector::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector'](function(patch) path({podSelector+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.PodAntiAffinity":: function(path=function(patch){}) {
        _ref: {name: "PodAntiAffinity"},

        RequiredDuringSchedulingIgnoredDuringExecution(value, partial=false):: (
        // NOT YET IMPLEMENTED.
        // TODO: Uncomment field once it is implemented.
        // If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node.
        // If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g.
        // due to a pod label update), the system will try to eventually evict the pod from its node.
        // When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e.
        // all terms must be satisfied.
        // RequiredDuringSchedulingRequiredDuringExecution []PodAffinityTerm  `json:"requiredDuringSchedulingRequiredDuringExecution,omitempty"` If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node.
        // If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g.
        // due to a pod label update), the system may or may not try to eventually evict the pod from its node.
        // When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e.
        // all terms must be satisfied..
            assert utils.asserts.type(value, 'array', 'requiredDuringSchedulingIgnoredDuringExecution');
            kutils.mixin({"requiredDuringSchedulingIgnoredDuringExecution": value}, path, partial)
        ),

        PreferredDuringSchedulingIgnoredDuringExecution(value, partial=false):: (
        // The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions.
        // The node that is most preferred is the one with the greatest sum of weights, i.e.
        // for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred..
            assert utils.asserts.type(value, 'array', 'preferredDuringSchedulingIgnoredDuringExecution');
            kutils.mixin({"preferredDuringSchedulingIgnoredDuringExecution": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.rbac.v1alpha1.ClusterRoleBindingList":: function(path=function(patch){}) {
        _ref: {name: "ClusterRoleBindingList"},

        items: [],

        Items(value, partial=false):: (
        // Items is a list of ClusterRoleBindings.
            assert utils.asserts.type(value, 'array', 'items');
            kutils.mixin({"items": value}, path, partial)
        ),

        Kind(value, partial=false):: (
        // Kind is a string value representing the REST resource this object represents.
        // Servers may infer this from the endpoint the client submits requests to.
        // Cannot be updated.
        // In CamelCase.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds.
            assert utils.asserts.type(value, 'string', 'kind');
            kutils.mixin({"kind": value}, path, partial)
        ),

        ApiVersion(value, partial=false):: (
        // APIVersion defines the versioned schema of this representation of an object.
        // Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values.
        // More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources.
            assert utils.asserts.type(value, 'string', 'apiVersion');
            kutils.mixin({"apiVersion": value}, path, partial)
        ),

        Metadata::
           topSelf['io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta'](function(patch) path({metadata+: patch})),
    },

    "io.k8s.kubernetes.pkg.api.v1.EnvVarSource":: function(path=function(patch){}) {
        _ref: {name: "EnvVarSource"},

        SecretKeyRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.SecretKeySelector'](function(patch) path({secretKeyRef+: patch})),
        FieldRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ObjectFieldSelector'](function(patch) path({fieldRef+: patch})),
        ResourceFieldRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ResourceFieldSelector'](function(patch) path({resourceFieldRef+: patch})),
        ConfigMapKeyRef::
           topSelf['io.k8s.kubernetes.pkg.api.v1.ConfigMapKeySelector'](function(patch) path({configMapKeyRef+: patch})),
    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.HTTPIngressRuleValue":: function(path=function(patch){}) {
        _ref: {name: "HTTPIngressRuleValue"},

        paths: [],

        Paths(value, partial=false):: (
        // A collection of paths that map requests to backends..
            assert utils.asserts.type(value, 'array', 'paths');
            kutils.mixin({"paths": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.autoscaling.v2alpha1.PodsMetricStatus":: function(path=function(patch){}) {
        _ref: {name: "PodsMetricStatus"},

        metricName: null,

        currentAverageValue: null,

        CurrentAverageValue::
           topSelf['io.k8s.apimachinery.pkg.api.resource.Quantity'](function(patch) path({currentAverageValue+: patch})),
        MetricName(value, partial=false):: (
        // metricName is the name of the metric in question.
            assert utils.asserts.type(value, 'string', 'metricName');
            kutils.mixin({"metricName": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.api.v1.LoadBalancerIngress":: function(path=function(patch){}) {
        _ref: {name: "LoadBalancerIngress"},

        Ip(value, partial=false):: (
        // IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers).
            assert utils.asserts.type(value, 'string', 'ip');
            kutils.mixin({"ip": value}, path, partial)
        ),

        Hostname(value, partial=false):: (
        // Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers).
            assert utils.asserts.type(value, 'string', 'hostname');
            kutils.mixin({"hostname": value}, path, partial)
        ),

    },

    "io.k8s.kubernetes.pkg.apis.extensions.v1beta1.NetworkPolicyPort":: function(path=function(patch){}) {
        _ref: {name: "NetworkPolicyPort"},

        Protocol(value, partial=false):: (
        // Optional.
        // The protocol (TCP or UDP) which traffic must match.
        // If not specified, this field defaults to TCP..
            assert utils.asserts.type(value, 'string', 'protocol');
            kutils.mixin({"protocol": value}, path, partial)
        ),

        Port::
           topSelf['io.k8s.apimachinery.pkg.util.intstr.IntOrString'](function(patch) path({port+: patch})),
    },

}
