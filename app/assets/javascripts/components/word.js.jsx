var Word = React.createClass({
    render:function(){
        return(
            <tr>
              <td>{this.props.text}</td>
              <td>{this.props.english}</td>
              <td>{this.props.category}</td>
              <td>{this.props.score}</td>
            </tr>
        );
    }
});
