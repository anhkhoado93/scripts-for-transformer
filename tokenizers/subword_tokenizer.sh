python OpenNMT-py/tools/apply_bpe.py -c data/src.code -i train_src.txt -o data/train.tok.fr
python OpenNMT-py/tools/apply_bpe.py -c data/trg.code -i train_trg.txt -o data/train.tok.en
python OpenNMT-py/tools/apply_bpe.py -c data/src.code -i dev_src.txt -o data/dev.tok.fr
python OpenNMT-py/tools/apply_bpe.py -c data/trg.code -i dev_trg.txt -o data/dev.tok.en
