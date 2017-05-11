local common = (import "k8s/api/common.libsonnet");
local meta = common("Service", "core", "v1");
local utils = import "utils/utils.libsonnet";
local kutils = import "k8s/k8s-utils.libsonnet";


local portFields = {
     "name": {
      "description": "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. This maps to the 'Name' field in EndpointPort objects. Optional if only one ServicePort is defined on this service.",
      "type": "string"
     },
     "nodePort": {
      "description": "The port on each node on which this service is exposed when type=NodePort or LoadBalancer. Usually assigned by the system. If specified, it will be allocated to the service if unused or else creation of the service will fail. Default is to auto-allocate a port if the ServiceType of this Service requires one. More info: http://kubernetes.io/docs/user-guide/services#type--nodeport",
      "type": "integer",
      "format": "int32"
     },
     "port": {
      "description": "The port that will be exposed by this service.",
      "type": "integer",
      "format": "int32"
     },
     "protocol": {
      "description": "The IP protocol for this port. Supports \"TCP\" and \"UDP\". Default is TCP.",
      "type": "string"
     },
     "targetPort": {
      "description": "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: http://kubernetes.io/docs/user-guide/services#defining-a-service",
      "type": "string"
     }
    };


local specFields =  {
      "selector": {
      "type": "object",
      "description": "Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: http://kubernetes.io/docs/user-guide/services#overview"
      },

     "clusterIP": {
      "type": "string",
      "description": "clusterIP is the IP address of the service and is usually assigned randomly by the master. If an address is specified manually and is not in use by others, it will be allocated to the service; otherwise, creation of the service will fail. This field can not be changed through updates. Valid values are \"None\", empty string (\"\"), or a valid IP address. \"None\" can be specified for headless services when proxying is not required. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies"
     },
     "type": {
      "type": "string",
      "description": "type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. \"ExternalName\" maps to the specified externalName. \"ClusterIP\" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object. If clusterIP is \"None\", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a stable IP. \"NodePort\" builds on ClusterIP and allocates a port on every node which routes to the clusterIP. \"LoadBalancer\" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the clusterIP. More info: http://kubernetes.io/docs/user-guide/services#overview"
     },
     "externalIPs": {
      "type": "array",
      "items": {
       "type": "string"
      },
      "description": "externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.  A previous form of this functionality exists as the deprecatedPublicIPs field.  When using this field, callers should also clear the deprecatedPublicIPs field."
     },
     "deprecatedPublicIPs": {
      "type": "array",
      "items": {
       "type": "string"
      },
      "description": "deprecatedPublicIPs is deprecated and replaced by the externalIPs field with almost the exact same semantics.  This field is retained in the v1 API for compatibility until at least 8/20/2016.  It will be removed from any new API revisions.  If both deprecatedPublicIPs *and* externalIPs are set, deprecatedPublicIPs is used."
     },
     "sessionAffinity": {
      "type": "string",
      "description": "Supports \"ClientIP\" and \"None\". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: http://kubernetes.io/docs/user-guide/services#virtual-ips-and-service-proxies"
     },
     "loadBalancerIP": {
      "type": "string",
      "description": "Only applies to Service Type: LoadBalancer LoadBalancer will get created with the IP specified in this field. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature."
     },
     "ports": {
         "type": "array"
     },
     "loadBalancerSourceRanges": {
      "type": "array",
      "items": {
       "type": "string"
      },
      "description": "If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature.\" More info: http://kubernetes.io/docs/user-guide/services-firewalls"
     },
     "externalName": {
      "type": "string",
      "description": "externalName is the external reference that kubedns or equivalent will return as a CNAME record for this service. No proxying will be involved. Must be a valid DNS name and requires Type to be ExternalName."
       }
     };

local ServicePort = function(path, fields)(
    local servicePort = kutils.GenerateMethods(fields, path, partial=true);
    servicePort
)(function(patch) {spec+: {port+: patch}, portFields);

local ServiceSpec = function(path, fields) (
    local serviceSpec = kutils.GenerateMethods(fields, path),
    serviceSpec
)(function(patch) {spec+: patch}, specFields)

local servicePortUtil = {
      new(name, port, targetPort=null, partial=false)::
        local serviceport = servicePort.Name(name) +
                     servicePort.Port(port) +
                     if targetPort != null then servicePort.TargetPort(targetPort) else {};
        // kutils.mixin(port, path, partial),
        serviceport,
      Ports(ports):: [
        if std.type(port) == "number" then
         self.new(kutils.portName(port), port)
       else
        self.new(
         if std.objectHas(port, 'name') then port.name else kutils.portName(port.port),
         port.port,
         if std.objectHas(port, 'targetPort') then port.targetPort)
        for port in ports
       ],
    };
    servicePort + servicePortUtil
);

//     fn:: serviceSpec + {
//       Port:: ServicePort(function(patch) path({ports+: [patch]}),
//                          portFields),
//       Ports:: self.Port.Ports
//     },
//     ports: [],

//     }
// );


local Service = {
    _path(patch):: {spec+: patch},
    spec: ServiceSpec(self._path, specFields),
    Spec:: self.spec
} + meta;

// Service // + Service.Spec.Ports.add({port: 300}) + Service.Spec.Ports.merge([{port: 3000}])
// + Service.Spec.Type("UTC") + Service.Spec.ExternalIPs(3) + Service.Metadata.AddLabel("youpi", "test") +
// Service.Spec.Ports.set(
// Service + Service.Spec.Ports(Service.Spec.Port.new(80, "toto"))
//  + Service.Spec.mergePorts([{port: 3000}])
Service + {port: Service.Spec.Ports([80])}