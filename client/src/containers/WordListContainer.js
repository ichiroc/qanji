import $ from 'jquery';
import {connect} from 'react-redux';
import {requestWords, receiveWords, receiveErrors } from '../actions/index.js';
import WordList from '../components/WordList.jsx';

const mapStateToProps = (state) => {
    return {
        words: state.words
    };
};


const mapDispatchToProps = (dispatch) => {
    return {
        handleOnLoad: () => {
            // dispatch(requestWords());
            // $.ajax({
            //     url: location.pathname + '/words.json',
            //     dataType: 'json',
            //     cache: false })
            //     .done((response) => {
            //         dispatch(receiveWords(response.words));
            //     })
            //     .fail( (err) => {
            //         console.log(err);
            //         dispatch(receiveErrors(err));
            //     });

        }
    };
};


const WordListContainer = connect(
    mapStateToProps,
    mapDispatchToProps
)(WordList);

export default WordListContainer;
