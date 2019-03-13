mkdir coqa
mkdir coqa/data
mkdir coqa/bert-large-uncased
mkdir glove


cp bert_vocab_files/bert-large-uncased-vocab.txt coqa/bert-large-uncased
cp conf coqa/conf

# get CoQA dataset
wget -O coqa/data/coqa-dev-v1.0.json https://nlp.stanford.edu/data/coqa/coqa-dev-v1.0.json
wget -O coqa/data/coqa-train-v1.0.json https://nlp.stanford.edu/data/coqa/coqa-train-v1.0.json

# get glove pretrained embedding
wget -O glove.840B.300d.zip http://nlp.stanford.edu/data/glove.840B.300d.zip
unzip  glove.840B.300d.zip -d glove
rm glove.840B.300d.zip
echo "finish downloading glove embedding"

# download bert configuration
wget -O bert-large-uncased.tar.gz https://s3.amazonaws.com/models.huggingface.co/bert/bert-large-uncased.tar.gz
tar -xvf bert-large-uncased.tar.gz --directory coqa/bert-large-uncased/
rm bert-large-uncased.tar.gz
echo "finish downloading BERT file"

# download spacy model
python -m spacy download en
echo "finish downloading spacy model"