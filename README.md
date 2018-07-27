# WESTPA-WExplore Plugin
A plugin to run the [WExplore](https://pubs.acs.org/doi/abs/10.1021/jp411479c) algorithm in the [WESTPA](http://chong.chem.pitt.edu/WESTPA) toolkit.

# Installation
To install the WExplore module for WESTPA on your machine, clone the git repository:

```
git clone https://github.com/ADicksonLab/WESTPA-WExplore.git
```

change to the newly created WESTPA-WExplore directory:

```
cd WESTPA-WExplore/
```

and run `setup.py`:

```
python setup.py install
```

If you want to run the RingPotential example, this requires an additional step:
```
cd examples/RingPotential
python setup.py build_ext --inplace
```

Also, to allow WESTPA to find this plugin, add the `westpa_wexplore` directory to the `$WEST_PYTHONPATH` variable in the `env.sh` script:

```
export WEST_PYTHONPATH=[your-WESTPA-WExplore-path]/westpa_wexplore
```

# Dependencies

WESTPA should already be installed on your system, see [this page](https://westpa.github.io/westpa/sphinx_index.html#installation) for installation instructions.

# Contributors
This work was done almost entirely by Josh Adelman (@synapticarbors) and Audrey Pratt (@ajoshpratt).
