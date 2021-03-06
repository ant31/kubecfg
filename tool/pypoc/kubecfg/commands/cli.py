#!/usr/bin/env python
import argparse
import os

from kubecfg.commands.command_base import CommandBase
from kubecfg.commands.generate import GenerateCmd
from kubecfg.commands.jsonnet import JsonnetCmd
from kubecfg.commands.version import VersionCmd


def all_commands():
    base_cmd = {}
    for cmd in base_cmd.values():
        cmd.__bases__ = (CommandBase,)

    base_cmd.update({
        VersionCmd: VersionCmd,
        JsonnetCmd.name: JsonnetCmd,
        GenerateCmd.name: GenerateCmd,
    })
    return base_cmd


def get_parser(commands):
    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers(help='command help')
    for command_class in commands.values():
        command_class.add_parser(subparsers)
    return parser


def cli():
    try:
        parser = get_parser(all_commands())
        unknown = None
        args, unknown = parser.parse_known_args()
        if args.parse_unknown:
            args.func(args, unknown)
        else:
            args = parser.parse_args()
            args.func(args)

    except (argparse.ArgumentTypeError, argparse.ArgumentError) as exc:
        if os.getenv("KUBECFG_DEBUG", "false") == "true":
            raise
        else:
            parser.error(exc.message)
