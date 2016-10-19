import React from 'react';
import WordListContainer from '../containers/WordListContainer';
import StatusContainer from '../containers/StatusContainer';
import ImageContainer from '../containers/ImageContainer';

export default class App extends React.Component {
    render() {
        return <div onLoad={ this.props.handleOnLoad() }>
            <StatusContainer />
            <ImageContainer />
            <WordListContainer onLoad={this.props.handleOnLoad()} />
            </div>;
    }
}
