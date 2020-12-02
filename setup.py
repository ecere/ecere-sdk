# -*- coding: utf-8 -*-

"""The setuptools based Ecere SDK setup module."""
import os
from os import path

dir = path.dirname(__file__)
if dir == '':
   rwd = path.abspath('.')
else:
   rwd = path.abspath(dir)

print('----------------------------------------------------------------------------')
print('__file__:', __file__)
print('dir:', dir)
print('rwd:', rwd)
#os.chdir(rwd)
#rwd = os.getcwd()
#os.chdir(path.join('bindings', 'py'))
pwd = path.join(rwd, 'bindings', 'py')

from setuptools import Command
from setuptools import find_packages
from setuptools import setup
from setuptools.command.install import install
from codecs import open
import subprocess
import sys
#import bindings.py.build_eC
import distutils.command.build

#sys.path.insert(0, dir)
#dddd = path.join(here, 'bindings', 'py')
#sys.path.append(path.dirname(__file__))
#sys.path.append(pwd)

#version_from_git = subprocess.check_output(['git', 'describe', '--tags', '--abbrev=0']).rstrip().decode('u8')
version_from_git = '0.44.15'

with open(path.join(rwd, 'README.md'), encoding='u8') as f:
   long_description = f.read()

from subprocess import call

def buildEcereSDK():
   print('buildEcereSDK')
   call(['echo', 'buildEcereSDK'], shell=True)
   proc = subprocess.Popen(['make', 'ECERE_AUDIO=y', '-j4'], shell=False)
   proc.communicate()
   call(['dir', path.join('obj', 'win32', 'bin')], shell=True)
   return proc.returncode == 0

def buildPrepInstall():
   print('buildPrepInstall')
   call(['echo', 'buildPrepInstall'], shell=True)
   proc = subprocess.Popen(['make', 'py_prepinstall'], shell=False)
   proc.communicate()
   call(['dir', path.join('obj', 'win32', 'bin')], shell=True)
   return proc.returncode == 0

def buildBindingsC():
   print('buildBindingsC')
   call(['echo', 'buildBindingsC'], shell=True)
   proc = subprocess.Popen(['make', 'c_bindings'], shell=False)
   proc.communicate()
   call(['dir', path.join('obj', 'win32', 'bin')], shell=True)
   return proc.returncode == 0

def buildBindingsGenPy():
   print('buildBindingsGenPy')
   call(['echo', 'buildBindingsGenPy'], shell=True)
   proc = subprocess.Popen(['make', 'py_bindings_gen'], shell=False)
   proc.communicate()
   return proc.returncode == 0

def buildAll():
   print('buildAll')
   call(['echo', 'buildAll'], shell=True)
   if buildEcereSDK():
      if buildPrepInstall():
         if buildBindingsC():
            if buildBindingsGenPy():
               return True
   return False

#class BuildCommand(distutils.command.build.build):
#   """Customized setuptools build command."""
#   def run(self):
      #os.chdir(rwd)
      #proc = subprocess.Popen(['make', 'ECERE_AUDIO=y', '-j8'], shell=False)
      #proc.communicate()
      #if proc.returncode == 0:
      #   proc = subprocess.Popen(['make', 'prepinstall'], shell=False)
      #   proc.communicate()
      #   if proc.returncode == 0:
      #      #owd = os.getcwd()
      #      os.chdir(os.path.join(rwd, 'bindings'))
      #      proc = subprocess.Popen(['make', 'py'], shell=False)
      #      proc.communicate()
      #      if proc.returncode == 0:
      #         os.chdir(pwd)
      #         distutils.command.build.build.run(self)
      #      #else: os.chdir(owd)
      #os.chdir(pwd)
      #os.chdir(pwd)
#      distutils.command.build.build.run(self)

#class BuildCommand(Command):
#   user_options = []
#   def initialize_options(self):
#      """Abstract method that is required to be overwritten"""
#   def finalize_options(self):
#      """Abstract method that is required to be overwritten"""
#   def run(self):
#      print(" => bootstrapping development environment ...")
#      proc = subprocess.Popen(['make', '-j8'], shell=False)
#      proc.communicate()

#class BuildPyCommand(setuptools.command.build_py.build_py):
#   """Custom build command."""
#   def run(self):
#      self.run_command('make -j8')
#      setuptools.command.build_py.build_py.run(self)

class CustomInstallCommand(install):
   """Customized setuptools install command."""
   def run(self):
      print('error !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
      proc = subprocess.Popen(['make', 'V=1', 'ECERE_AUDIO=y', '-j4'], shell=False)
      proc.communicate()
      if proc.returncode == 0:
         install.run(self)

#class TestConsole(TestCase):
#   def test_basic(self):
#      main()

print(' -- before setup -- ')
print(__file__)
print('arg zero: ', sys.argv[0])
print('count: ', len(sys.argv))
print('args: ', str(sys.argv))
print('version: ', str(sys.version))

#print(mods)

#print(find_packages(where=pyDir))

#exit()

# ['-c', 'install', '--record', '~/install-record.txt', '--single-version-externally-managed', '--compile']

if 'sdist' in sys.argv or 'build' in sys.argv or 'install' in sys.argv:
   print('buildOk = buildAll()')
   buildOk = buildAll()
else:
   print('buildOk = True')
   buildOk = True

if not buildOk:
   raise Exception('build failed error: not calling setup() -- abort!')
else:
   if sys.platform == 'win32':
      #libdir = path.join('..', '..', 'obj', 'win32', 'bin')
      #bindir = path.join('..', '..', 'obj', 'win32', 'bin')
      libdir = path.join('obj', 'win32', 'py')
      bindir = path.join('obj', 'win32', 'bin')
      libpfx = ''
      libext = '.dll'
      exeext = '.exe'
   elif sys.platform == 'linux' or sys.platform == 'linux2':
      #libdir = path.join('..', '..', 'obj', 'linux', 'lib')
      #bindir = path.join('..', '..', 'obj', 'linux', 'bin')
      libdir = path.join(rwd, 'obj', 'linux', 'py')
      bindir = path.join(rwd, 'obj', 'linux', 'bin')
      libpfx = 'lib'
      libext = '.so'
      exeext = ''
   elif sys.platform == 'darwin':
      libdir = path.join(rwd, 'obj', 'apple', 'py')
      bindir = path.join(rwd, 'obj', 'apple', 'bin')
      libpfx = 'lib'
      libext = '.dylib'
      exeext = ''
   else:
      print('error: unexpected platform')
      print(sys.platform)
      print(os.name)

   #pyDir = path.join(rwd, 'bindings', 'py')
   pyDir = path.join('bindings', 'py')

   from shutil import copyfile
   if sys.argv[0] == 'setup.py':
      if not 'install' in sys.argv:
         #copyfile(path.join(pyDir, 'eC.py'), path.join('EcereSDK', 'eC.py'))
         #copyfile(path.join(pyDir, 'ecere.py'), path.join('EcereSDK', 'ecere.py'))
         #copyfile(path.join(pyDir, 'EDA.py'), path.join('EcereSDK', 'EDA.py'))
         copyfile(path.join(pyDir, 'eC.py'), 'eC.py')
         copyfile(path.join(pyDir, 'ecere.py'), 'ecere.py')
         copyfile(path.join(pyDir, 'EDA.py'), 'EDA.py')

   bld_eC = path.join(pyDir, 'build_eC.py')
   bld_ecere = path.join(pyDir, 'build_ecere.py')
   bld_EDA = path.join(pyDir, 'build_EDA.py')
   mods = [bld_eC + ':ffi_eC', bld_ecere + ':ffi_ecere', bld_EDA + ':ffi_EDA']
   #foundPackages = find_packages()
   #foundPackages = []
   #mod_eC = path.join(pyDir, 'eC')
   #mod_ecere = path.join(pyDir, 'ecere')
   #mod_EDA = path.join(pyDir, 'EDA')

   #print('foundPackages:', foundPackages)

   setup(
      name='EcereSDK',
      version=version_from_git + '.dev17',
      description='The Ecere Software Development Kit (SDK)',
      long_description=long_description,
      long_description_content_type='text/markdown',
      url='https://ecere.org',
      author='Jérôme Jacovella-St-Louis, Ecere Corporation',
      author_email='jerome@ecere.com',
      license='BSD 3-Clause (Revised)',
      classifiers=[
         'Development Status :: 4 - Beta',
         'Environment :: Console',
         #'Environment :: Console :: Curses',
         #'Environment :: Console :: Framebuffer',
         'Environment :: Handhelds/PDA\'s',
         'Environment :: MacOS X',
         'Environment :: No Input/Output (Daemon)',
         'Environment :: Web Environment',
         'Environment :: Win32 (MS Windows)',
         'Environment :: X11 Applications',
         'Intended Audience :: Developers',
         'License :: OSI Approved :: BSD License',
         'Operating System :: Android',
         #'Operating System :: BeOS',
         #'Operating System :: iOS',
         #'Operating System :: MacOS',
         #'Operating System :: MacOS :: MacOS 9',
         'Operating System :: MacOS :: MacOS X',
         #'Operating System :: Microsoft',
         #'Operating System :: Microsoft :: MS-DOS',
         #'Operating System :: Microsoft :: Windows',
         'Operating System :: Microsoft :: Windows :: Windows 10',
         #'Operating System :: Microsoft :: Windows :: Windows 3.1 or Earlier',
         'Operating System :: Microsoft :: Windows :: Windows 7',
         'Operating System :: Microsoft :: Windows :: Windows 8',
         'Operating System :: Microsoft :: Windows :: Windows 8.1',
         #'Operating System :: Microsoft :: Windows :: Windows 95/98/2000',
         #'Operating System :: Microsoft :: Windows :: Windows CE',
         #'Operating System :: Microsoft :: Windows :: Windows NT/2000',
         'Operating System :: Microsoft :: Windows :: Windows Server 2003',
         'Operating System :: Microsoft :: Windows :: Windows Server 2008',
         #'Operating System :: Microsoft :: Windows :: Windows Vista',
         #'Operating System :: Microsoft :: Windows :: Windows XP',
         #'Operating System :: OS/2',
         #'Operating System :: OS Independent',
         #'Operating System :: Other OS',
         #'Operating System :: PalmOS',
         #'Operating System :: PDA Systems',
         #'Operating System :: POSIX',
         #'Operating System :: POSIX :: AIX',
         'Operating System :: POSIX :: BSD',
         #'Operating System :: POSIX :: BSD :: BSD/OS',
         #'Operating System :: POSIX :: BSD :: FreeBSD',
         #'Operating System :: POSIX :: BSD :: NetBSD',
         #'Operating System :: POSIX :: BSD :: OpenBSD',
         #'Operating System :: POSIX :: GNU Hurd',
         #'Operating System :: POSIX :: HP-UX',
         #'Operating System :: POSIX :: IRIX',
         'Operating System :: POSIX :: Linux',
         #'Operating System :: POSIX :: Other',
         #'Operating System :: POSIX :: SCO',
         #'Operating System :: POSIX :: SunOS/Solaris',
         #'Operating System :: Unix',
         'Programming Language :: C',
         #'Programming Language :: eC',
         #'Programming Language :: Python :: 2',
         #'Programming Language :: Python :: 3 :: Only',
         'Programming Language :: Python :: 3',
         'Topic :: Software Development',
         'Topic :: Software Development :: User Interfaces',
      ],
      keywords='cross-platform gui 2D 3D development',
      #packages=['eceresdk'],
      #packages=foundPackages,
      #py_modules = [mod_eC, mod_ecere, mod_EDA],
      #py_modules = ['_pyeC', '_pyecere', '_pyEDA'],
      py_modules = ['eC', 'ecere', 'EDA'],
      #package_dir={'':pyDir},
      package_dir={'':'.'},
      #cmdclass={'install': CustomInstallCommand},
      #cmdclass={
         #'pylint': PylintCommand,
         #'build_py': BuildPyCommand,
         #'build_py': BuildPyCommand,
      #   'build': BuildCommand,
      #},
      # include everything in source control
      #include_package_data=True,
      # ...but exclude README.txt from all packages
      #exclude_package_data={'': ['.gitattributes', '.gitignore', '.mailmap', '.travis.yml', '.appveyor.yml', '*.3ds', '*.3DS', 'samples']},

      #python_requires='>2.7, !=3.0.*, !=3.1.*, !=3.2.*, !=3.3.*',
      python_requires='>=3.4',
      #setup_requires=['setuptools_git >= 0.3', 'cffi >= 1.11.5'], # 1.0.0 1.11.5 1.6.0
      setup_requires=['pip >= 18.0', 'wheel', 'cffi >= 1.0.0', 'setuptools-git >= 1.0'],
      cffi_modules=mods,
      #cffi_modules=[path.join('bindings', 'py', 'build_eC.py:ffi_eC')],
      #cffi_modules=['build_eC.py:ffi_eC', 'build_ecere.py:ffi_ecere'],
      install_requires=['cffi >= 1.0.0'],
      #extras_require={
      #    'dev': ['check-manifest'],
      #    'test': ['coverage'],
      #},
      package_data={
      #    'sample': ['package_data.dat'],
      },
      #data_files=[
      #   ('', [
      #      os.path.join(libdir, libpfx + 'ecereCOM' + libext),
      #      os.path.join(libdir, libpfx + 'ecereCOM_c' + libext),
      #      os.path.join(libdir, libpfx + 'ecere' + libext),
      #      os.path.join(libdir, libpfx + 'ecere_c' + libext),
      #      os.path.join(libdir, libpfx + 'ec' + libext),
      #      os.path.join(libdir, libpfx + 'ec2' + libext),
      #      os.path.join(libdir, libpfx + 'EcereAudio' + libext),
      #      os.path.join(libdir, libpfx + 'EDA' + libext),
      #      os.path.join(libdir, libpfx + 'EDA_c' + libext),
      #      os.path.join(libdir, libpfx + 'EDASQLite' + libext),
      #      #os.path.join(libdir, libpfx + 'EDASQLiteCipher' + libext),
      #     os.path.join(bindir, 'ecp' + exeext),
      #      os.path.join(bindir, 'ecc' + exeext),
      #      os.path.join(bindir, 'ecs' + exeext),
      #      os.path.join(bindir, 'ear' + exeext),
      #      os.path.join(bindir, 'epj2make' + exeext),
      #      os.path.join(bindir, 'bgen' + exeext),
      #      os.path.join(bindir, 'documentor' + exeext),
      #      os.path.join(bindir, 'ecere-ide' + exeext),
      #   ])
      #],
      #entry_points={
      #   'console_scripts': [
      #      #'build_eC=build_eC:compile_eC',
      #      'sample=sample:main',
      #   ],
      #},
   )
