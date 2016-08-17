var Word = React.createClass({
    render: function() {
        return(
            <div id={this.props.key}>
              {this.props.children.toString()}
            </div>
        );
    }
});
