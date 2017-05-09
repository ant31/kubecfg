local utils = import "../../utils/utils.libsonnet";

local common = {
    _new(kind, api)::
        self.kind(kind) +
        self.metadata(),
    kind(kind):: utils.asserts.type(kind, "string", "kind") {kind: kind},
    metadata(name=null, namespace=null, annotations=null, labels=null)::
        {metadata+: {name: name, namespace: namespace, annotations: annotations, labels: labels},
    },

    //
    // Namespace.
    //

    // namespace:: {
    //   Default(name)::
    //     bases.Namespace +
    //     kubeAssert.Type("name", name, "string") +
    //     $.v1.ApiVersion +
    //     common.Kind("Namespace") +
    //     common.Metadata($.v1.metadata.Name(name)),
    // },
    // TODO: This sets the metadata property, rather than doing a
    // mixin. Is this what we want?
//     Metadata(metadata={}):: {metadata: $.v1.metadata.Default() + metadata},

//     mixin:: {
//       Metadata(mixin):: {metadata+: mixin},

//       metadata:: {
//         local metadata = $.v1.metadata,
//         local mixin = common.mixin,

//         Name:: meta.MixinPartial1(metadata.Name, mixin.Metadata),
//         Label:: meta.MixinPartial2(metadata.Label, mixin.Metadata),
//         Labels:: meta.MixinPartial1(metadata.Labels, mixin.Metadata),
//         Namespace:: meta.MixinPartial1(metadata.Namespace, mixin.Metadata),
//         Annotation:: meta.MixinPartial2(metadata.Annotation, mixin.Metadata),
//         Annotations::
//           meta.MixinPartial1(metadata.Annotations, mixin.Metadata),
//       },
//     },
   };

common._new("deployment", "apps/v1beta1")