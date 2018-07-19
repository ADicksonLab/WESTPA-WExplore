#! /bin/bash -l

# Assume that we're using Anaconda.  The reason why we're doing this is what we need a pre-2.0 NetworkX

# Edit this to load up the proper anaconda version that you're using.  Remember that WESTPA needs python2, right now.
#module load anaconda
#module load python/anaconda2.7-4.2.0_westpa
module load python/anaconda2.7-4.2.0

# Destroy the environment, if it exists
conda env remove -n WESTPA-WExplore

# Now, create it.
conda create --name WESTPA-WExplore

# Now, install the packages that we need for this, including WESTPA.
conda install -c conda-forge westpa -n WESTPA-WExplore
conda install -c BjornFJohansson networkx=1.9.1 -n WESTPA-WExplore
conda install -c anaconda pandas -n WESTPA-WExplore
conda install -c anaconda cython -n WESTPA-WExplore

# Create symlinks that we need to ensure everything imports/starts.
# You'll probably need to run python setup.py within this directory, as well.
#ln -sv wexplore-westpa.josh/wexplore wexplore
source activate WESTPA-WExplore
cd westpa_wexplore
#python setup.py install
python setup.py build
#ln -sv lib/python2.7/site-packages/wex_utils.so .
