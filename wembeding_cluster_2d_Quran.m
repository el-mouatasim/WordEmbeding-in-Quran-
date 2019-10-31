close all
clear all
rng('default')
filename = 'quran-simple.txt';
str = extractFileText(filename,'Encoding', 'UTF-8');
%%
textData = split(str,newline);
documents = preprocessQuranText(textData);
%%
%  emb = trainWordEmbedding(documents,'Model','cbow','NGramRange',[0 0]);
%%
emb = trainWordEmbedding(documents, ...
    'Dimension',50, ...
    'MinCount',3, ...
    'NumEpochs',10);
words = emb.Vocabulary;
V = word2vec(emb, words);
XY = tsne(V);
textscatter(XY,words)
cidx = kmeans(V,7,'dist','sqeuclidean');
figure
textscatter(XY,words, ...
    'ColorData',categorical(cidx));
title("Word Embedding t-SNE Plot")