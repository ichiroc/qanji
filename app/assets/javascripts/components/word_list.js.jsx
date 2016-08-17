var WordList = React.createClass({
    getInitialState:function() {
        return {data: [{id:"1", text: "foo1"},{id:"2", text:"bar"}]};
    },
    render: function() {
        var wordNodes = this.state.data.map(function(word){
            return(
                <Word key={word.id}>
                  {word.text}
                </Word>
            );
        });
        return(
            <div className="word-list">
              {wordNodes}
            </div>
        );
    }
});
