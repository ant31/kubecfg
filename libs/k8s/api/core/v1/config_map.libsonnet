local common = (import "k8s/api/common.libsonnet");

local ConfigMap = {
    Uuid:: {name: "configMap", id: "AC74E727-0605-4872-8F30-E5CAFB2A0984"},
    Create(name, data={})::
      self.New(name) +
      self.Init() +
      self.MergeData(data),

    Init()::
      {data: {}},

    MergeData(data)::
      {data+: data},

    Data(data)::
      {data: data},

};

common("ConfigMap", "core", "v1") +
ConfigMap


