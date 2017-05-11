from kubecfg.commands.jsonnet import JsonnetCmd
from kubecfg.commands.command_base import LoadVariables


class GenerateCmd(JsonnetCmd):
    name = 'generate'
    help_message = "Generate kubernetes resources"

    @classmethod
    def _add_arguments(cls, parser):
        parser.add_argument("--namespace", help="kubernetes namespace", default='default')
        parser.add_argument("-x", "--variables", help="variables", default={}, action=LoadVariables)
        parser.add_argument('filepath', nargs='?', default=["./manifest.jsonnet"], help="Fetch package from the registry")

    def _call(self):
        self.action = 'generate'
        super(GenerateCmd, self)._call()