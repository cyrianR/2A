#!/usr/bin/bash

#Job name
#SBATCH -J crt4254
# Asking for one node
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -p small
#SBATCH --ntasks-per-node=1
# Output results message
#SBATCH -o chol%j.out
# Output error message
#SBATCH -e chol%j.err
#SBATCH -t 0:05:00
##SBATCH --exclusive

module purge
source ${HOME}/crt4254/TP/env_cpuonly.sh

cd ${SLURM_SUBMIT_DIR}

# export OMP_NUM_THREADS=80

./bench_strong 200 60

./bench_weak 200 20
