import React from 'react';
export default class Word extends React.Component{
    render(){
        return(
            <tr>
              <td>{this.props.text}</td>
              <td>{this.props.english}</td>
              <td>{this.props.category}</td>
              <td>{this.props.score}</td>
            </tr>
        );
    }
}
