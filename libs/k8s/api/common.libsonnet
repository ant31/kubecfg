local utils = import "utils/utils.libsonnet";
local k8sutils = import "k8s/k8s-utils.libsonnet";
local base = k8sutils.base;

function(kind, ext="core", version="v1")

local meta = {
    local realSelf = self,
    Load(obj):: obj + realSelf,
    New(name, namespace=null)::
        realSelf +
        realSelf.Metadata.Name(name) +
        realSelf.Metadata.Namespace(namespace),

   Metadata:: {
      Init()::
        {metadata: {annotations: {}, labels: {}}},

      Create(name=null, namespace=null, annotations={}, labels={}):: (
        self.Init() +
        (if name != null then self.Name(name) else {}) +
          self.MergeAnnotations(annotations) +
          self.MergeLabels(labels)
      ),

      Name(name)::
        local check = base.verify(self.uuid) && utils.asserts.type(name, "string", "name");
        {metadata+: {name: name}},

      AddLabel(key, value)::
        base.verify(self.uuid) +
        {metadata+: {labels+: {[key]: value}}},

      MergeLabels(labels)::
        base.verify(self.uuid) +
        {metadata+: {labels+: labels}},

      Namespace(namespace=null):: (
        local ns =
           if namespace == null then {}
           else
             base.verify(self.uuid) +
             utils.asserts.type(namespace, "string", "namespace") +
             {metadata+: {namespace: namespace}};
        ns),
      AddAnnotation(key, value)::
        base.verify(self.uuid) +
        {metadata+: {annotations+: {[key]: value}}},

      MergeAnnotations(annotations)::
        base.verify(self.uuid) +
        {metadata+: {annotations+: annotations}},
    },
};

{
 kind: if utils.asserts.type(kind, "string", "kind") then kind,
 apiVersion: if ext == "core" then version else "%s/%s" % [ext, version]
} + meta + meta.Metadata.Create()

