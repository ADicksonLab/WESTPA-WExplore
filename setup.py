from setuptools import setup, find_packages
from Cython.Build import cythonize

import numpy as np

setup(
    name='westpa_wexplore',
    version='0.1',
    py_modules=['wexplore.wexplore'],
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'numpy'
    ],
    include_dirs=[np.get_include()],
    ext_modules = cythonize("wexplore/wex_utils.pyx","examples/RingPotential/modelsim.pyx")
)
