{
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
}
