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
%%
numTopics = 8;
mdl = fitlda(bag,numTopics);
 figure;
for topicIdx = 1:4
    subplot(2,2,topicIdx)
    wordcloud(mdl,topicIdx);
    title("Topic: " + topicIdx)
end
figure;
for topicIdx = 5:numTopics
    subplot(2,2,topicIdx-4)
    wordcloud(mdl,topicIdx);
    title("Topic: " + topicIdx)
end
%%
figure
topicMixtures = transform(mdl,documents(1:10));
barh(topicMixtures(1:10,:),'stacked')
xlim([0 1])
title("Topic Mixtures")
xlabel("Topic Probability")
ylabel("Document")