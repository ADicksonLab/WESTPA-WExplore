#!/bin/bash

if [ -n "$SEG_DEBUG" ] ; then
    set -x
    env | sort
fi

cd $WEST_SIM_ROOT

function cleanup() {
    rm -f pcoord.$$.pdb
}

trap cleanup EXIT

# Get progress coordinate
#rm mdout.mdp
#rm $WEST_STRUCT_DATA_REF.tpr
#rm \#*
#gmx grompp -f md.mdp -c $WEST_STRUCT_DATA_REF.gro -o $WEST_STRUCT_DATA_REF.tpr -p $TOP -t $WEST_STRUCT_DATA_REF.trr -n $NDX -maxwarn 2
#rm mdout.mdp
#echo "1 2" | g_dist -f $WEST_STRUCT_DATA_REF.gro -s $WEST_STRUCT_DATA_REF.tpr -n $NDX -o $OUT -xvg none || exit 1
#echo "1 5" | g_rms -s $REF -f $WEST_STRUCT_DATA_REF.gro -n $NDX -xvg none -o $OUT2 || exit 1
#awk '{print $2*10;}' < $OUT > $WEST_PCOORD_RETURN || exit 

echo $NDX
echo -e "4 \n" | gmx trjconv -f $WEST_STRUCT_DATA_REF.gro  -s $WEST_STRUCT_DATA_REF.tpr -n $NDX -o pcoord.$$.pdb || exit 1
cat pcoord.$$.pdb | grep '^ATOM' | grep K\+ > $WEST_PCOORD_RETURN

if [ -n "$SEG_DEBUG" ] ; then
    head -v $WEST_PCOORD_RETURN
fi


