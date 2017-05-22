local api = import "k8s-swagger.json";
local kutils = import "k8s/k8s-utils.libsonnet";

local definitions = api.definitions;

local readFullRef(ref) = (
  assert std.startsWith(ref, "#/definitions/");
  ref[14:]
);
local replaceRef(definitions, property) = (
   // $ref: '#/definitions/io.k8s.apimachinery.pkg.util.intstr.IntOrString'
    if std.objectHas(property, "$ref") then
       {type: readFullRef(property["$ref"])}
     else {}
);
local processDefinitions(def) = (
  local newdef =
     {[objectName]: if std.objectHas(def[objectName], "properties") == true then
       def[objectName] + {properties+:
     {[property]+:
      replaceRef(def, def[objectName]['properties'][property])
      for property in std.objectFields(def[objectName]["properties"])}}
      else def[objectName]
     for objectName in std.objectFields(def)
     };
  // local newdef = {
  //   [objectName]: if std.objectHas(def[objectName], "properties") == false
  //     then std.objectFields(def[objectName]) else {},
  //   for objectName in std.objectFields(def)
  // };
     newdef
);

local listObjects(def) = (
[objectName
for objectName in std.objectFields(def)
if std.objectHas(def[objectName],
                "x-kubernetes-group-version-kind")
]
);

local requiredFields(def, key) = (
   if std.objectHas(def[key], "required") then
   {
    [field]:
      local type = def[key]['properties'][field].type;
      if type == "array" then []
      else if type == "object" then {}
      else null
      for field in def[key]["required"]

  } else {}
);

local newdef = processDefinitions(definitions);
local keys = listObjects(newdef);
local objs = {[key]: {fn:: kutils.GenerateMethods(newdef[key].properties, function(patch) patch, false)}
                     + requiredFields(newdef, key)
for key in keys};

local key = "io.k8s.kubernetes.pkg.api.v1.Service";
{fn: std.objectFieldsAll(objs[key]['fn'])} +
objs[key]['fn'].ApiVersion("v3") + objs[key]
// definitions
  