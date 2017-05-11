local common = (import "k8s/api/common.libsonnet");

local Service = {
    Uuid:: {name: "configMap", id: "AC74E727-0605-4872-8F30-E5CAFB2A0984"},
    Init()::
      {spec: {}},

    Create(name, ports=[], selector=null, type="ClusterIP"):: (
      local local_selector =
        if selector == null then
            {app: name}
        else
            selector;
      self.New(name) +
      self.Init() +
      self.Type(type) +
      self.setSelector(local_selector) +
      self.setPorts(ports)),

    Type(type)::
      self.mergeSpec({clusterType: type}),

    Selector(selector)::
      self.mergeSpec({selector: selector}),

    Utils:: {
     ports(ports):: [ ]
    //    if std.type(port) == "number" then
    //     core.v1.port.service.Named(portUtils.portName(port), port, port)
    //    else
    //     core.v1.port.service.Named(
    //      if std.objectHas(port, 'name') then port.name else portUtils.portName(port.port),
    //      port.port,
    //      if std.objectHas(port, 'targetPort') then port.targetPort else port.port)
    //     for port in ports
    //    ],
    },
    mergeSpec(spec)::
      {spec+: spec},
    setPorts(ports):: self.mergeSpec({ports: service.Utils.ports(ports)}),
    mergePorts(ports):: self.mergeSpec({ports+: service.Utils.ports(ports)}),

};

local s = common("Service", "core", "v1") +
Service;
s.Create("toto")

// # fieldName
// # type: string
// FieldName(value) -> replace

// # fieldName
// # type: object
// FieldName(obj) -> replace
// mergeFieldName(obj) -> mergePatch
// addFieldName(key, value) -> mergeFieldName({key: value})

// # fieldName
// # type: objRef
// FieldName: {
//  _Path:
//  Init -> requiredFields
//  mergeFieldName(obj, partial=False) -> mergePatch (from top) # or detect if it's partial or not ?
// }
//  setFieldName(obj) -> replace
//  mergeFieldName(obj) -> mergePatch

//

//{
 //   ApiVersion(name):
//}

//  "v1.Service": {
//     "id": "v1.Service",
//     "description": "Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.",
//     "properties": {
//      "kind": {
//       "type": "string",
//       "description": "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#types-kinds"
//      },
//      "apiVersion": {
//       "type": "string",
//       "description": "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#resources"
//      },
//      "metadata": {
//       "$ref": "v1.ObjectMeta",
//       "description": "Standard object's metadata. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#metadata"
//      },
//      "spec": {
//       "$ref": "v1.ServiceSpec",
//       "description": "Spec defines the behavior of a service. http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#spec-and-status"
//      },
//      "status": {
//       "$ref": "v1.ServiceStatus",
//       "description": "Most recently observed status of the service. Populated by the system. Read-only. More info: http://releases.k8s.io/HEAD/docs/devel/api-conventions.md#spec-and-status"
//      }
//     }
//    },
//    "v1.ServiceSpec": {
//     "id": "v1.ServiceSpec",
//     "description": "ServiceSpec describes the attributes that a user creates on a service.",
//     "properties": {
//      "ports": {
//       "type": "array",
//       "items": {
//        "$ref": "v1.ServicePort"
//       },
//       "description": "The list of ports that are exposed by this service. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies"
//      },
//      "selector": {
//       "type": "object",
//       "description": "Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: http://kubernetes.io/docs/user-guide/services#overview"
//      },
//      "clusterIP": {
//       "type": "string",
//       "description": "clusterIP is the IP address of the service and is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. This field can not be changed through updates. Valid values are \"None\", empty string (\"\"), or a valid IP address. \"None\" can be specified for headless services when proxying is not required. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies"
//      },
//      "type": {
//       "type": "string",
//       "description": "type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. \"ExternalName\" maps to the specified externalName. \"ClusterIP\" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is \"None\", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. \"NodePort\" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. \"LoadBalancer\" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: http://kubernetes.io/docs/user-guide/services#overview"
//      },
//      "externalIPs": {
//       "type": "array",
//       "items": {
//        "type": "string"
//       },
//       "description": "externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.  A previous form of this functionality exists as the deprecatedPublicIPs field.  When using this field, callers should also clear the deprecatedPublicIPs field."
//      },
//      "deprecatedPublicIPs": {
//       "type": "array",
//       "items": {
//        "type": "string"
//       },
//       "description": "deprecatedPublicIPs is deprecated and replaced by the externalIPs field with almost the exact same semantics.  This field is retained in the v1 API for compatibility until at least 8/20/2016.  It will be removed from any new API revisions.  If both deprecatedPublicIPs *and* externalIPs are set, deprecatedPublicIPs is used."
//      },
//      "sessionAffinity": {
//       "type": "string",
//       "description": "Supports \"ClientIP\" and \"None\". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies"
//      },
//      "loadBalancerIP": {
//       "type": "string",
//       "description": "Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature."
//      },
//      "loadBalancerSourceRanges": {
//       "type": "array",
//       "items": {
//        "type": "string"
//       },
//       "description": "If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature.\" More info: http://kubernetes.io/docs/user-guide/services-firewalls"
//      },
//      "externalName": {
//       "type": "string",
//       "description": "externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid DNS name and requires Type to be ExternalName."
//      }
//     }
//    },
//    "v1.ServicePort": {
//     "id": "v1.ServicePort",
//     "description": "ServicePort contains information on service's port.",
//     "required": [
//      "port"
//     ],
//     "properties": {
//      "name": {
//       "type": "string",
//       "description": "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. This maps to the 'Name' field in EndpointPort objects. Optional if only one ServicePort is defined on this service."
//      },
//      "protocol": {
//       "type": "string",
//       "description": "The IP protocol for this port. Supports \"TCP\" and \"UDP\". Default is TCP."
//      },
//      "port": {
//       "type": "integer",
//       "format": "int32",
//       "description": "The port that will be exposed by this service."
//      },
//      "targetPort": {
//       "type": "string",
//       "description": "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: http://kubernetes.io/docs/user-guide/services#defining-a-service"
//      },
//      "nodePort": {
//       "type": "integer",
//       "format": "int32",
//       "description": "The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: http://kubernetes.io/docs/user-guide/services#type--nodeport"
//      }
//     }
//    },
//    "v1.ServiceStatus": {
//     "id": "v1.ServiceStatus",
//     "description": "ServiceStatus represents the current status of a service.",
//     "properties": {
//      "loadBalancer": {
//       "$ref": "v1.LoadBalancerStatus",
//       "description": "LoadBalancer contains the current status of the load-balancer, if one is present."
//      }
//     }
//    },
//    "v1.LoadBalancerStatus": {
//     "id": "v1.LoadBalancerStatus",
//     "description": "LoadBalancerStatus represents the status of a load-balancer.",
//     "properties": {
//      "ingress": {
//       "type": "array",
//       "items": {
//        "$ref": "v1.LoadBalancerIngress"
//       },
//       "description": "Ingress is a list containing ingress points for the load-balancer. Traffic intended for the service should be sent to these ingress points."
//      }
//     }
//    },
//    "v1.LoadBalancerIngress": {
//     "id": "v1.LoadBalancerIngress",
//     "description": "LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point.",
//     "properties": {
//      "ip": {
//       "type": "string",
//       "description": "IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers)"
//      },
//      "hostname": {
//       "type": "string",
//       "description": "Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers)"
//      }
//     }
//    }

//  service:: {
//       Default(name, portList, labels={}, annotations={})::
//         local defaultMetadata =
//           common.Metadata(
//             $.v1.metadata.Name(name) +
//             $.v1.metadata.Labels(labels) +
//             $.v1.metadata.Annotations(annotations));
//         local serviceKind = common.Kind("Service");
//         bases.Service + $.v1.ApiVersion + serviceKind + defaultMetadata {
//           spec: {
//             ports: portList,
//           },
//         },

//       // TODO: Incorrect indentation below.
//         Metadata:: common.mixin.Metadata,
//         Spec(mixin):: {spec+: mixin},

//         spec:: {
//           local typeOptions = std.set([
//             "ExternalName", "ClusterIP", "NodePort", "LoadBalancer"]),
//           local sessionAffinityOptions = std.set(["ClientIP", "None"]),

//           Port(port)::
//             // base.Verify(bases.Service) +
//             {ports+: [port]},

//           Selector(selector)::
//             // base.Verify(bases.Service) +
//             {selector: selector},

//           ClusterIp(clusterIp)::
//             // base.Verify(bases.Service) +
//             kubeAssert.Type("clusterIp", clusterIp, "string") +
//             {clusterIP: clusterIp},

//           Type(type)::
//             // base.Verify(bases.Service) +
//             kubeAssert.InSet("type", type, typeOptions) +
//             {type: type},

//           ExternalIps(externalIpList)::
//             // base.Verify(bases.Service) +
//             // TODO: Verify that externalIpList is a list of string.
//             kubeAssert.Type("externalIpList", externalIpList, "array") +
//             {externalIPs: externalIpList},

//           SessionAffinity(sessionAffinity)::
//             // base.Verify(bases.Service) +
//             kubeAssert.InSet(
//               "sessionAffinity", sessionAffinity, sessionAffinityOptions) +
//             {sessionAffinity: sessionAffinity},

//           LoadBalancerIp(loadBalancerIp)::
//             // base.Verify(bases.Service) +
//             kubeAssert.Type("loadBalancerIp", loadBalancerIp, "string") +
//             {loadBalancerIP: loadBalancerIp},

//           LoadBalancerSourceRanges(loadBalancerSourceRanges)::
//             // base.Verify(bases.Service) +
//             // TODO: Verify that loadBalancerSourceRanges is a list
//             // of string.
//             kubeAssert.Type(
//               "loadBalancerSourceRanges", loadBalancerSourceRanges, "array") +
//             {loadBalancerSourceRanges: loadBalancerSourceRanges},

//           ExternalName(externalName)::
//             // base.Verify(bases.Service) +
//             kubeAssert.Type("externalName", externalName, "string") +
//             {externalName: externalName},
//         },

//         mixin:: {
//           metadata:: common.mixin.metadata {
//             annotation:: {
//               TolerateUnreadyEndpoints(truthiness)::
//                 common.mixin.metadata.Annotation(
//                   "service.alpha.kubernetes.io/tolerate-unready-endpoints",
//                   truthiness),
//             },
//           },

//           spec:: {
//             local service = $.v1.service,

//             Port::
//               meta.MixinPartial1(service.spec.Port, service.Spec),
//             Selector::
//               meta.MixinPartial1(service.spec.Selector, service.Spec),
//             ClusterIp::
//               meta.MixinPartial1(service.spec.ClusterIp, service.Spec),
//             Type::
//               meta.MixinPartial1(service.spec.Type, service.Spec),
//             ExternalIps::
//               meta.MixinPartial1(service.spec.ExternalIps, service.Spec),
//             SessionAffinity::
//               meta.MixinPartial1(service.spec.SessionAffinity, service.Spec),
//             LoadBalancerIp::
//               meta.MixinPartial1(service.spec.LoadBalancerIp, service.Spec),
//             LoadBalancerSourceRanges:: meta.MixinPartial1(
//               service.spec.LoadBalancerSourceRanges, service.Spec),
//             ExternalName::
//               meta.MixinPartial1(service.spec.ExternalName, service.Spec),
//           },
//         },
//     },
