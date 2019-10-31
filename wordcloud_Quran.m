close all
clear all
rng('default');
filename = 'quran-simple.txt';
str = extractFileText(filename,'Encoding', 'UTF-8');
%%
textData = split(str,newline);
documents = preprocessQuranText(textData);
%%
 bag = bagOfWords(documents);
 T=topkwords(bag,7)
%
figure
wordcloud(bag);
%%with colors
 NumWords =bag.NumWords;
 tbl=topkwords(bag,NumWords);
%%
numWordsw = size(tbl,1);
colors = rand(numWordsw,3);
figure
wordcloud(bag,'Color',colors);
title("Quranic Word Cloud by Dr. Abdelkrim El Mouatasim")
