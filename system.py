from __future__ import division, print_function; __metaclass__ = type
import os, sys, math, itertools
import numpy
import numpy as np
import west
from west import WESTSystem
from westpa.binning import RectilinearBinMapper, RecursiveBinMapper, FuncBinMapper
import westpa

from wexplore import wexplore, wex_utils
from scipy.spatial.distance import cdist

import logging
log = logging.getLogger(__name__)
log.debug('loading module %r' % __name__)

def dfunc(p, centers):
    ncenters = centers.shape[0]
    #d = np.empty((ncenters,), dtype=np.float32)

    d = np.array([np.linalg.norm((p - c)) for c in centers], dtype=np.float32)
    #for k in xrange(ncenters):
        #d[k] = np.sqrt((p[0] - centers[k,0])**2 + (p[1] - centers[k,1])**2)

    return d

class System(WESTSystem):
    def initialize(self):
        # The number of dimensions should be the number of atoms that we have multipled by 3.
        self.pcoord_ndim = 43*3
        self.pcoord_len = 11
        self.pcoord_dtype = numpy.float32
        ## OLD SYSTEM
        #self.dist_binbounds = [0.0,0.2,0.7,1.5,2.2,2.5,3.8,5.0,6.0,7.0,8.0,9.0,10.0,11.6,12.0,13,14,15,16,17,18,19,20,21,22,23,24,float('inf')]

        #self.color_binbounds = [-0.5,0.5,1.5,float('inf')]
        #self.unknown_state = 2
        #self.bin_mapper = RectilinearBinMapper([self.dist_binbounds, self.color_binbounds])
        #self.bin_target_counts = numpy.empty((self.bin_mapper.nbins,), numpy.int)
        #self.bin_target_counts[...] = 50
        self.bin_mapper = wexplore.WExploreBinMapper(n_regions=[4,6,18], d_cut=[1.0, 0.5, 0.1], dfunc=dfunc)
        # The initial center is on the coordinates of one of the basis states.
        init_struct = np.loadtxt('18-crown-6-K+.pdb', dtype=str)
        atom_coords = init_struct[:,5:8]
        atom_coords = atom_coords.astype(float).flatten()
        self.bin_mapper.centers = [atom_coords]
        self.bin_mapper.add_bin(None, 0)
        self.max_replicas = 20
        self.bin_target_counts = self.bin_mapper.balance_replicas(self.max_replicas,
                                np.array([0,], np.int_))


def pcoord_loader(fieldname, pcoord_return_filename, destobj, single_point):
    """Read progress coordinate data into the ``pcoord`` field on ``destobj``. 
    An exception will be raised if the data is malformed.  If ``single_point`` is true,
    then only one (N-dimensional) point will be read, otherwise system.pcoord_len points
    will be read.
    """
    
    system = westpa.rc.get_system_driver()
    
    assert fieldname == 'pcoord'
    
    #pcoord = numpy.loadtxt(pcoord_return_filename, dtype=system.pcoord_dtype)
    init_struct = np.loadtxt(pcoord_return_filename, dtype=str)
    # We're pulling in columns 5, 6, and 7 because this is where the X,Y,Z coords are in the pdb.
    atom_coords = init_struct[:,5:8]
    pcoord = atom_coords.astype(float).flatten()
    
    if single_point:
        expected_shape = (system.pcoord_ndim,)
        if pcoord.ndim == 0:
            pcoord.shape = (1,)
    else:
        # We want to reshape the progress coordinate so that each row is a frame,
        # and each dimension is the number of atoms * 3.
        pcoord.shape = (11, 43*3)
        expected_shape = (system.pcoord_len, system.pcoord_ndim)
        if pcoord.ndim == 1:
            pcoord.shape = (len(pcoord),1)
    if pcoord.shape != expected_shape:
        raise ValueError('progress coordinate data has incorrect shape {!r} [expected {!r}]'.format(pcoord.shape,
                                                                                                    expected_shape))
    destobj.pcoord = pcoord
    

