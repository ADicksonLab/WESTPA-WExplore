# This file defines where WEST and GROMACS can be found
# Modify to taste

# H2P
# The actual WESTPA session is probably going to be run here, so.
    # Load the modules!
    echo "Running on H2P"
    echo $HOSTNAME
    #export GROMACS_ROOT='/ihome/lchong/ajp105/apps/gromacs-4.6.3-gcc-sse4.1/'
    #export WEST_ROOT='/ihome/lchong/ajp105/apps/westpa/westpa'
    #export WEST_BIN='/ihome/lchong/ajp105/apps/westpa/westpa'
    #export ANACONDA_ROOT='/ihome/lchong/ajp105/apps/anaconda/'
    #export PATH="$PWD:$ANACONDA_ROOT/bin:$WEST_ROOT/bin/:$GROMACS_ROOT/bin/:$PATH"
    #export LD_LIBRARY_PATH="$ANACONDA_ROOT/lib:$GROMACS_ROOT/bin:$LD_LIBRARY_PATH"
    #source /opt/sam/modulefiles/intel/.set-2013.tcl

    export USE_LOCAL_SCRATCH=1
    export SCRATCH=/dev/shm/$SLURM_JOBID
    export SWROOT=""
    export WEST_JOBID=$SLURM_JOBID
    module load gcc/5.4.0 openmpi/2.0.2 gromacs/2018.1
    module load python/anaconda2.7-4.2.0
    source activate WESTPA-WExplore
    source $CONDA_PREFIX/westpa-2017.10/westpa.sh
    export GROMACS_ROOT='/ihome/lchong/ajp105/apps/gromacs-4.6.3-gcc-sse4.1/'
    export PATH="$GROMACS_ROOT/bin/:$PATH"
    export USE_LOCAL_SCRATCH=1
    export WEST_SIM_ROOT="$PWD"
    # We need to use the SLURM directory if the job is actually running.
    # Otherwise, just use the current working directory (init, etc).
    case $HOSTNAME in 
        login[1-4]*.crc.pitt.edu )
            export WEST_SIM_ROOT="$PWD"
        ;;       
        ib[0-9]*-[0-9]* )
            export WEST_SIM_ROOT="$SLURM_SUBMIT_DIR"
        ;;
    esac
	# Everything else.
	# Put in stuff here that you'd want to use on your local machine,
	# for instance.
	# We're assuming that we have GROMACS installed and in our path, here.
#	module load anaconda
    #module load gcc/5.4.0 openmpi/2.0.2 gromacs/2018.1
    #module load python/anaconda2.7-4.2.0
	#source activate WESTPA-WExplore
	#source $CONDA_PREFIX/westpa-2017.10/westpa.sh
    #export GROMACS_ROOT='/ihome/lchong/ajp105/apps/gromacs-4.6.3-gcc-sse4.1/'
    #export PATH="$GROMACS_ROOT/bin/:$PATH"
	#export USE_LOCAL_SCRATCH=1
    #export WEST_SIM_ROOT="$PWD"

# General stuff now

export WM_ZMQ_MASTER_HEARTBEAT=100
export WM_ZMQ_WORKER_HEARTBEAT=100
export WM_ZMQ_TIMEOUT_FACTOR=100
# Are we assuming SLURM?

#export WEST_ZMQ_DIRECTORY=server_files
#export WEST_LOG_DIRECTORY=job_logs
#export MDRUN=$GROMACS_ROOT/bin/mdrun
#export GROMPP=$GROMACS_ROOT/bin/grompp
#export GDIST=$GROMACS_ROOT/bin/g_dist
#export GRMS=$GROMACS_ROOT/bin/g_rms
#export TRJCONV=$GROMACS_ROOT/bin/trjconv
#export GMINDIST=$GROMACS_ROOT/bin/g_mindist
#export GRAMA=$GROMACS_ROOT/bin/g_rama
export GMX=$(which gmx)

# Files for running the system inside of GROMACS.

export TOP=18-crown-6-K+.top
export NDX=18-crown-6-K+.ndx
export REF=bound_state.tpr
