close all
clear all
rng('default')
filename = 'quran-simple.txt';
str = extractFileText(filename,'Encoding', 'UTF-8');
%%
textData = split(str,newline);
documents = preprocessQuranText(textData);
%%
%  emb = trainWordEmbedding(documents);%,'Model','cbow','NGramRange',[0 0]
%%
emb = trainWordEmbedding(documents, ...
    'Dimension',50, ...
    'MinCount',3, ...
    'NumEpochs',10);
%%
words = emb.Vocabulary;
% V = word2vec(emb,words);
% %size(V)
% %%
% 
% %%
% cidx = kmeans(V,300,'Distance','cityblock');%optim 'dist','sqeuclidean'
% Cluster = cidx;
% Word = words';
% T=table(Cluster, Word);
% writetable(T,'cluster.xlsx')
M = word2vec(emb,words);
%%
k=3;
[words] = vec2word(emb,M,k,'Distance','euclidean');
T=table(words');
writetable(T,'wemb.xlsx')