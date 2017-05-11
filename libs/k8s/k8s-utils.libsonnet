local utils = import "utils/utils.libsonnet";

{
 local kutils = self,

 GenerateMethods(fields, path, partial=false):: (
   utils.objectFlatten({[key]: kutils.GenerateFieldMethods(key, fields[key], path, partial),
                                          for key in std.objectFields(fields)})
 ),

 GenerateFieldMethods(name, obj, path, default_partial=false):: (
       local capName = utils.capitalize(name);
           { [capName]:: function(value, partial=default_partial) (
               //assert utils.asserts.type(value, obj.type, name);
               kutils.mixin({[name]: value}, path, partial)
           ) } +

      if obj.type == "array"  || obj.type == "object" then
        {
           [capName]:: function(value, partial=default_partial) (
      //         assert utils.asserts.type(value, obj.type, name);
               kutils.mixin({[name]: value}, path, partial)
           ),
           ["merge%s" % capName]:: function(value, partial=default_partial) (
        //       assert utils.asserts.type(value, obj.type, name);
               kutils.mixin({[name]+: value}, path, partial)
           ),
        } else {} +

        if obj.type == "array" then
          {
              ["add%s" % capName]:: function(value, partial=default_partial) (
               kutils.mixin({[name]+: [value]}, path, partial)
           )} else {} +
       if obj.type == "object" then
        {
           ["add%s" % capName]:: function(key, value, partial=default_partial) (
               kutils.mixin({[name]+: {[key]: value}}, path, partial)
           ),
        } else {}
        ),

  mixin(patch, fn, partial=false):: (
    if partial == false
    then fn(patch)
    else patch
 ),
   portName(port):: "port-%s" % port,
    resource: {
      getName(obj)::
        obj['metadata']['name'],
      getLabels(obj)::
        obj['metadata']['labels'],
      setNamespace(namespace)::
       { metadata+: {namespace: namespace } },
      setName(name)::
       { metadata+: {name: name} },
    },

  base: {
  local baseName = "B98F6CE0-DEE9-43AE-BC09-C7C8EDE55029",
  init(name, id):: {
    [baseName]:: {
      name: name,
      id: id,
    },
  },

  verify(targetBase):: {
    // assert super[baseName].id == targetBase[baseName].id
    //   : "Can't '+' object of type '%s' with object of type '%s'"
    //   % [super[baseName].name, targetBase[baseName].name]
  },
},
}
