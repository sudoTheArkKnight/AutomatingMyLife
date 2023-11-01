$envName = Read-Host "Enter the name of the virtual environment"
conda create -y -n $envName python=3.8
conda activate $envName
conda install -y jupyter seaborn pandas numpy scikit-learn
conda deactivate
