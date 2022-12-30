/*
    Given an array of strings words and an integer k, return the k most frequent strings.
    
    Return the answer sorted by the frequency from highest to lowest. Sort the words with the same frequency by their lexicographical order.
    
    Example 1:
    
    Input: words = ["i","love","leetcode","i","love","coding"], k = 2
    Output: ["i","love"]
    Explanation: "i" and "love" are the two most frequent words.
    Note that "i" comes before "love" due to a lower alphabetical order.

    Example 2:
    
    Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4
    Output: ["the","is","sunny","day"]
    Explanation: "the", "is", "sunny" and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2 and 1 respectively.
     
    Constraints:
    
    1 <= words.length <= 500
    1 <= words[i].length <= 10
    words[i] consists of lowercase English letters.
    k is in the range [1, The number of unique words[i]]
 
    Problem:
    - Given an array of words and an int k, return an array of the k most frequent words.

    Questions:
    - Assume k will be <= words.count?
    - Assume k >= 1?
    - Assume all lowercase words?

    Input: words: [String], k: Int
    Output: [String]

    Examples:
    Input: words: ["i", "love", "you"], k: 1
    Output: ["i", "love", "you"]

    Input: words: ["hello", "hello", "world"], k: 2
    Output: ["world"]

    Algorithm:
    - Dictionary to store word frequencies [String: Int] => [word: freq]
    - Array size of words.count + 1 [[String]] => [[words]]
        - Enumerate over (word,freq) in Dictionary
        - Append words at index that matches freq count
*/
func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    var freqs: [String: Int] = [:]
    var order: [[String]] = Array(repeating: [], count: words.count + 1)

    for word in words {
        freqs[word, default: 0] += 1
    }

    for (word, freq) in freqs {
        order[freq].append(word)
    }

    var result: [String] = []

    for words in order.reversed() {
        for word in words.sorted() {
            result.append(word)
            if result.count == k { return result }
        }
    }

    return []
}