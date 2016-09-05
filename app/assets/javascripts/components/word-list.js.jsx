// var WordList = React.createClass({
//     getInitialState:function() {
//         return {data: [{id:"1", text: "foo1"},{id:"2", text:"bar"}]};
//     },
//     render: function() {
//         var wordNodes = this.state.data.map(function(word){
//             return(
//                 <Word key={word.id}>
//                   {word.text}
//                 </Word>
//             );
//         });
//         return(
//             <div className="word-list">
//               {wordNodes}
//             </div>
//         );
//     }
// });
var WordList = React.createClass({
    getInitialState: function(){
        return({data: { words: [] }});
    },
    fetchWords:function(){
        $.ajax({
            url: location.pathname + '/words.json',
            dataType: 'json',
            cache: false,
            success: function(data){
                if(data.status == "success"){
                    clearInterval(this.intervalId);
                }
                this.setState({data: data});
            }.bind(this),
            error: function(){
                alert("Oops! Somethings goes wrong!");
            }.bind(this)
        });
    },
    componentDidMount: function(){
        this.fetchWords();
        this.intervalId = setInterval(this.fetchWords, 5000);
    },
    render: function(){
        var wordNodes = this.state.data.words.map(function(w){
            return <Word key={w.id} text={w.text} english={w.english} category={w.category} score={w.score} />;
        });

        if(wordNodes.length == 0 ){
            return <Loading />;
        }

        return(
            <table>
              <thead>
                <tr>
                  <th>Word</th>
                  <th>English</th>
                  <th>Category</th>
                  <th>Score</th>
                </tr>
              </thead>
              <tbody>
                {wordNodes}
              </tbody>
            </table>
        );}
});
