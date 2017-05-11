local api = import "k8s-swagger.json";

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

local convertToObjects(def) = (
{[objectName]: def[objectName]["x-kubernetes-group-version-kind"],
for objectName in std.objectFields(def)
if std.objectHas(def[objectName],
                "x-kubernetes-group-version-kind")
}
);

local newdef = processDefinitions(definitions);
convertToObjects(newdef)
// definitions
