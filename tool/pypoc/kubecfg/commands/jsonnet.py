import os
import json
from kubecfg.render_jsonnet import RenderJsonnet
from kubecfg.commands.command_base import CommandBase, LoadVariables


class JsonnetCmd(CommandBase):
    name = 'jsonnet'
    help_message = "Resolve a jsonnet file with the kubecfgstd available"

    def __init__(self, options):
        super(JsonnetCmd, self).__init__(options)
        self.namespace = options.namespace
        self.variables = options.variables
        if isinstance(options.filepath, list):
            self.filepath = options.filepath[0]
        else:
            self.filepath = options.filepath
        self.result = None
        self.action = "package"

    @classmethod
    def _add_arguments(cls, parser):
        parser.add_argument("--namespace", help="kubernetes namespace", default='default')
        parser.add_argument("-x", "--variables", help="variables", default={}, action=LoadVariables)
        parser.add_argument('filepath', nargs=1, help="jsonnet file to render")

    def _call(self):
        r = RenderJsonnet(manifestpath=self.filepath)
        if os.path.basename(self.filepath) == "manifest.jsonnet":
            namespace = self.namespace
            self.variables['namespace'] = namespace
            tla_codes = {"params": json.dumps({"variables": self.variables, "action": self.action})}
        else:
            tla_codes = self.variables
        p = open(self.filepath).read()
        self.result = r.render_jsonnet(p, tla_codes=tla_codes)

    def _render_dict(self):
        return self.result

    def _render_console(self):
        return json.dumps(self._render_dict(), indent=2, separators=(',', ': '))
