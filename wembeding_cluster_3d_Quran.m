
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
%%
%%% Create 3-D Text Scatter Plot
words = emb.Vocabulary;
V = word2vec(emb,words);
%size(V)
XYZ = tsne(V, ...
    'NumDimensions',3);
%%
% figure
% ts = textscatter3(XYZ,words);
% title("3-D Word Embedding t-SNE Plot")
%%
cidx = kmeans(V,7,'dist','sqeuclidean');%optim
figure
textscatter3(XYZ,words, ...
    'ColorData',categorical(cidx));
title("3-D Word Embedding t-SNE Plot")