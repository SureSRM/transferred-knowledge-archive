export const suggest = (partial_word) =>
         fetch("http://localhost:3001/words?value_like=^" + partial_word);