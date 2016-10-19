require('!style!css!../node_modules/bootstrap/dist/css/bootstrap.css');
import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import qanjiApp from './reducers';
import AppContainer from './containers/AppContainer';
import $ from 'jquery';

let store = createStore(qanjiApp);

$(()=> {
    render(
            <Provider store={store}>
            <AppContainer />
            </Provider>,
        document.getElementById("word-list")
    );
});
