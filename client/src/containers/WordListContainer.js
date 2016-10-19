import $ from 'jquery';
import {connect} from 'react-redux';
import {requestWords, receiveWords, receiveErrors } from '../actions/index.js';
import WordList from '../components/WordList.jsx';

const mapStateToProps = (state) => {
    return {
        words: state.words
    };
};

const WordListContainer = connect(
    mapStateToProps
)(WordList);

export default WordListContainer;
