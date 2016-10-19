// requestWords
export const requestWords = () =>{
    return{
        type: 'REQUEST_WORDS'
    };
};

// fetchWords

export const receiveWords = (words) =>{
    return{
        type: 'RECEIVE_WORDS',
        words
    };
};

// fetchErrors
export const receiveErrors = (error) => {
    return{
        type: 'RECEIVE_ERRORS',
        error
    };
};
