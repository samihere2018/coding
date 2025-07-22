#!/bin/bash
#SBATCH -A reynolds_scidac_fes_0001
#SBATCH -J lect2_dotProd             
#SBATCH -p dev                        
#SBATCH --mem=2G                      
#SBATCH -o lect2_dotProd-%j.txt             
#SBATCH -e lect2_dotProd-%j.txt             
#SBATCH -t 2
#SBATCH --mail-user samihere@smu.edu 
#SBATCH --mail-type BEGIN,END,FAIL

g++ -o lect2_dotProd dotProd_lect2.cpp
srun ./lect2_dotProd 10

