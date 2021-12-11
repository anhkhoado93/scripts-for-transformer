echo "hom nay em an cowm trưa ?" \
| python tokenizers/word_tokenizer.py \
| python OpenNMT-py/tools/apply_bpe.py -c tokenizers/subword_dict/src.code \
| fairseq-interactive bin \
    --path checkpoints/checkpoint_best.pt \
    --source-lang fr --target-lang en 