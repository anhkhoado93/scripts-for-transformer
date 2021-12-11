cat data/train_src.txt | python tokenizers/char_tokenizer.py > data/train.tok.fr
cat data/train_trg.txt | python tokenizers/char_tokenizer.py > data/train.tok.en
cat data/dev_src.txt | python tokenizers/char_tokenizer.py > data/dev.tok.fr
cat data/dev_trg.txt | python tokenizers/char_tokenizer.py > data/dev.tok.en

fairseq-preprocess --source-lang fr --target-lang en \
    --trainpref data/train.tok \
    --validpref data/dev.tok \
    --destdir bin

fairseq-train \
    bin \
    --arch transformer \
    --encoder-layers 3 \
    --decoder-layers 3 \
    --encoder-embed-dim 512 \
    --decoder-embed-dim 512 \
    --encoder-ffn-embed-dim 2048 \
    --decoder-ffn-embed-dim 2048 \
    --encoder-attention-heads 8 --decoder-attention-heads 8 \
    --share-decoder-input-output-embed \
    --optimizer adam \
    --adam-betas '(0.9, 0.997)' \
    --adam-eps 1e-09 --clip-norm 25.0 \
    --lr 1e-4 --lr-scheduler inverse_sqrt \
    --warmup-updates 16000 \
    --dropout 0.1 --attention-dropout 0.1 \
    --activation-dropout 0.1 \
    --weight-decay 0.00025 \
    --criterion label_smoothed_cross_entropy \
    --label-smoothing 0.2 \
    --max-tokens 2048 \
    --batch-size 128 \
    --save-dir checkpoints/ \
    --log-format json --log-interval 10 \
    --max-epoch 40 \
    --skip-invalid-size-inputs-valid-test \
    | tee logs/logging.log