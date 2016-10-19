import {connect} from 'react-redux';
import $ from 'jquery';
import {requestWords, receiveWords, receiveErrors} from '../actions/index.js';
import App from '../components/App.jsx';

const mapDispatchToProps = (dispatch) => {
    return {
        handleOnLoad: () => {
            dispatch(requestWords());
            $.ajax({
                url: location.pathname + '/words.json',
                dataType: 'json',
                cache: false })
                .done((response) => {
                    dispatch(receiveWords(response.words));
                })
                .fail( (err) => {
                    dispatch(receiveErrors(err));
                });

        }
    };
};



const AppContainer = connect(
    null,
    mapDispatchToProps
)(App);

export default AppContainer;
