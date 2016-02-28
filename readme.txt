The aim if this technical test is to produce a simple AngularJS app consisting of 2 parts.

************************************ PART 1 ************************************************
The first part of the app will provide the following functionality:
1) Ingest 'words.txt' which contains an export of a Unix systems english dictionary; 
2) Store the contents in memory, which we can call the 'dictionary', for fast lookup.
3) Implement a simple interface with a method to performs a look-up of entries within the 'WordDictionary'. The call only needs to send a confirmation that the entry exists e.g:

	-(BOOL) contains : (NSString*) word;


************************************ PART 2 ************************************************
The second part of the app involves the development of on an anagram game similar to the TV series Countdown.

The game is constructed with a base set of letters, e.g. the string "areallylongword", which may be assumed to be all in lowercase, and with no whitespace or special characters. Users then attempt to create words out of the letters. The submissions must be "real words": i.e use the 'Dictionary' lookup API to check each submission.

The flow of the game is as follows:
1) User is presented with a View Controller showing anagram "areallylongword", a text entry field and a submit button.
2) the user enters potential words that could be contained within the anagram into the text field.
3) On hitting submit the app will check for the word's presence in the anagram.
	- The app will need to read the entry, and then perform a lookup within the 'WordDictionary'.
	- If the entry isn't a valid word (i.e not in the 'WordDictionary') then the user is notified.
	- if the entry is valid then the app needs to check that the word exists within the anagram.

For example, using the series of characters 'areallylongword' as the anagram, if the user enters the following words:
 * "no" is an acceptable submission
 * "grow" is an acceptable submission
 * "bold" is not an acceptable submission - not present anywhere in the anagram
 * "glly" is not an acceptable submission - not a valid english word (i.e not in the 'dictionary')
 * "woolly" is an acceptable submission
 * "adder" is not an acceptable submission

************************************ NOTES ************************************************

It would be best to include simple comments within your code so that we can be looking for:
1) indications of your thought process for loading and storing words.txt and anagrams.txt in memory:
	- Data structures used
	- sorting methods used, if any?
	- search techniques through the data structures.
2) indications of your thought process for the algorithm used to process the entered word and compare against the anagram for matches.

Bonus points are given for:
1) Unit tests around any public methods on factories 
2) Your own implementation of searching and sorting techniques for operating on both the 'dictionary' and the anagram comparison.
3) A clean simple UI.




