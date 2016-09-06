var WordList = React.createClass({
    getInitialState: function(){
        return({data: { words: [] }});
    },
    fetchWords:function(){
        // 二重送信を防ぐ
        if(!this.sending){
            this.sending = true;
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
                    alert("Oops! Something goes wrong!");
                }.bind(this),
                complete: function(){
                    this.sending = false;
                }.bind(this)
            });
        }
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
