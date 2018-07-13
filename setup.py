from setuptools import setup, find_packages
from Cython.Build import cythonize

import numpy as np

setup(
    name='westpa_wexplore',
    version='0.1',
    packages=['westpa_wexplore'],
    install_requires=[
        'numpy'
    ],
    include_dirs=[np.get_include()],
    ext_modules = cythonize("westpa_wexplore/wex_utils.pyx","examples/RingPotential/modelsim.pyx")
)
