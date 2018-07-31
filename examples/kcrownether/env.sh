# This file defines where WEST and GROMACS can be found
# Modify to taste

# BEGIN H2P-specific details -------------------------
    # Load the modules!
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
# END H2P-specific details

export WEST_PYTHONPATH="$HOME/WESTPA-WExplore/westpa_wexplore"
export WM_ZMQ_MASTER_HEARTBEAT=100
export WM_ZMQ_WORKER_HEARTBEAT=100
export WM_ZMQ_TIMEOUT_FACTOR=100
export GMX=$(which gmx)

# Files for running the system inside of GROMACS.

export TOP=18-crown-6-K+.top
export NDX=18-crown-6-K+.ndx
export REF=bound_state.tpr
