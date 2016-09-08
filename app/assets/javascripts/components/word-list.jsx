class WordList extends React.Component{
    constructor(props){
        super(props);
        this.sending = false;
        this.state = { data: { words: [] } };
    }

    fetchWords(){
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
    }

    componentDidMount(){
        this.fetchWords();
        this.intervalId = setInterval(this.fetchWords, 5000);
    }

    render (){
        var wordNodes = this.state.data.words.map(function(w){
            // TODO: ちゃんとデータの持ち方を設計する
            var wr = new WordRegion(document.getElementById('canvas'), w);
            wr.draw();
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
        );
    }
}
