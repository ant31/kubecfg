
{
    type(value, targetType, fieldName=""):: (
    local typeAliases = {
      "number": "number",
      "object": "object",
      "array": "array",
      "list": "array",
      "none": "null",
      "null": "null",
      "boolean": "boolean",
      "bool": "boolean",
      "integer": "number",
      "double": "number",
      "float": "number",
      "dict": "object",
      "str": "string",
      "string": "string",
      "function": "function"};

    local observedType = std.type(value);
    assert observedType == typeAliases[targetType]
      : "Field %s must be type '%s'; value was type '%s', with value '%s'"
      % [fieldName, targetType, observedType, value];
    true
    ),

  inSet(value, set, fieldName=""):: (
    assert std.length(set) > 0 && std.type(set[0]) == std.type(value)
      : "Field %s with value '%s' is of type '%s', but set '%s' contains elements of type '%s'"
      % [fieldName, value, std.type(value), set, std.type(set[0])];
    assert std.length(std.setInter(set, [value])) == 1
      : "Field %s with value '%s' must be in set '%s'"
      % [fieldName, value, set];
    true
  ),

  portRange(port, portName=""):: (
    local checkType = self.type(port, "number", portName);
    checkType && assert port > 0 && port < 65536
      : "Port %s must be in range 0 < port < 65536, but had value '%d'"
      % [portName, port];
    true),
}
