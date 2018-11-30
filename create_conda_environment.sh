#! /bin/bash -l

# Assume that we're using Anaconda.  The reason why we're doing this is what we need a pre-2.0 NetworkX

# Edit this to load up the proper anaconda version that you're using.  Remember that WESTPA needs python2, right now.
module load python/anaconda2.7-4.2.0

# Destroy the environment, if it exists
conda env remove -n WESTPA-WExplore

# Now, create it.
conda create --name WESTPA-WExplore

# Now, install the packages that we need for this, including WESTPA.
conda install -c conda-forge westpa -n WESTPA-WExplore
conda install -c anaconda pandas cython -n WESTPA-WExplore
conda install -c BjornFJohansson networkx=1.9.1 -n WESTPA-WExplore

# Activate the conda environment we just created
source activate WESTPA-WExplore

# Build cython extensions
cd westpa_wexplore
python setup.py build
python setup.py install --user
