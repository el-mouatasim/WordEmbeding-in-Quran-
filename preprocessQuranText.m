function [documents] = preprocessQuranText(textData)
% Erase punctuation.
cleanTextData = erasePunctuation(textData);

% Convert the text data to lowercase.
cleanTextData = lower(cleanTextData);

% Tokenize the text.
documents = tokenizedDocument(cleanTextData);

% Normalize the words using the lemma.
T = readtable('word_lemma_Quran.xlsx','TextType','string');
S1=T.word;
S2=T.lemma;
documents=replace(documents,S1,S2);
%%remove stop word
filename = 'stopword.txt';
stw = extractFileText(filename,'Encoding', 'UTF-8');
T = wordCloudCounts(stw);
% Remove a list of stop words.
documents = removeWords(documents,T.Word);
end