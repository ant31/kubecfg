#!/usr/bin/env python
import os
import urllib3
import yaml
import json
import jinja2


def cap(line):
    return (line[0].upper() + line[1:])


def addSet(word):
    if word.istitle():
        return "set%s" % word
    else:
        return cap(word)


def comment(longcomment, space=4):
    lines = longcomment.split(". ")
    res = "\n".join(["%s// %s." % (" " * space, line.strip().replace("\n", ""))
                     for line in lines if len(line) > 0])
    return res


def split(line, delim):
    return line.split(delim)


def ref(line):
    assert line.startswith("#/definitions/")
    return line[14:]


def filters():
    return {
        "cap": cap,
        "comment": comment,
        "split": split,
        "ref": ref,
        "addSet": addSet,
    }


TEMPLATE = """
local utils = import "utils/utils.libsonnet";
local kutils = import "k8s/k8s-utils.libsonnet";

{
    local topSelf = self,
{% for model in models %}
    "{{model}}":: function(path=function(patch){}) {
        _ref:: {name: "{{model | split('.') | last}}"},

{% if 'required' in spec[model] %}
{% for field in spec[model]['required'] %}
{% if spec[model]['properties'][field]['type'] == "array" %}
        {{field}}: [],
{% elif spec[model]['properties'][field]['type'] == "object" %}
        {{field}}: {},
{% else %}
        {{field}}: null,
{% endif %}

{% endfor %}
{% endif %}
{% if 'properties' in spec[model] %}
{% for property in spec[model]['properties'] %}
{% if '$ref' in spec[model]['properties'][property] %}
        {{property | addSet}}::
           topSelf['{{spec[model]['properties'][property]['$ref'] | ref}}'](function(patch) path({{'{'}}{{property}}+: patch})),
{% else %}
        {{property | addSet}}(value, partial=false):: (
{% if 'description' in spec[model]['properties'][property] %}
{{spec[model]['properties'][property]['description'] | comment(8) }}
{% endif %}
{% if 'type' in spec[model]['properties'][property] %}
            assert utils.asserts.type(value, '{{spec[model]['properties'][property]['type']}}', '{{property}}');
{% endif %}
            kutils.mixin({{'{'}}"{{property}}": value}, path, partial)
        ),

{% endif %}
{% endfor %}
{% endif %}
    },

{% endfor %}
}
"""
VERSION = "v1.6.3"


def swagger_file(version=VERSION):
    return os.path.join(os.path.dirname(__file__), 'swagger-%s.json' % version)


def download_spec(version=VERSION):
    spec_url = 'https://raw.githubusercontent.com/kubernetes/kubernetes/' \
                '%s/api/openapi-spec/swagger.json' % version
    output_path = swagger_file(version)
    pool = urllib3.PoolManager()
    with pool.request('GET', spec_url, preload_content=False) as response:
        if response.status != 200:
            raise RuntimeError("Error downloading spec file. Reason: %s" % response.reason)
        with open(output_path, 'w') as out:
            out.write(response.read())


def load_swagger(version=VERSION):
    filepath = swagger_file(version)
    if not os.path.exists(filepath):
        download_spec(version)
    return json.load(open(filepath, "r"))


def main():
    swagger = load_swagger()
    spec = swagger['definitions']
    params = {'models': spec.keys(), 'spec': spec}
    jinja_env = jinja2.Environment()
    jinja_env.trim_blocks = True
    jinja_env.lstrim_blocks = True
    jinja_env.filters.update(filters())
    template = jinja_env.from_string(TEMPLATE)
    render = template.render(params)
    print render

if __name__ == "__main__":
    main()


Dict  ObjectName {
 add(key, value):
  assert value == type or object

  merge(value):
  assert value == type or object
} + topSelf[...]
ObjectName: self.Dict
setDict(value)
  assert value = type or object

arrayToDict(key):

dictToArray(key):

Array:
 _key: 'name',
 _types: ['object', 'SomethingElse']
 append(value),
 toDict(),
 delete(pos=null, key=null):

Ports.append(80)
Ports.add(80, {value})
Ports.merge({value})
