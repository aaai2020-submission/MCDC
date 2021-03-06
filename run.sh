BASEDIR="";
MODEL_REMAINDER="EPOCHS400_BATCHSIZE512";


declare -A MODELS;
MODELS["BASELINE"]="baseline";
MODELS["MCDC"]="mcdc";
MODELS["ACAI"]="acai";
MODELS["IDEC_BASE"]="idec_base";
MODELS["VAE_BASE"]="vae_base";
MODELS["IDEC_MCDC"]="idec_mcdc";
MODELS["VAE_MCDC"]="vae_mcdc";

DATASET="CIFAR";
dataset="cifar";

# Run specified model
python setup.py install;

for model in "${!MODELS[@]}"; do
    for i in 1 2 3 4 5; do
        echo ${BASEDIR}/configs/$DATASET/${DATASET}_"${model}"_"${MODEL_REMAINDER}"_SEED$i.yaml
        python ${BASEDIR}/mcdc/models/"${MODELS[$model]}".py -c ${BASEDIR}/configs/$DATASET/${DATASET}_"${model}"_"${MODEL_REMAINDER}"_SEED$i.yaml > ${BASEDIR}/RESULTS/${dataset}/${DATASET}_"${model}"$
    done
done
