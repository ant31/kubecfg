local assertutils = import "utils/assert-utils.libsonnet";
{
    # Generate a sequence array from 1 to i
   seq(i):: (
      [x for x in std.range(1, i)]
   ),

  objectFlatten(obj):: {
    // Merge 1 level dict depth into toplevel
    [k]: obj[j][k], for j in std.objectFields(obj)
                  for k in std.objectFields(obj[j])
  },

   compact(array):: (
     [x for x in array if x != null]
   ),

   objectValues(obj):: (
     local fields =  std.objectFields(obj);
      [obj[key] for key in fields]
   ),

   objectMap(func, obj):: (
    local fields = std.objectFields(obj);
    {[key]: func(obj[key]) for key in fields}
    ),

  asserts: assertutils
}