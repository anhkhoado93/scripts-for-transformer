### Requirement
- OpenNMT-py
- fairseq

### Dataset
- create a **data** folder to contain dataset.
- Data must be separated to train/dev, source and target files:
    - train_src.txt
    - train_trg.txt
    - dev_src.txt
    - dev_trg.txt
- Data must be preprocessed (lowercase, etc).
### Training
- create 3 folders: bin, checkpoints, logs
- if subword is used to train the transformer, then training a BPE is required. Use tokenizers/train_bpe.sh. NOTE: specifying size of dictionary directly in the shell script.
