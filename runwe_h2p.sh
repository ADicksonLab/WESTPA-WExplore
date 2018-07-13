#!/bin/bash
#SBATCH --nodes=20
##SBATCH --ntasks-per-node=20
##SBATCH --ntasks-per-core=1
#SBATCH --cpus-per-task=20
#SBATCH --time=12:00:00
#SBATCH --job-name=K02
#SBATCH --output=many-serial-jobs.out
#SBATCH --cluster=mpi
#SBATCH --qos=normal

# --partition=haswell
set -x
cd $SLURM_SUBMIT_DIR
source env.sh || exit 1

cd $WEST_SIM_ROOT
SERVER_INFO=$WEST_SIM_ROOT/west_zmq_info-$WEST_JOBID.json

# start server
$WEST_ROOT/bin/w_run --work-manager=zmq --n-workers=0 --zmq-mode=master --zmq-write-host-info=$SERVER_INFO --zmq-comm-mode=tcp &> west-$WEST_JOBID.log &

# wait on host info file up to one minute
for ((n=0; n<120; n++)); do
    if [ -e $SERVER_INFO ] ; then
        echo "== server info file $SERVER_INFO =="
        cat $SERVER_INFO
        break
    fi
    sleep 1
done

# exit if host info file doesn't appear in one minute
if ! [ -e $SERVER_INFO ] ; then
    echo 'server failed to start'
    exit 1
fi

# Unlimited stack size
ulimit -s unlimited

# Make sure the scratch space exists.
srun -n $SLURM_NNODES mkdir -p $LOCAL

# Launch srun many times
for i in {0..19}; do
    srun --exclusive -N1 -n1 $WEST_SIM_ROOT/node.sh --work-manager=zmq --zmq-mode=client --n-workers=28 --zmq-read-host-info=$SERVER_INFO --zmq-comm-mode=tcp &
done
wait
