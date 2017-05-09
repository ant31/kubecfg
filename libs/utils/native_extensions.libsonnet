local utils = import "utils.libsonnet";

local native = {
  local nativeExtensions = self,
  # Returns hash of the string representation of an object.

  random: {
    # Random alpha-numeric string of length `size`
    randAlphaNum(size=32, seed=""):: (
      std.native("rand_alphanum")(std.toString(size), seed=seed)
    ),

    # Random alpha string of length `size`
    randAlpha(size=32, seed=""):: (
      std.native("rand_alpha")(std.toString(size), seed=seed)
    ),

    # Random numeric string of length `size`
    randInt(size=32, seed=""):: (
      std.native("randint")(std.toString(size), seed=seed)
    ),
  },

  secure: {
    hash(data, hashtype='sha1'):: (
      std.native("hash")(std.toString(data), hashtype)
    ),

    # Generate privateKeys.
    # Keytype choices: 'rsa', 'ecdsa', 'dsa'.
    # key allows to generate a unique key per run
    genPrivateKey(keytype, key=""):: (
      std.native("privatekey")(keytype, key=key, seed=initSeed)
    ),
  },

  template: {
    # Render jinja2 template
    jinja2(template, env={}):: (
      std.native("jinja2")(template, std.toString(env))
    ),

    # Render jsonnet template
    jsonnet(template, env={}):: (
      std.native("jsonnet")(template, std.toString(env))
    ),
  },

  parser: {
    # Convert json string to object
    jsonLoads(data):: (
      std.native("json_loads")(data)
    ),

    loadObject(data):: (
      std.native("obj_loads")(std.toString(data))
    ),

    # Convert yaml string to object
    yamlLoads(data):: (
      std.native("yaml_loads")(data)),
  },

  render: {
    # Converts an object to yaml string
    toYaml(data):: (
      std.native("to_yaml")(std.toString(data))
    ),
  },

  path: {
    # Read a file
    readfile(filepath):: (
      std.native("read")(filepath)
    ),
  },

  local initSeed = nativeExtensions.randAlpha(256),

};


native +
utils.objectFlatten(native) // un-namespace