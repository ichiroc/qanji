import { combineReducers } from 'redux';

const status = (state, action) =>{
    switch(action.type){
    case 'REQUEST_WORDS':
        return 'Loading';
    case 'RECEIVE_ERRORS':
        return 'Error occured: ' + action.error;
    case 'RECEIVE_WORDS':
        return action.words.length + ' words are detected.';
    default:
        return 'Initializing';
    }
};

const words = (state, action) =>{
    switch(action.type) {
    case 'RECEIVE_WORDS':
        return action.words;
    default:
        return [];
    }
};


const qanjiApp = combineReducers({
    status,
    words
});

export default qanjiApp;
