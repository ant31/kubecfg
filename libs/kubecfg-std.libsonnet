local nativeExtensions = import "utils/native_extensions.libsonnet"
local k8sutils = import "utils/k8s-utils.libsonnet"
local utils = import "utils/utils.libsonnet"

{
  native: nativeExtensions,
  utils: utils,
}