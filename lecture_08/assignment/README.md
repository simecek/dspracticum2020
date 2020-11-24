# Assignment

**Due to**: Nov 20, 2020 (10am)

The goal of this assignment is to train a neural network to classify genomic sequences and beat a simple LSTM/CNN benchmark (see the table below). Each folder is one dataset (you can select one dataset or try your method on all of them). Data are stored in [FASTA format](https://en.wikipedia.org/wiki/FASTA_format), look into [SimpleGenomicNN.ipynb](SimpleGenomicNN.ipynb) notebook how to read them. Each file is one class of sequences (+ either train or validation data).

## Datasets

### E. Coli Promoters

Classifying of E. Coli promoter sequences from random sections of the genome. Originally created by [Karl Heyer](https://github.com/kheyer/Genomic-ULMFiT), preprocessed by [Katarina Gresova](https://github.com/katarinagresova/benchmarks).

### G-quadruplexes 

In molecular biology, G-quadruplex secondary structures are formed in nucleic acids by sequences that are rich in guanine. They are helical in shape and contain guanine tetrads that can form from one, two or four strands. (Wikipedia)

Data are coming from [Eva Klimentova's recent paper](https://www.frontiersin.org/articles/10.3389/fgene.2020.568546/full?&utm_source=Email_to_authors_&utm_medium=Email&utm_content=T1_11.5e1_author&utm_campaign=Email_publication&field=&journalName=Frontiers_in_Genetics&id=568546).

### Ensemble gene type (yet under construction)

[Ensembl](https://www.ensembl.org/index.html) is a genome browser and database. I have downloaded sequences of all human genes in this database and their (bio)type (protein, coding gene, psudogene, long noncoding rna, etc.). The goal is to guess the gene type from its sequence.

### Benchmark loss and accuracy

|           | Train loss | Train accuracy | Validation loss | Validation accuracy |
|-----------|------------|----------------|-----------------|---------------------|
| Promoters |     0.2054 |         0.9290 |          0.2764 |              0.9013 |
| G4        |     0.1616 |         0.9462 |          0.1296 |              0.9494 |
| Gene type |            |                |                 |                     |

## Some ideas to try

* Instead of one base per word/token, try K-mers
* Instead of one-hot encoding, try embeddings
* Experiment with the network architecture (combine CNN, Bi-LSTM, GRU), experiment with the optimizer & learning rate
* Experiment with regularization, dropout, batch normalization layers
