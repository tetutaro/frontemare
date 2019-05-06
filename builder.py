#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import colorsys
import glob
import os.path
import pystache
import yaml


class FrontemareBuilder(object):
    """builder for frontemare"""

    def __init__(self):
        with open('sources.yaml', 'r') as rf:
            self.sources_ = yaml.load(rf.read(), Loader=yaml.SafeLoader)
        self.schemes_ = self._read_schemes()
        self.templates_ = self._read_templates()
        return

    def _check_scheme(self, given, fname):
        scheme = dict()
        assert(given.get('scheme'))
        scheme['scheme-name'] = given.get('scheme')
        assert(given.get('author'))
        scheme['scheme-author'] = given.get('author')
        scheme['scheme-slug'] = os.path.splitext(os.path.basename(
            fname
        ))[0].replace(' ', '-')
        for c in [format(i, '02X') for i in range(16)]:
            assert(given.get('base%s' % c))
            chex = given.get('base%s' % c).lower()
            scheme['base%s-hex' % c] = chex
            assert(len(chex) == 6)
            rgb = dict()
            for j, t in enumerate('rgb'):
                thex = chex[j * 2: (j + 1) * 2]
                scheme['base%s-hex-%s' % (c, t)] = thex
                scheme[
                    'base%s-hex-%s-pad' % (c, t)
                ] = thex.rjust(3)
                trgb = int(thex, 16)
                scheme['base%s-rgb-%s' % (c, t)] = str(trgb)
                scheme[
                    'base%s-rgb-%s-pad' % (c, t)
                ] = str(trgb).rjust(3)
                tdec = float(trgb) / 255.0
                rgb[t] = tdec
                scheme['base%s-dec-%s' % (c, t)] = str(tdec)
                scheme[
                    'base%s-dec-%s-pad' % (c, t)
                ] = str(round(tdec, 4)).ljust(6)
            hsv = colorsys.rgb_to_hsv(rgb['r'], rgb['g'], rgb['b'])
            for j, t in enumerate('hsv'):
                if j == 0:
                    tmax = 360
                else:
                    tmax = 100
                thsv = int(round(hsv[j] * tmax))
                scheme['base%s-hsv-%s' % (c, t)] = str(thsv)
                scheme[
                    'base%s-hsv-%s-pad' % (c, t)
                ] = str(thsv).rjust(3)
        return scheme

    def _read_schemes(self):
        schemes = list()
        for name in self.sources_.get('schemes'):
            for slug_yaml in glob.glob(
                'schemes/%s/*.yaml' % name
            ):
                assert(os.path.isfile(slug_yaml))
                with open(slug_yaml, 'r') as rf:
                    scheme = yaml.load(rf, Loader=yaml.SafeLoader)
                schemes.append(
                    self._check_scheme(scheme, slug_yaml)
                )
        return schemes

    def _check_template(self, options, name, pattern, mustache):
        assert(options.get('extension'))
        assert(options.get('output'))
        options['application'] = name
        options['pattern'] = pattern
        options['mustache'] = mustache
        return options

    def _read_templates(self):
        templates = list()
        for name in self.sources_.get('applications'):
            config_yaml = '/'.join([
                'applications', name, 'templates', 'config.yaml'
            ])
            assert(os.path.isfile(config_yaml))
            with open(config_yaml, 'r') as cf:
                config = yaml.load(cf, Loader=yaml.SafeLoader)
            for pattern, options in config.items():
                template_mustache = '/'.join([
                    'applications', name, 'templates', pattern + '.mustache'
                ])
                assert(os.path.isfile(template_mustache))
                with open(template_mustache, 'r') as rf:
                    mustache = rf.read()
                templates.append(
                    self._check_template(options, name, pattern, mustache)
                )
        return templates

    def build(self):
        for t in self.templates_:
            for s in self.schemes_:
                buffer_name = '/'.join([
                    'applications',
                    t['application'],
                    t['output'],
                    s['scheme-slug'] + t['extension']
                ])
                dname = os.path.dirname(buffer_name)
                if not os.path.isdir(dname):
                    os.makedirs(dname)
                filled = pystache.render(
                    t['mustache'], s
                )
                with open(buffer_name, 'w') as wf:
                    wf.write(filled)
        return


if __name__ == "__main__":
    builder = FrontemareBuilder()
    builder.build()
